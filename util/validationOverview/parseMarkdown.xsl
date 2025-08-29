<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:nf="http://nictiz.nl/xsl/functions"
    exclude-result-prefixes="xs"
    version="2.0">
        
    <xsl:template name="parseMarkdown" as="element()*">
        <xsl:param name="mdPath" select="'../../validation-status.md'"/>
        <xsl:param name="errorLevel" select="'fail'" as="xs:string"/>
        
        <xsl:variable name="lines" select="tokenize(unparsed-text($mdPath), '\n')"/>
        
        <preamble>
            <xsl:variable name="preambleCutoff" select="index-of($lines, $lines[starts-with(., '###')][1]) - 1"/>
            <xsl:copy-of select="string-join(subsequence($lines, 1, $preambleCutoff), '&#10;')"/>
        </preamble>
        
        <xsl:for-each select="1 to count($lines)">
            <xsl:copy-of select="nf:_parseZib($lines, ., $errorLevel)"/>
        </xsl:for-each>
    </xsl:template>
    
    <!--
        Try to parse the line as a new zib entry. If the line is a zib entry, a new zib entry is created and subsequent
        content lines are parsed to complete it.
        If not, this function does nothing (so it can be safely called with non-matching lines when iterating over the
        the file contents).
    -->
    <xsl:function name="nf:_parseZib">
        <xsl:param name="lines" as="xs:string+"/>
        <xsl:param name="lineNumber" as="xs:integer"/>
        <xsl:param name="errorLevel" as="xs:string"/>
        
        <xsl:analyze-string select="$lines[$lineNumber]" regex="^###\s+(.+)\s*$">
            <xsl:matching-substring>
                <zib name="{regex-group(1)}">
                    <xsl:copy-of select="nf:_parseContent($lines, $lineNumber + 1, '', $errorLevel)"/>
                </zib>
            </xsl:matching-substring>
        </xsl:analyze-string>
    </xsl:function>
    
    <!--
        Try to parse the line as a content line. This can either be a bullet followed by a key : vale pair,
        or an indented line with a bullet and a value.
        If the line is parsed as a content line, it will call itself again until a non-content line is encountered,
        adding tags for <status>, <profile> and <remark> along the way.
    -->
    <xsl:function name="nf:_parseContent">
        <xsl:param name="lines" as="xs:string+"/>
        <xsl:param name="fromLineNumber" as="xs:integer"/>
        <xsl:param name="tagName" as="xs:string"/> <!-- Needed for indented lines, ignored otherwise -->
        <xsl:param name="errorLevel" as="xs:string"/>

        <xsl:analyze-string select="$lines[$fromLineNumber]" regex="^\*\s+(.+?)\s*:\s*(.*)\s*$">
            <xsl:matching-substring>
                <xsl:variable name="key" select="lower-case(regex-group(1))"/>
                <xsl:variable name="value" select="regex-group(2)"/>
                <xsl:choose>
                    <xsl:when test="$key = 'status'">
                        <xsl:variable name="statuses" select="'not submitted for validation', 'in progress', 'rejected', 'validated'"/>
                        <xsl:if test="not($value = $statuses)">
                            <xsl:value-of select="nf:_error($fromLineNumber, $errorLevel, concat('Status should be one of ', string-join($statuses, ', '), ', was +', $value, '+'))"/>
                        </xsl:if>
                        <status><xsl:value-of select="$value"/></status>
                        <xsl:copy-of select="nf:_parseContent($lines, $fromLineNumber + 1, '', $errorLevel)"/>
                    </xsl:when>
                    <xsl:when test="$key = 'profile' or $key = 'profiles'">
                        <xsl:if test="string-length($value) != 0">
                            <profile><xsl:value-of select="$value"/></profile>
                        </xsl:if>
                        <xsl:copy-of select="nf:_parseContent($lines, $fromLineNumber + 1, 'profile', $errorLevel)"/>
                    </xsl:when>
                    <xsl:when test="$key = 'remark' or $key = 'remarks'">
                        <xsl:if test="string-length($value) != 0">
                            <remark><xsl:value-of select="$value"/></remark>
                        </xsl:if>
                        <xsl:copy-of select="nf:_parseContent($lines, $fromLineNumber + 1, 'remark', $errorLevel)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="nf:_error($fromLineNumber, $errorLevel, concat('Unrecognized key: ', $key))"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:matching-substring>
        </xsl:analyze-string>
        
        <xsl:analyze-string select="$lines[$fromLineNumber]" regex="^\s+\*\s+(.+)\s*$">
            <xsl:matching-substring>
                <xsl:element name="{$tagName}">
                    <xsl:value-of select="regex-group(1)"/>
                </xsl:element>
                <xsl:copy-of select="nf:_parseContent($lines, $fromLineNumber + 1, $tagName, $errorLevel)"/>
            </xsl:matching-substring>
        </xsl:analyze-string>
        
    </xsl:function>
    
    <xsl:function name="nf:_error">
        <xsl:param name="lineNumber" as="xs:integer"/>
        <xsl:param name="errorLevel" as="xs:string"/>
        <xsl:param name="msg" as="xs:string"/>
        
        <xsl:variable name="fullMessage" select="concat('Line ', $lineNumber, ': ', $msg)"/>
        <xsl:choose>
            <xsl:when test="$errorLevel = 'fail'">
                <xsl:message terminate="yes" select="$fullMessage"/>
            </xsl:when>
            <xsl:when test="$errorLevel = 'warn'">
                <xsl:message terminate="no" select="$fullMessage"/>
            </xsl:when>
        </xsl:choose>
    </xsl:function>
</xsl:stylesheet>