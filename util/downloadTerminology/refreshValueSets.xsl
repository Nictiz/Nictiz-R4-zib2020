<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:f="http://hl7.org/fhir"
    xmlns="http://hl7.org/fhir"
    exclude-result-prefixes="#all"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> May 28, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> ahenket</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output omit-xml-declaration="yes"/>
    <xsl:include href="rewriteTerminologyResource.xsl"/>
    
    <xsl:param name="inputdir">../../resources/zib/</xsl:param>
    <xsl:param name="outputdir">
        <xsl:choose>
            <xsl:when test="not(contains($inputdir, '/'))">
                <xsl:message terminate="yes">Missing param inputdir with forward slashes. <xsl:value-of select="$inputdir"/></xsl:message>
            </xsl:when>
            <xsl:when test="ends-with($inputdir,'/')">
                <xsl:value-of select="concat(iri-to-uri($inputdir),'terminology/')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat(iri-to-uri($inputdir),'/terminology/')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:param>
    
    <xsl:variable name="resourceIds" select="collection(concat($inputdir, '?select=*.xml;recurse=yes'))//f:id/@value" as="attribute()*"/>
    <xsl:variable name="valueSetURIs" select="collection(concat($inputdir, '?select=*.xml;recurse=yes'))/(f:StructureDefinition | f:ConceptMap | f:ValueSet)//@value[starts-with(., 'http://decor.nictiz.nl/fhir/')][not(parent::f:source/parent::f:meta)]" as="attribute()*"/>
    <!-- Added meta.source as a hardcoded exception as this decor.nictiz.nl/fhir uri does not reference a ValueSet and does not resolve, leading to the process crashing -->
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="/" name="refreshValueSets">
        <xsl:message>Input dir     : <xsl:value-of select="$inputdir"/></xsl:message>
        <xsl:message>Output dir    : <xsl:value-of select="$outputdir"/></xsl:message>
        <xsl:message>Duplicate ids : <xsl:value-of select="count($resourceIds) - count(distinct-values($resourceIds))"/></xsl:message>
        <xsl:for-each-group select="$resourceIds" group-by=".">
            <xsl:if test="count(current-group()) gt 1">
                <xsl:message>Duplicate id <xsl:value-of select="current-grouping-key()"/></xsl:message>
            </xsl:if>
        </xsl:for-each-group>
        
        <xsl:for-each-group select="$valueSetURIs" group-by=".">
            <xsl:variable name="valueSetURI" select="replace(., '^http(s?)://decor.nictiz.nl/fhir/ValueSet', 'https://decor.nictiz.nl/fhir/4.0/public/ValueSet')"/>
            <xsl:variable name="valueSetURIExpand" select="concat($valueSetURI, '/$expand')"/>
            <xsl:variable name="valueSet" as="element()?">
                <xsl:apply-templates mode="rewrite" select="doc($valueSetURI)/*"/>
            </xsl:variable>
            <xsl:variable name="valueSetExpand" as="element()?">
              <!--<xsl:if test="empty($valueSet//f:include[not(f:concept)])">
                <xsl:copy-of select="doc($valueSetURIExpand)/*"/>
              </xsl:if>-->
            </xsl:variable>
            <!--<xsl:variable name="valueSetName" select="$valueSet/f:ValueSet/f:name/@value"/>-->
            <xsl:variable name="valueSetName" select="$valueSet/descendant-or-self::f:ValueSet/f:name/@value"/>
            
            <xsl:variable name="valueSetIdExists" select="$resourceIds[. = $valueSet/descendant-or-self::f:ValueSet/f:id/@value]"/>
            <xsl:message>ValueSet Canonical URI   : <xsl:value-of select="."/></xsl:message>
            <xsl:message>         Publication URI : <xsl:value-of select="$valueSetURI"/></xsl:message>
            <xsl:if test="$resourceIds[. = $valueSet/descendant-or-self::f:ValueSet/f:id/@value]">
                <xsl:for-each select="$valueSetIdExists">
                    <xsl:variable name="fileName" select="tokenize(document-uri(.), '/')[last()]"/>
                    <xsl:if test="not($fileName = $valueSetName)">
                        <xsl:message>         WARNING: This value set id <xsl:value-of select="."/> already exists as <xsl:value-of select="$fileName"/>. Please remove older files. The value set may have been renamed since previous download.</xsl:message>
                    </xsl:if>
                </xsl:for-each>
            </xsl:if>
            
            <xsl:variable name="valueSetIDVersion" select="tokenize(., '/')[last()]"/>
            <xsl:choose>
              <xsl:when test="$valueSetExpand[self::f:ValueSet]">
                <xsl:message>         INFO: Successful expansion of ValueSet id <xsl:value-of select="$valueSetIDVersion"/>. <xsl:value-of select="$valueSetExpand//f:details/@value"/></xsl:message>
                  <xsl:result-document href="{concat($outputdir,'ValueSet-',$valueSetName,'-',$valueSetIDVersion,'-expand.xml')}" indent="yes" method="xml" omit-xml-declaration="yes">
                  <xsl:copy-of select="$valueSetExpand"/>
                </xsl:result-document>
              </xsl:when>
              <xsl:otherwise>
                <xsl:message>         WARNING: Could not expand ValueSet id <xsl:value-of select="$valueSetIDVersion"/>. <xsl:value-of select="$valueSetExpand//f:details/@value"/></xsl:message>
                <xsl:message>         INFO: Successful retrieval of ValueSet id <xsl:value-of select="$valueSetIDVersion"/></xsl:message>
                <xsl:result-document href="{concat($outputdir,'ValueSet-',$valueSetName,'-',$valueSetIDVersion,'.xml')}" indent="yes" method="xml" omit-xml-declaration="yes">
                  <xsl:copy-of select="$valueSet"/>
                </xsl:result-document>
              </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each-group>
    </xsl:template>
</xsl:stylesheet>