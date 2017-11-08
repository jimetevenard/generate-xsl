<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:generate="http://jimetevenard.com/ns/generate-xsl"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"></xsl:output>
    
    <xsl:template match="/">
Syntaxe
=======

(document généré)


Elements de syntaxe :
---------------------

<xsl:apply-templates mode="syntaxe"/>
        
    </xsl:template>
    
    <xsl:template match="node() | @*" mode="syntaxe" >
        <xsl:apply-templates mode="syntaxe" select="node() | @*" />
    </xsl:template>
    
    <xsl:template match="generate:*|generate:*/@*|@generate:*" mode="syntaxe" >
    <xsl:text>* `</xsl:text>
        <xsl:if test="self::attribute()">
            <xsl:value-of select="parent::node()/name()"/>
            <xsl:text>/@</xsl:text>
        </xsl:if>
        <xsl:value-of select="name()"/>
        <xsl:text>`&#xa;</xsl:text>
        <xsl:apply-templates mode="syntaxe" select="node() | @*" />
    </xsl:template>
</xsl:stylesheet>