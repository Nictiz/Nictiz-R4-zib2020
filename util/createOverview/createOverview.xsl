<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:f="http://hl7.org/fhir"
    xmlns:nf="http://nictiz.nl/xsl/functions"
    exclude-result-prefixes="#all"
    version="2.0">
    <xsl:output omit-xml-declaration="yes"/>
    
    <xsl:param name="profileDir" select="'../../resources/zib'"/>

    <xsl:template name="main">
        <xsl:variable name="zibKeys" select="collection(concat($profileDir, '?select=zib-*.xml'))//f:mapping[starts-with(f:map/@value, 'NL-CM:')]"/>

        <xsl:variable name="zibProfiles" as="element(zib)+">
            <xsl:for-each-group
                select="collection(concat($profileDir, '?select=zib-*.xml'))//f:mapping[starts-with(f:name/@value, 'zib ')]"
                group-by="./f:identity/@value">
                <zib>
                    <xsl:attribute name="name" select="./f:name/@value"/>
                    <xsl:variable name="identity" select="current-grouping-key()"/>
                    <xsl:for-each-group 
                        select="$zibKeys[f:identity/@value = $identity]" 
                        group-by="./ancestor::f:StructureDefinition/f:url/@value">

                        <profile url="{current-grouping-key()}">
                            <xsl:if test="current-group()[f:identity/@value = $identity and ends-with(f:map/@value, '.1')]">
                                <xsl:attribute name="focal" select="'true'"/>
                            </xsl:if>
                        </profile>
                    </xsl:for-each-group>
                </zib>
            </xsl:for-each-group>
        </xsl:variable>
        
        <xsl:for-each select="$zibProfiles">
            <xsl:message select="string(./@name)"/>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>