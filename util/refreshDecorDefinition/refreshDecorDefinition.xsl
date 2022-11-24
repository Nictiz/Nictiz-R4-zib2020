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
            <xd:p><xd:b>Created on:</xd:b> October 17, 2022</xd:p>
            <xd:p><xd:b>Author:</xd:b> Jorn Duwel</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output omit-xml-declaration="yes"/>
    
    <xsl:param name="output">../zib2020bbr-decor.xml</xsl:param>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="/" name="refreshDecorDefinition">
        <xsl:message>Output file     : <xsl:value-of select="$output"/></xsl:message>
        
        <xsl:variable name="decorUri" select="'https://decor.nictiz.nl/decor/services/RetrieveProject?prefix=zib2020bbr-&amp;mode=verbatim&amp;download=true&amp;format=xml'"/>
        
        <xsl:result-document href="{$output}" method="xml">
            <xsl:copy-of select="doc($decorUri)/*"/>
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>