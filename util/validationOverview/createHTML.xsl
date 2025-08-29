<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:nf="http://nictiz.nl/xsl/functions"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="html" indent="yes"/>
    
    <xsl:import href="parseMarkdown.xsl"/>
    
    <xsl:template name="main">
        <xsl:variable name="map" as="element()*">
            <xsl:call-template name="parseMarkdown"/>
        </xsl:variable>

        <xsl:value-of select="'{%capture preamble %}&#10;'"/>
        <xsl:value-of select="$map[local-name() = 'preamble']"/>
        <xsl:value-of select="'{%endcapture%}&#10;'"/>
        
        <xsl:for-each select="$map[local-name() = 'zib']">
            <xsl:if test=".[remark]">
                <xsl:value-of select="concat('{%capture remarks-', translate(./@name, ' .()', '_'), ' %}&#10;')"/>
                <xsl:copy-of select="string-join(./remark, '&#10;&#10;')"/>
                <xsl:value-of select="'&#10;{%endcapture%}&#10;'"/>
            </xsl:if>
        </xsl:for-each>
        
        <div xmlns="http://www.w3.org/1999/xhtml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir ../../input-cache/schemas/R5/fhir-single.xsd">
            {{ preamble | markdownify }}
            <table class="grid">
                <thead>
                    <tr>
                        <th>Zib name</th>
                        <th>Profile(s)</th>
                        <th>Validation status</th>
                        <th>Remarks</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="$map[local-name() = 'zib']">
                        <tr>
                            <xsl:choose>
                                <xsl:when test="./status/text() = 'validated'">
                                    <xsl:attribute name="class" select="'validated'"/>
                                </xsl:when>
                                <xsl:when test="./status/text() = 'in progress'">
                                    <xsl:attribute name="class" select="'in-progress'"/>
                                </xsl:when>
                                <xsl:when test="./status/text() = 'rejected'">
                                    <xsl:attribute name="class" select="'rejected'"/>
                                </xsl:when>
                                <xsl:when test="./status/text() = 'not submitted for validation'">
                                    <xsl:attribute name="class" select="'not-submitted'"/>
                                </xsl:when>
                            </xsl:choose>
                            <td>
                                <xsl:variable name="parts" select="tokenize(./@name, ' ')"/>
                                <xsl:variable name="url" select="concat('https://zibs.nl/wiki/', $parts[1], '-', $parts[2], '(2020EN)')"/>
                                <a href="{$url}"><xsl:value-of select="./@name"/></a>
                            </td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="count(./profile) = 1">
                                        <a href="{nf:_profileUrl(./profile/text())}"><xsl:value-of select="./profile/text()"/></a>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <ul>
                                            <xsl:for-each select="./profile">
                                                <li><a href="{nf:_profileUrl(./text())}"><xsl:value-of select="./text()"/></a></li>
                                            </xsl:for-each>
                                        </ul>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td>
                                <xsl:value-of select="./status/text()"/>
                            </td>
                            <td>
                                <xsl:if test=".[remark]">
                                    <xsl:value-of select="concat('{{ remarks-', translate(./@name, ' .()', '_'), ' | markdownify }}')"/>
                                </xsl:if>
                            </td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </div>
    </xsl:template>
    
    <xsl:function name="nf:_profileUrl">
        <xsl:param name="name"/>
        
        <xsl:value-of select="concat('StructureDefinition-', $name, '.html')"/>
    </xsl:function>
</xsl:stylesheet>