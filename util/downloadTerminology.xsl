<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:f="http://hl7.org/fhir"
    xmlns:nf="http://nictiz.nl/xsl/functions"
    exclude-result-prefixes="#all"
    version="2.0">
    <xsl:output omit-xml-declaration="yes"/>

    <xsl:param name="sourceDir" as="xs:string">../resources/</xsl:param>

    <xsl:template name="main">
    
        <xsl:call-template name="foo">
            <xsl:with-param name="overwrite" select="false()"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="foo">
        <xsl:param name="overwrite" as="xs:boolean" select="false()"/>

        <xsl:variable name="valueSetsPresent" select="nf:getValueSetsPresent($sourceDir)"/>
        <xsl:for-each select="nf:getRequiredValueSets($sourceDir)//valueset">
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
                    <xsl:message select="concat('Duplicate found for ValueSet with uri ', ./@uri, ':')"/>
                    <xsl:for-each select="$present">
                        <xsl:message select="concat('- ', base-uri())"/>
                    </xsl:for-each>
                    <xsl:message>ValueSet will not be downloaded. Please resolve the conflict first!</xsl:message>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xsl:function name="nf:getRequiredValueSets" as="node()">
        <xsl:param name="sourceDir"/>

        <xsl:variable name="uris"
            select="collection(concat($sourceDir, '?select=*.xml;recurse=yes'))/(f:StructureDefinition | f:ConceptMap | f:ValueSet)//@value[starts-with(., 'http://decor.nictiz.nl/fhir/')][not(parent::f:source/parent::f:meta)]" as="attribute()*"/>

        <xsl:variable name="nodes">
            <xsl:for-each-group select="$uris" group-by="string(.)">
                <valueset>
                    <xsl:attribute name="uri" select="current-grouping-key()"/>
                    <xsl:attribute name="outputDir" select="nf:getOutputPath($sourceDir, current-group())"/>
                </valueset>   
            </xsl:for-each-group>
        </xsl:variable>
        <valuesetmeta>
            <xsl:copy-of select="$nodes"/>
        </valuesetmeta>
    </xsl:function>

    <xsl:function name="nf:getValueSetsPresent" as="node()*">
        <xsl:param name="sourceDir"/>
        <xsl:copy-of select="collection(concat($sourceDir, '?select=*.xml;recurse=yes'))/f:ValueSet"/>
    </xsl:function>

    <xsl:template name="downloadValueSet">
        <xsl:param name="uri" required="yes" as="xs:string"/>
        <xsl:param name="outputDir" required="yes" as="xs:string"/>
        <xsl:param name="oldFilePath" required="no"/>

        <xsl:message select="$uri"/>

        <!-- Get and rewrite ValueSet -->
        <xsl:variable name="downloadURI" select="replace($uri, '^http(s?)://decor.nictiz.nl/fhir/ValueSet', 'https://decor.nictiz.nl/fhir/4.0/public/ValueSet')"/>
        <!--<xsl:variable name="valueSet" as="element()?">
            <xsl:apply-templates mode="rewrite" select="doc($downloadURI)/*"/>
        </xsl:variable>-->
        <xsl:variable name="valueSet" select="doc($downloadURI)"/>

        <!-- Construct file name -->
        <xsl:variable name="name" select="$valueSet/descendant-or-self::f:ValueSet/f:name/@value"/>
        <xsl:variable name="idVersion" select="tokenize($uri, '/')[last()]"/>
        <xsl:variable name="fileName" select="concat('ValueSet-', $name, '-', $idVersion, '.xml')"/>

        <xsl:message select="concat('Writing ', string-join(($outputDir, $fileName), '/'))"/>
        <xsl:result-document href="{string-join(($outputDir, $fileName), '/')}" indent="yes" method="xml" omit-xml-declaration="yes">
            <xsl:copy-of select="$valueSet"/>
        </xsl:result-document>
    </xsl:template>

    <xsl:function name="nf:getOutputPath" as="xs:string">
        <xsl:param name="sourceDir" as="xs:string"/>
        <xsl:param name="uriAttributes" as="attribute()*"/>

        <xsl:choose>
            <xsl:when test="(for $uri in $uriAttributes return contains(base-uri($uri), '/resoures/zib')) != false()">
                <xsl:value-of select="concat($sourceDir, 'nl-core/terminology/')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat($sourceDir, 'zib/terminology/')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
</xsl:stylesheet>