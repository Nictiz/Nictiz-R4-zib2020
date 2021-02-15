<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:loc="urn:local:urn"
    xmlns:f="http://hl7.org/fhir"
    xmlns="http://hl7.org/fhir"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:output indent="yes"/>
    
    <!-- Show (optional) warnings to 'validate' content of profile -->
    <xsl:param name="showWarnings" select="true()"/>
    <!-- Zib2020 decor project file -->
    <xsl:param name="allDatasets" select="document('zib2020bbr-decor.xml')/decor/datasets"/>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="f:element[f:mapping/f:map[starts-with(@value,'NL-CM:')]]">
        <!-- Caveat: if multiple mappings are applied, checks only first -->
        <xsl:variable name="value" select="(f:mapping/f:map[starts-with(@value,'NL-CM:')]/@value)[1]"/>
        <xsl:variable name="valueOid" select="replace($value,'NL-CM:','2.16.840.1.113883.2.4.3.11.60.40.1.')"/>
        <xsl:variable name="concept" select="$allDatasets//concept[@id = $valueOid]"/>
        <xsl:choose>
            <xsl:when test="not($concept)">
                <xsl:message>Could not find a concept with map '<xsl:value-of select="$value"/>'</xsl:message>
                <xsl:copy>
                    <xsl:apply-templates select="node()|@*"/>
                </xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="originalConcept" select="loc:getOriginalConcept($concept)"/>
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:apply-templates select="f:path | f:representation | f:sliceName | f:sliceIsConstraining | f:label | f:code | f:slicing"/>
                    <xsl:choose>
                        <xsl:when test="f:short">
                            <xsl:apply-templates select="f:short"/>
                            <xsl:if test="$showWarnings and $originalConcept/name[@language='en-US']/text() and not(f:short/@value = $originalConcept/name[@language='en-US']/text())">
                                <xsl:message>Element with id '<xsl:value-of select="@id"/>' has short '<xsl:value-of select="f:short/@value"/>' which does not correspond with Zib2020 value '<xsl:value-of select="$originalConcept/name[@language='en-US']/text()"/>'.</xsl:message>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="$originalConcept/name[@language='en-US']/text()">
                            <short value="{$originalConcept/name[@language='en-US']/text()}"/>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="f:definition">
                            <xsl:apply-templates select="f:definition"/>
                            <xsl:if test="$showWarnings and $originalConcept/desc[@language='en-US']/text() and not(f:definition/@value = $originalConcept/desc[@language='en-US']/text())">
                                <xsl:message>Element with id '<xsl:value-of select="@id"/>' has definition '<xsl:value-of select="f:definition/@value"/>' which does not correspond with Zib2020 value '<xsl:value-of select="$originalConcept/desc[@language='en-US']/text()"/>'.</xsl:message>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="$originalConcept/desc[@language='en-US']/text()">
                            <definition value="{$originalConcept/desc[@language='en-US']/text()}"/>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:apply-templates select="f:comment | f:requirements"/>
                    <xsl:choose>
                        <xsl:when test="f:alias">
                            <xsl:apply-templates select="f:alias"/>
                            <xsl:if test="$showWarnings and $originalConcept/name[@language='nl-NL']/text() and not(f:alias/@value = $originalConcept/name[@language='nl-NL']/text())">
                                <xsl:message>Element with id '<xsl:value-of select="@id"/>' has alias '<xsl:value-of select="f:alias/@value"/>' which does not correspond with Zib2020 value '<xsl:value-of select="$originalConcept/name[@language='nl-NL']/text()"/>'.</xsl:message>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="$originalConcept/name[@language='nl-NL']/text()">
                            <alias value="{$originalConcept/name[@language='nl-NL']/text()}"/>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:apply-templates select="f:*[not(local-name() = ('path','representation','sliceName','sliceIsConstraining','label','code','slicing','short','definition','comment','requirements','alias'))]">
                        <xsl:with-param name="originalConcept" select="$originalConcept" tunnel="yes"/>
                    </xsl:apply-templates>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
    <xsl:template match="f:mapping[f:map[starts-with(@value,'NL-CM:')]]">
        <xsl:param name="originalConcept" tunnel="yes"/>
        <xsl:choose>
            <xsl:when test="$originalConcept">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:apply-templates select="f:identity | f:language | f:map"/>
                    <xsl:choose>
                        <xsl:when test="f:comment">
                            <xsl:apply-templates select="f:comment"/>
                            <xsl:if test="$showWarnings and $originalConcept/name[@language='en-US']/text() and not(f:comment/@value = $originalConcept/name[@language='en-US']/text())">
                                <xsl:message>Element with id '<xsl:value-of select="parent::f:element/@id"/>' has mapping.comment '<xsl:value-of select="f:comment/@value"/>' which does not correspond with Zib2020 value '<xsl:value-of select="$originalConcept/name[@language='en-US']/text()"/>'.</xsl:message>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="$originalConcept/name[@language='en-US']/text()">
                            <comment value="{$originalConcept/name[@language='en-US']/text()}"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="node()|@*"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:function name="loc:getOriginalConcept" as="element()">
        <xsl:param name="elem" as="element()"/>
        <xsl:choose>
            <xsl:when test="$elem/inherit">
                <xsl:variable name="cid" select="$elem/inherit/@ref"/>
                <xsl:variable name="ced" select="$elem/inherit/@effectiveDate"/>
                <xsl:variable name="theConcept" select="$allDatasets//concept[not(ancestor::history)][@id=$cid][@effectiveDate=$ced]" as="element()*"/>
                <xsl:copy-of select="loc:getOriginalConcept($theConcept)"/>
            </xsl:when>
            <xsl:when test="$elem/contains">
                <xsl:variable name="cid" select="$elem/contains/@ref"/>
                <xsl:variable name="ced" select="$elem/contains/@flexibility"/>
                <xsl:variable name="theConcept" select="$allDatasets//concept[not(ancestor::history)][@id=$cid][@effectiveDate=$ced]" as="element()*"/>
                <xsl:copy-of select="loc:getOriginalConcept($theConcept)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="$elem"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
</xsl:stylesheet>