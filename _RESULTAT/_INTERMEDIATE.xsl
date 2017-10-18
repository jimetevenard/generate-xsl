<?xml version="1.0" encoding="UTF-8"?>
<!--INTERMEDIATE Generated at 2017-10-17T17:07:36.655+02:00-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:generate-target="generate::generate-target-stylesheet"
                xmlns:generate="http://jimetevenard.com/ns/generate-xsl"
                xmlns:target-xsl="generate::generate-target-stylesheet"
                xmlns:generate-utils="generate::internal-functions"
                xmlns:saxon="http://saxon.sf.net/"
                xmlns:metier="http://cogip.biz"
                version="3.0">
   <xsl:output indent="yes"/>
   <xsl:namespace-alias result-prefix="xsl" stylesheet-prefix="generate-target"/>
   <xsl:import href="../_IMPORTS/fonctions.xsl"/>
   <xsl:template name="init">
      <xsl:comment>TARGET Generated at <xsl:value-of select="current-dateTime()"/>
      </xsl:comment>
      <target-xsl:stylesheet exclude-result-prefixes="xs" version="3.0">
    
    
   
    
    <!-- On ne veut pas de cet import dans la XSL finale -->
    
    
    
    <!-- En revanche, on a besoin dans le contexte de la géneration -->
    
  
   
    
    
         <xsl:for-each select="doc('../clients.xml')//client">
            <xsl:variable name="generate:client" select="."/>
            <target-xsl:template match="*[prenom = '{$generate:client/prenom}']">
               <xsl:variable name="generate:genre"
                             select="concat('''',if (metier:isFemme(.)) then 'femme' else 'homme','''')"/>
               <target-xsl:variable name="genre" select="{$generate:genre}"/>
        
               <target-xsl:variable name="uneAutreVariable" select="'toto'"/>
               <target-xsl:copy>
                  <target-xsl:attribute name="genre">
                     <target-xsl:value-of select="$genre"/>
                  </target-xsl:attribute>
                  <target-xsl:apply-templates select="node() | @*"/>
               </target-xsl:copy>
            </target-xsl:template>
         </xsl:for-each>
    
    
    
    
    
    
    
         <!-- identity -->
         <target-xsl:template match="node() | @*">
            <target-xsl:copy>
               <target-xsl:apply-templates select="node() | @*"/>
            </target-xsl:copy>
         </target-xsl:template>
      </target-xsl:stylesheet>
   </xsl:template>
</xsl:stylesheet>
