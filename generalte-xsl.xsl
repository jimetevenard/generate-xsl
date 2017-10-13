<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:generate="http://jimetevenard.com/ns/generate-xsl"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs"
    version="3.0">
    
    <xsl:variable name="namespace-uri" select="'http://jimetevenard.com/ns/generate-xsl'"/>
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"></xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    
    <!--
     TODO : Rester compaptible avec la doc OXygen !   
     -->
    
    
    
   
    <!-- Remove elements -->
    <xsl:template match="xsl:*[preceding-sibling::element()[1]/self::element(generate:remove)]">
        <xsl:message>[INFO] Remove a tagged <xsl:value-of select="name(.)"/></xsl:message>
    </xsl:template>
    
    <!-- iteration -->
    <!-- TODO récursif -->
    <xsl:template match="xsl:*[preceding-sibling::element()[1]/self::element(generate:iterate)]">
        <xsl:message>[INFO] Iterate over a tagged <xsl:value-of select="name(.)"/></xsl:message>
        <xsl:variable name="template" select="." />
        <xsl:variable name="iterate-tag" select="./preceding-sibling::element()[1]"/>
        <xsl:variable name="sequence" as="item()*">
            <xsl:evaluate xpath="$iterate-tag/@for"></xsl:evaluate>
        </xsl:variable>
        <xsl:variable name="sequence.name" select="$iterate-tag/@as" />
        <xsl:for-each select="$sequence">
            <xsl:comment><xsl:value-of select="."/></xsl:comment>
            <xsl:copy-of select="$template"></xsl:copy-of>
        </xsl:for-each>
    </xsl:template>
    
        
    <!-- we delete the generate:tags -->
    <xsl:template match="generate:*" />
    
</xsl:stylesheet>