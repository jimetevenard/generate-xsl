<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:generate="http://jimetevenard.com/ns/generate-xsl"
    xmlns:metier="http://cogip.biz"
    exclude-result-prefixes="xs"
    version="3.0">
    
    <!--
        ## V2
        =====
        
        cf. diff avec commit 2acf8b3d91de8ed9d91c09f33f8480bd90cb00fd
    -->
    
    
    <generate:remove id="fxs"/>
    <xsl:import href="../_IMPORTS/fonctions.xsl" generate:id="fxs"/>
    
    <!-- TODO d'une pierre deux coups ? -->
    <generate:use-import href="../_IMPORTS/fonctions.xsl"/>
  
   
    
    <generate:use-variable select="doc('../clients.xml')//client" name="clients"/>
    <generate:for-each select="$clients" name="client" >
        <generate:copy-template name="tplClient">
            <generate:set-match value="*[prenom = '{$client/prenom}']"/>
            <generate:redefine-variable
                name="genre"
                select="if (metier:isFemme(.)) then 'femme' else 'homme'"
                evaluate="yes" />
        </generate:copy-template>
    </generate:for-each>
    <xsl:template match="client" name="tplClient">
        <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'" />
        <xsl:variable name="uneAutreVariable" select="'toto'"/>
        <xsl:copy>
            <xsl:attribute name="genre">
                <xsl:value-of select="$genre"/>
            </xsl:attribute>
            <xsl:apply-templates select="node() | @*"></xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    

    <generate:remove id="unTemplatePeuUtile"/>
    <xsl:template match="comment()" priority="1" generate:id="unTemplatePeuUtile">
        <xsl:message>
            <xsl:text>COMMENT FOUND : </xsl:text>
            <xsl:value-of select="."/>
        </xsl:message>
    </xsl:template>
    
    <!-- identity -->
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"></xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>