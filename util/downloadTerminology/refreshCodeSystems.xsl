<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:f="http://hl7.org/fhir"
    exclude-result-prefixes="#all"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> May 28, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> ahenket</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output omit-xml-declaration="yes"/>
    <xsl:include href="rewriteTerminologyResource.xsl"/>
    
    <xsl:param name="inputdir">../../resources/zib/</xsl:param>
    <xsl:param name="outputdir">
        <xsl:choose>
            <xsl:when test="not(contains($inputdir, '/'))">
                <xsl:message terminate="yes">Missing param inputdir with forward slashes. <xsl:value-of select="$inputdir"/></xsl:message>
            </xsl:when>
            <xsl:when test="ends-with($inputdir,'/')">
                <xsl:value-of select="concat(iri-to-uri($inputdir),'terminology/')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat(iri-to-uri($inputdir),'/terminology/')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:param>
    
    <xsl:variable name="resourceIds" select="collection(concat($inputdir, '?select=*.xml;recurse=yes'))//f:id/@value" as="attribute()*"/>
    <xsl:variable name="codeSystemURIs" select="collection(concat($inputdir, '?select=*.xml;recurse=yes'))//f:system[starts-with(@value, 'http') or starts-with(@value, 'urn:')][not(parent::f:identifier or parent::f:patternIdentifier or contains(@value, 'urn:iso') or contains(@value, 'loinc.org') or contains(@value, 'snomed.info') or contains(@value, 'terminology.hl7.org') or @value = 'http://hl7.org/fhir/contact-point-system' or @value = 'http://hl7.org/fhir/contact-point-use' or @value = 'http://www.nanda.org/' or @value = 'https://nursing.uiowa.edu/cncce/nursing-interventions-classification-overview')]/@value" as="attribute()*"/>
    <!-- contact-point-system and contact-point-use are added as hardcoded exemptions, because we do reference them from ValueSets that restrict core ValueSets, but there is no need to include them in our package since they are already included in the core package,
    Nanda and NIC are added as hardcoded exemptions, because their URLs have changed in the latest release of HL7 Terminology to not start with 'terminology.hl7.org' anymore, but we still do not have to include them-->
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="/" name="refreshCodeSystems">
        <xsl:message>Input dir     : <xsl:value-of select="$inputdir"/></xsl:message>
        <xsl:message>Output dir    : <xsl:value-of select="$outputdir"/></xsl:message>
        <xsl:message>Duplicate ids : <xsl:value-of select="count($resourceIds) - count(distinct-values($resourceIds))"/></xsl:message>
        <xsl:for-each-group select="$resourceIds" group-by=".">
            <xsl:if test="count(current-group()) gt 1">
                <xsl:message>Duplicate id <xsl:value-of select="current-grouping-key()"/></xsl:message>
            </xsl:if>
        </xsl:for-each-group>
        
        <xsl:for-each-group select="$codeSystemURIs" group-by=".">
            <xsl:variable name="codeSystemURI">
                <xsl:choose>
                    <xsl:when test="starts-with(., 'urn:oid:')">
                        <xsl:value-of select="concat('https://decor.nictiz.nl/fhir/4.0/public/CodeSystem/', substring-after(., 'urn:oid:'))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat('https://decor.nictiz.nl/fhir/4.0/public/CodeSystem?url=', encode-for-uri(.))"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="codeSystem" as="element()?">
                <xsl:apply-templates select="doc($codeSystemURI)//f:CodeSystem" mode="rewrite"/>
            </xsl:variable> 
            <xsl:variable name="codeSystemName" select="$codeSystem/descendant-or-self::f:CodeSystem/f:name/@value"/>
            
            <xsl:variable name="codeSystemIdExists" select="$resourceIds[. = $codeSystem/descendant-or-self::f:CodeSystem/f:id/@value]"/>
            <xsl:message>CodeSystem Canonical URI : <xsl:value-of select="."/></xsl:message>
            <xsl:message>         Publication URI : <xsl:value-of select="$codeSystemURI"/></xsl:message>
            <xsl:if test="$resourceIds[. = $codeSystem/descendant-or-self::f:CodeSystem/f:id/@value]">
                <xsl:for-each select="$codeSystemIdExists">
                    <xsl:variable name="fileName" select="tokenize(document-uri(.), '/')[last()]"/>
                    <xsl:if test="not($fileName = $codeSystemName)">
                        <xsl:message>         WARNING: This code system id <xsl:value-of select="."/> already exists as <xsl:value-of select="$fileName"/>. Please remove older files. The code system may have been renamed since previous download.</xsl:message>
                    </xsl:if>
                </xsl:for-each>
            </xsl:if>
            
            <xsl:variable name="codeSystemIDVersion" select="tokenize(tokenize(., '/')[last()], ':')[last()]"/>
            <xsl:choose>
                <xsl:when test="$codeSystem">
                    <xsl:message>            INFO: Successful retrieval of CodeSystem id <xsl:value-of select="$codeSystemIDVersion"/></xsl:message>
                    <xsl:result-document href="{concat($outputdir,'codesystem-',$codeSystemName,'-',$codeSystemIDVersion,'.xml')}" indent="yes" method="xml" omit-xml-declaration="yes">
                        <xsl:copy-of select="$codeSystem"/>
                    </xsl:result-document>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:message>         WARNING: Could not retrieve CodeSystem id <xsl:value-of select="$codeSystemIDVersion"/>.</xsl:message>
                    <xsl:result-document href="{concat($outputdir,'unknown-codesystem-',$codeSystemIDVersion,'.xml')}" indent="yes" method="xml" omit-xml-declaration="yes">
                        <CodeSystem xmlns="http://hl7.org/fhir">
                            <id value="{$codeSystemIDVersion}"/>
                            <meta>
                                <profile value="http://hl7.org/fhir/StructureDefinition/shareablecodesystem"/>
                                <!--<profile value="http://hl7.org/fhir/4.0/StructureDefinition/CodeSystem"/>-->
                            </meta>
                            <url value="{.}"/>
                            <name value="{$codeSystemIDVersion}"/>
                            <title value="{$codeSystemIDVersion}"/>
                            <status value="unknown"/>
                            <content value="not-present"/>
                        </CodeSystem>
                    </xsl:result-document>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each-group>
    </xsl:template>
</xsl:stylesheet>