<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:f="http://hl7.org/fhir"
    xmlns:nf="http://nictiz.nl/xsl/functions"
    exclude-result-prefixes="#all"
    version="2.0">
    <xsl:output omit-xml-declaration="yes"/>
    <xsl:include href="rewriteTerminologyResource.xsl"/>

    <xsl:param name="sourceDir" as="xs:string">../../resources/</xsl:param>
    
    <xsl:template name="main">

        <xsl:call-template name="handleValueSetBindings">
            <xsl:with-param name="overwrite" select="false()"/>
        </xsl:call-template>
    </xsl:template>

    <!--
        Main template to download ValueSet resources based on the bindings in other resources.
        This template will be called recursively because freshly added ValueSets might include references to other
        ValueSets, so we need to keep on processing until no new bindings appear anymore.
        Parameters:
        - alreadyHandled: a list of bindings that already has been processed. See fn:findValueSetBindings() for
                          documentation on the format.
        - overwrite: if true, all ValueSets will be downloaded, even if they already exist.
    -->
    <xsl:template name="handleValueSetBindings">
        <xsl:param name="overwrite" as="xs:boolean" select="false()"/>
        <xsl:param name="alreadyHandled" as="element(binding)*" select="()"/>

        <xsl:variable name="valueSetsPresent" select="nf:getValueSetsPresent($sourceDir)"/>

        <!-- Process all ValueSet bindings that were not handled yet -->
        <xsl:variable name="bindings" select="nf:findValueSetBindings($sourceDir, $alreadyHandled)"/>
        <xsl:for-each select="$bindings">
            <xsl:variable name="uri" select="string(@uri)"/>
            <xsl:variable name="present" select="$valueSetsPresent[f:url/@value = $uri]"/>
            <xsl:choose>
                <xsl:when test="count($present) = 1">
                    <xsl:if test="$overwrite = true()">
                        <xsl:call-template name="downloadValueSet">
                            <xsl:with-param name="uri" select="$uri"/>
                            <xsl:with-param name="outputDir" select="@outputDir"/>
                            <xsl:with-param name="oldFilePath" select="base-uri($present)"/>
                        </xsl:call-template>
                    </xsl:if>
                </xsl:when>
                <xsl:when test="count($present) = 0">
                    <xsl:call-template name="downloadValueSet">
                        <xsl:with-param name="uri" select="$uri"/>
                        <xsl:with-param name="outputDir" select="@outputDir"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:message>====================</xsl:message>
                    <xsl:message select="concat('Duplicate found for ValueSet with uri ', ./@uri, ':')"/>
                    <xsl:for-each select="$present">
                        <xsl:message select="concat('- ', base-uri())"/>
                    </xsl:for-each>
                    <xsl:message>ValueSet will not be downloaded. Please resolve the conflict first!</xsl:message>
                    <xsl:message>====================</xsl:message>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>

        <!--
            If we have processed new bindings, we should check the (possibly) added ValueSets again for ValueSet
            bindings. So we call this template again. -->
        <xsl:if test="count($bindings) &gt; 0">
            <xsl:call-template name="handleValueSetBindings">
                <xsl:with-param name="alreadyHandled" select="($alreadyHandled | $bindings)"/>
                <xsl:with-param name="overwrite" select="$overwrite"/>
            </xsl:call-template>           
        </xsl:if>
    </xsl:template>

    <!--
        This function scans the source dir for all ValueSet bindings that have not been processed so far.
        Both the output and the alreadyHandled parameters are a list of elements called 'binding' with two attributes:
        - uri: the canonical uri of the ValueSet to handle
        - outputDir: the dir where the resulting file should be placed (based on the location of the files that
                     reference the ValueSet, and determined by fn:getOutputDir()
    -->
    <xsl:function name="nf:findValueSetBindings" as="element(binding)*">
        <xsl:param name="sourceDir"/>
        <xsl:param name="alreadyHandled" as="element(binding)*"/>

        <xsl:variable name="uris"
            select="collection(concat($sourceDir, '?select=*.xml;recurse=yes'))/(f:StructureDefinition | f:ConceptMap | f:ValueSet)//@value[starts-with(., 'http://decor.nictiz.nl/fhir/')][not(parent::f:source/parent::f:meta)]" as="attribute()*"/>

        <xsl:variable name="bindings" as="element(binding)*">
            <xsl:for-each-group select="$uris" group-by="string(.)">
                <xsl:if test="not($alreadyHandled[string(@uri) = current-grouping-key()])">
                    <binding>
                        <xsl:attribute name="uri" select="current-grouping-key()"/>
                        <xsl:attribute name="outputDir" select="nf:getOutputDir($sourceDir, current-group())"/>
                    </binding>       
                </xsl:if>
            </xsl:for-each-group>
        </xsl:variable>
        <xsl:copy-of select="$bindings"/>
    </xsl:function>

    <xsl:function name="nf:getValueSetsPresent" as="node()*">
        <xsl:param name="sourceDir"/>
        <xsl:copy-of select="collection(concat($sourceDir, '?select=*.xml;recurse=yes'))/f:ValueSet"/>
    </xsl:function>

    <xsl:template name="downloadValueSet">
        <xsl:param name="uri" required="yes" as="xs:string"/>
        <xsl:param name="outputDir" required="yes" as="xs:string"/>
        <xsl:param name="oldFilePath" required="no"/>

        <!-- Get and rewrite ValueSet -->
        <xsl:variable name="downloadURI" select="replace($uri, '^http(s?)://decor.nictiz.nl/fhir/ValueSet', 'https://decor.nictiz.nl/fhir/4.0/public/ValueSet')"/>
        <xsl:variable name="valueSet" as="element()?">
            <xsl:apply-templates mode="rewrite" select="doc($downloadURI)/*"/>
        </xsl:variable>
        
        <!-- Construct file name -->
        <xsl:variable name="name" select="$valueSet/descendant-or-self::f:ValueSet/f:name/@value"/>
        <xsl:variable name="idVersion" select="tokenize($uri, '/')[last()]"/>
        <xsl:variable name="fileName" select="concat('ValueSet-', $name, '-', $idVersion, '.xml')"/>

        <xsl:variable name="outputURI" select="string(resolve-uri(concat($outputDir, $fileName)))"/>
        <xsl:if test="(string-length($oldFilePath) &gt; 0) and ($outputURI != $oldFilePath)">
            <xsl:message>====================</xsl:message>
            <xsl:message>ValueSet is re-downloaded, but saved under a different name!</xsl:message>
            <xsl:message select="concat('- Old name: ', $oldFilePath)"/>
            <xsl:message select="concat('- New name: ', $outputURI)"/>
            <xsl:message>You should manually remove the old file!</xsl:message>
            <xsl:message>====================</xsl:message>
        </xsl:if>

        <!-- Write out the file -->
        <xsl:message select="concat('Writing ', resolve-uri(concat($outputDir, $fileName)))"/>
        <xsl:result-document href="{concat($outputDir, $fileName)}" indent="yes" method="xml" omit-xml-declaration="yes">
            <xsl:copy-of select="$valueSet"/>
        </xsl:result-document>
    </xsl:template>

    <xsl:function name="nf:getOutputDir" as="xs:string">
        <xsl:param name="sourceDir" as="xs:string"/>
        <xsl:param name="uriAttributes" as="attribute()*"/>

        <xsl:choose>
            <xsl:when test="(for $uri in $uriAttributes return contains(base-uri($uri), '/resources/zib')) != false()">
                <xsl:value-of select="concat($sourceDir, 'zib/terminology/')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat($sourceDir, 'nl-core/terminology/')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
</xsl:stylesheet>