<?xml version="1.0" encoding="UTF-8"?>
<!--INTERMEDIATE Generated at 2017-11-03T11:40:45.667+01:00-->
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
    
    <!--
        ## V2
        =====
        
        cf. diff avec commit 2acf8b3d91de8ed9d91c09f33f8480bd90cb00fd
    -->
    
    
    
    
    
    <!-- TODO d'une pierre deux coups ? -->
    
  
   
    
         <xsl:variable name="clients" select="doc('../clients.xml')//client"/>
         <xsl:for-each select="$clients">
            <xsl:variable name="client">
               <xsl:copy-of select="."/>
            </xsl:variable>
            <target-xsl:template match="*[prenom = '{$client/prenom}']" name="tplClient">
               <target-xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
               <target-xsl:variable name="uneAutreVariable" select="'toto'"/>
               <target-xsl:copy>
                  <target-xsl:attribute name="genre">
                     <target-xsl:value-of select="$genre"/>
                  </target-xsl:attribute>
                  <target-xsl:apply-templates select="node() | @*"/>
               </target-xsl:copy>
            </target-xsl:template>
         </xsl:for-each>
         <target-xsl:template match="client" name="tplClient">
            <target-xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
            <target-xsl:variable name="uneAutreVariable" select="'toto'"/>
            <target-xsl:copy>
               <target-xsl:attribute name="genre">
                  <target-xsl:value-of select="$genre"/>
               </target-xsl:attribute>
               <target-xsl:apply-templates select="node() | @*"/>
            </target-xsl:copy>
         </target-xsl:template>
    

    
    
    
         <!-- identity -->
         <target-xsl:template match="node() | @*">
            <target-xsl:copy>
               <target-xsl:apply-templates select="node() | @*"/>
            </target-xsl:copy>
         </target-xsl:template>
      </target-xsl:stylesheet>
   </xsl:template>
</xsl:stylesheet>
