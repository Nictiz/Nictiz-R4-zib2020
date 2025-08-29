<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:param name="csvPath" select="'../../validation-status.csv'"/>
    
    <xsl:template name="main">
        <xsl:variable name="lines" select="tokenize(unparsed-text($csvPath), '\n')"/>
        <xsl:variable name="map">
            <map>
                <xsl:for-each select="1 to count($lines)">
                    <xsl:call-template name="parseFullLine">
                        <xsl:with-param name="lines" select="$lines"/>
                        <xsl:with-param name="lineNumber" select="."/>
                    </xsl:call-template>                    
                </xsl:for-each>
            </map>
        </xsl:variable>
        
        <xsl:message select="count($map/zib)"/>
    </xsl:template>
    
    <!--
        Try to parse the line as a full line, that is, a line starting with a zib name. If the line is a full line, a
        new zib entry is created and populated, and subsequenty partial lines are parsed to complete it.
        If not, this template does nothing.
    -->
    <xsl:template name="parseFullLine">
        <xsl:param name="lines" as="xs:string*"/>
        <xsl:param name="lineNumber" as="xs:integer"/>
        
        <xsl:variable name="cells" select="tokenize($lines[$lineNumber], '\s*;\s*')"/>
        <xsl:choose>
            <xsl:when test="normalize-space($cells[1]) = ''"/>
            <xsl:otherwise>
                <zib name="{$cells[1]}">
                    <profile><xsl:value-of select="$cells[2]"/></profile>
                    <status><xsl:value-of select="$cells[3]"/></status>
                    <xsl:if test="normalize-space($cells[4]) != ''">
                        <remark><xsl:value-of select="$cells[4]"/></remark>
                    </xsl:if>
                    
                    <!-- Add partial lines, if any -->
                    <xsl:call-template name="parsePartialLines">
                        <xsl:with-param name="lines" select="$lines"/>
                        <xsl:with-param name="fromLineNumber" select="$lineNumber + 1"/>
                    </xsl:call-template>
                </zib>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!--
        Try to parse the line as a partial line, that is a line that doesn't start with a zib name.
        profile and remark tags will be created for the populated cells, and this template will call itself
        subsequently until a partial lines are parsed.
        If the line isn't a partial line, the template will do nothing.
    -->
    <xsl:template name="parsePartialLines">
        <xsl:param name="lines" as="xs:string*"/>
        <xsl:param name="fromLineNumber" as="xs:integer"/>

        <xsl:choose>
            <!-- Exit early when we're past the last line -->
            <xsl:when test="$fromLineNumber &gt; count($lines)"/>
            <xsl:otherwise>
                <xsl:variable name="cells" select="tokenize($lines[$fromLineNumber], '\s*;\s*')"/>
                <xsl:choose>
                    <!-- Exit when this is not a partial line -->
                    <xsl:when test="normalize-space($cells[1]) != ''"/>
                    
                    <!-- Otherwise, parse the cells and call this template again -->
                    <xsl:otherwise>
                        <xsl:if test="not(normalize-space($cells[2]) = '')">
                            <profile><xsl:value-of select="$cells[2]"/></profile>
                        </xsl:if>
                        <xsl:if test="not(normalize-space($cells[4]) = '')">
                            <remark><xsl:value-of select="$cells[4]"/></remark>
                        </xsl:if>
                        <xsl:call-template name="parsePartialLines">
                            <xsl:with-param name="lines" select="$lines"/>
                            <xsl:with-param name="lineNumber" select="$fromLineNumber + 1"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>   
</xsl:stylesheet>