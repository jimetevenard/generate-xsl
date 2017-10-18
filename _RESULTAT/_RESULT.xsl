<?xml version="1.0" encoding="UTF-8"?>
<!--TARGET Generated at 2017-10-17T17:13:28.323+02:00-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:generate="http://jimetevenard.com/ns/generate-xsl"
                xmlns:generate-utils="generate::internal-functions"
                xmlns:saxon="http://saxon.sf.net/"
                xmlns:metier="http://cogip.biz"
                exclude-result-prefixes="xs"
                version="3.0">
   <xsl:template match="*[prenom = 'Élise']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Françoise']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Gabriel']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Nicolas']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Kyllian']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Aaron']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Alexia']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Adam']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Benjamin']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Titouan']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Léon']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Léonie']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Élouan']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Adrien']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Éléna']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Titouan']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Laura']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Kilian']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Catherine']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Margot']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Antonin']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Jordan']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Jade']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Lily']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Lou']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Esteban']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Baptiste']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Clara']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Julia']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Marion']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Martin']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Catherine']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Maxime']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Julien']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Tom']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Titouan']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Pauline']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Kimberley']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Maxence']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Lilian']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Lilou']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Agathe']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Gabriel']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Kilian']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Nathan']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Guillemette']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Noah']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Arthur']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Éloïse']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Bastien']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Valentin']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Julie']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Fanny']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Macéo']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Yohan']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Anaël']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Clémence']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Clotilde']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Jérémy']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Anaïs']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Gabin']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Mathéo']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Corentin']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Margaux']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Evan']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Yohan']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Paul']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Félix']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Lorenzo']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Yüna']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Catherine']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Léa']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Zacharis']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Anaëlle']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Margot']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Maïwenn']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Noah']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Florian']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Lamia']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Marwane']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Bastien']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Evan']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Noah']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Élisa']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Maryam']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Marine']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Chaïma']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Florian']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Guillemette']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Éléna']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Zoé']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Tristan']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Cloé']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Margaux']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Florian']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Cloé']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Adam']">
      <xsl:variable name="genre" select="'homme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Anna']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Evan']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Lena']">
      <xsl:variable name="genre" select="'femme'"/>
      <xsl:variable name="uneAutreVariable" select="'toto'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="node() | @*">
      <xsl:copy>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
</xsl:stylesheet>
