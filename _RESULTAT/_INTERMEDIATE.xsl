<?xml version="1.0" encoding="UTF-8"?>
<!--INTERMEDIATE Generated at 2017-11-07T14:40:12.748+01:00-->
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
    
    
    
         <target-xsl:variable name="a-random-var">
            <xsl:copy-of select="concat('toto','tata')"/>
         </target-xsl:variable>
    
    
    
  
   
    
         <xsl:variable name="clients" select="doc('../clients.xml')//client"/>
         <xsl:for-each select="$clients">
            <xsl:variable name="client" select="."/>
            <target-xsl:template match="*[prenom = '{$client/prenom}']">
               <target-xsl:variable name="toto" select="count(//toto)"/>
               <target-xsl:variable name="genre">
                  <xsl:copy-of select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
               </target-xsl:variable>
               <target-xsl:variable name="uneAutreVariable" select="'toto'"/>
               <target-xsl:copy>
                  <target-xsl:attribute name="genre">
                     <target-xsl:value-of select="$genre"/>
                  </target-xsl:attribute>
                  <target-xsl:apply-templates select="node() | @*"/>
                  <target-xsl:call-template name="conditional-processes">
                     <target-xsl:with-param name="monClient" select="."/>
                  </target-xsl:call-template>
               </target-xsl:copy>
            </target-xsl:template>
         </xsl:for-each>
    
    

    
    
    
         <target-xsl:template name="conditional-processes">
            <target-xsl:param name="monClient"/>
            <xsl:if test="true()">
               <target-xsl:message>Dude, looks like I'll always do this</target-xsl:message>
            </xsl:if>
            <xsl:if test="false()">
               <target-xsl:message>Dude, looks like I'll never do that</target-xsl:message>
            </xsl:if>
            <xsl:choose>
               <xsl:when test="metier:isFemme($monClient)">
                  <target-xsl:message>Une cliente</target-xsl:message>
               </xsl:when>
               <xsl:when test="not(metier:isFemme($monClient)) and  (string-length($monClient/prenom) &gt; 6)">
                  <target-xsl:message>Un client avec un prenom long...</target-xsl:message>
               </xsl:when>
               <xsl:otherwise>
                  <target-xsl:message>Un client autre...</target-xsl:message>
               </xsl:otherwise>
            </xsl:choose>
         </target-xsl:template>
    
         <!-- identity -->
         <target-xsl:template match="node() | @*" name="baseIdentity">
            <target-xsl:copy>
               <target-xsl:apply-templates select="node() | @*"/>
            </target-xsl:copy>
         </target-xsl:template>
      </target-xsl:stylesheet>
   </xsl:template>
</xsl:stylesheet>
