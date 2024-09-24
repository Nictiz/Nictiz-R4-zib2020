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
        <xd:desc>Inject empty narrative if not present</xd:desc>
    </xd:doc>
    <xsl:template match="(f:ValueSet | f:CodeSystem)" mode="rewrite">
        <xsl:element name="{local-name(.)}">
            <xsl:apply-templates select="f:id | f:meta | f:implicitRules | f:language" mode="rewrite"/>
            <xsl:choose>
                <xsl:when test="f.text">
                    <xsl:copy-of select="f:text"/>
                </xsl:when>
                <xsl:otherwise>
                    <text>
                        <status value="empty"/>
                        <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
                            <xsl:if test="f:language[@value]">
                                <xsl:attribute name="lang">
                                    <xsl:value-of select="f:language/@value"/>
                                </xsl:attribute>
                                <xsl:attribute name="xml:lang">
                                    <xsl:value-of select="f:language/@value"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when test="f:language/@value = 'nl-NL'">Definitie-resources zijn niet voorzien van een narrative. Een menselijk leesbare versie is te vinden via de implementation guide(s) waarin deze resource gebruikt wordt.</xsl:when>
                                <xsl:otherwise>No narrative is provided for definitional resources. A human-readable rendering can be found in the implementation guide(s) where this resource is used.</xsl:otherwise>
                            </xsl:choose>
                        </xsl:element   >
                    </text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates select="*[not(self::f:id | self::f:meta | self::f:implicitRules | self::f:language)]" mode="rewrite"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc>Set time zone to +00:00. This is technically not a _correct_ thing to do, but ART-DECOR will just use midnight plus the current time offset according to DST, so technically the input isn't correct either as the result will change when DST changes.</xd:desc>
    </xd:doc>
    <xsl:template match="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/resource-effectivePeriod']/f:valuePeriod/f:start" mode="rewrite">
        <start value="{replace(./@value, '[\+-][0-9]{2}:[0-9]{2}', '+00:00')}"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>In ART-DECOR, half a fix is released for the 'deprecated' property in CodeSystems; the property declaration has been fixed and changed to 'deprecationDate', but the use of this property has not been fixed. This leads to a lot of rejections by the Validator, so we'll fix it in post. See https://nictiz.atlassian.net/browse/AD-690 for more information.</xd:desc>
    </xd:doc>
    <xsl:template match="f:code[@value='deprecated' and parent::f:property/parent::f:concept/parent::f:CodeSystem]" mode="rewrite">
        <code value="deprecationDate"/>
    </xsl:template>
</xsl:stylesheet>