<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:f="http://hl7.org/fhir"
    xmlns="http://hl7.org/fhir"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xd:doc scope="stylesheet">
        <xd:desc>Rewrite downloaded terminology resources where needed.</xd:desc>
    </xd:doc>
    
    <xsl:template match="node()|@*" mode="rewrite">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" mode="rewrite"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc>Set time zone to +00:00. This is technically not a _correct_ thing to do, but ART-DECOR will just use midnight plus the current time offset according to DST, so technically the input isn't correct either as the result will change when DST changes.</xd:desc>
    </xd:doc>
    <xsl:template match="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/resource-effectivePeriod']/f:valuePeriod/f:start" mode="rewrite">
        <start value="{replace(./@value, '[\+-][0-9]{2}:[0-9]{2}', '+00:00')}"/>
    </xsl:template>
</xsl:stylesheet>