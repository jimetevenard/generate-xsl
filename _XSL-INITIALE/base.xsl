<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:generate="http://jimetevenard.com/ns/generate-xsl"
    xmlns:metier="http://cogip.biz"
    exclude-result-prefixes="xs"
    version="3.0">
    
    
   
    
    <!-- On ne veut pas de cet import dans la XSL finale -->
    <generate:remove/>
    <xsl:import href="../_IMPORTS/fonctions.xsl"/>
    
    <!-- En revanche, on a besoin dans le contexte de la géneration -->
    <generate:use-import href="../_IMPORTS/fonctions.xsl"/>
  
   
    
    
    <generate:iterate for="doc('../clients.xml')//client" name="client">
        <generate:template>
            <generate:match xpath="*[prenom = '{$generate:client/prenom}']"/>
            <generate:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'" />
        </generate:template>
    </generate:iterate>
    <xsl:template match="client">
        <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'" />
        <xsl:variable name="uneAutreVariable" select="'toto'"/>
        <xsl:copy>
            <xsl:attribute name="genre">
                <xsl:value-of select="$genre"/>
            </xsl:attribute>
            <xsl:apply-templates select="node() | @*"></xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    
    
    <generate:remove/>
    <xsl:template match="comment()" priority="1">
        <xsl:message>FOUND COMMENT ! : <xsl:value-of select="."/></xsl:message>
    </xsl:template>
    
    <!-- identity -->
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"></xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>