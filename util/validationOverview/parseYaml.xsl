<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:param name="ymlPath" select="'../../validation-status.yml'"/>
    
    <xsl:template name="main">
        <xsl:variable name="map">
            <map>
                <xsl:for-each select="tokenize(unparsed-text($ymlPath), '\n')">
                </xsl:for-each>
            </map>
        </xsl:variable>
    </xsl:template>
</xsl:stylesheet>