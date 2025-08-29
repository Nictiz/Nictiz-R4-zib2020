<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:nf="http://nictiz.nl/xsl/functions"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text"/>
    
    <xsl:import href="parseMarkdown.xsl"/>
    
    <xsl:template name="main">
        <xsl:variable name="map" as="element()*">
            <xsl:call-template name="parseMarkdown"/>
        </xsl:variable>
        
| Zib name | Profile(s) | Validation status | Remarks |
|----------|------------|-------------------|---------|
                    <tbody>
                        <xsl:for-each select="$map">
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
                                <td><xsl:for-each select="./remark">
                                    <p><xsl:value-of select="./text()"/></p>
                                </xsl:for-each></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
        </html>
    </xsl:template>
    
    <xsl:function name="nf:_profileUrl">
        <xsl:param name="name"/>
        
        <xsl:value-of select="concat('StructureDefinition-', $name, '.html')"/>
    </xsl:function>
</xsl:stylesheet>