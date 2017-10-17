<?xml version="1.0" encoding="UTF-8"?>
<!--TARGET Generated at 2017-10-16T18:49:09.603+02:00-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:generate="http://jimetevenard.com/ns/generate-xsl"
                xmlns:generate-utils="generate::internal-functions"
                xmlns:metier="http://cogip.biz"
                exclude-result-prefixes="xs"
                version="3.0">
   <generate:remove/>
   <xsl:import href="../_IMPORTS/fonctions.xsl"/>
   <generate:use-import href="../_IMPORTS/fonctions.xsl"/>
   <xsl:template match="*[prenom = 'Élise']">
  
      <xsl:variable name="genre" select="'Bonnefemme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Françoise']">
      <generate:match xpath="*[prenom = 'Françoise']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Gabriel']">
      <generate:match xpath="*[prenom = 'Gabriel']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Nicolas']">
      <generate:match xpath="*[prenom = 'Nicolas']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Kyllian']">
      <generate:match xpath="*[prenom = 'Kyllian']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Aaron']">
      <generate:match xpath="*[prenom = 'Aaron']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Alexia']">
      <generate:match xpath="*[prenom = 'Alexia']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Adam']">
      <generate:match xpath="*[prenom = 'Adam']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Benjamin']">
      <generate:match xpath="*[prenom = 'Benjamin']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Titouan']">
      <generate:match xpath="*[prenom = 'Titouan']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Léon']">
      <generate:match xpath="*[prenom = 'Léon']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Léonie']">
      <generate:match xpath="*[prenom = 'Léonie']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Élouan']">
      <generate:match xpath="*[prenom = 'Élouan']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Adrien']">
      <generate:match xpath="*[prenom = 'Adrien']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Éléna']">
      <generate:match xpath="*[prenom = 'Éléna']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Titouan']">
      <generate:match xpath="*[prenom = 'Titouan']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Laura']">
      <generate:match xpath="*[prenom = 'Laura']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Kilian']">
      <generate:match xpath="*[prenom = 'Kilian']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Catherine']">
      <generate:match xpath="*[prenom = 'Catherine']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Margot']">
      <generate:match xpath="*[prenom = 'Margot']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Antonin']">
      <generate:match xpath="*[prenom = 'Antonin']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Jordan']">
      <generate:match xpath="*[prenom = 'Jordan']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Jade']">
      <generate:match xpath="*[prenom = 'Jade']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Lily']">
      <generate:match xpath="*[prenom = 'Lily']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Lou']">
      <generate:match xpath="*[prenom = 'Lou']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Esteban']">
      <generate:match xpath="*[prenom = 'Esteban']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Baptiste']">
      <generate:match xpath="*[prenom = 'Baptiste']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Clara']">
      <generate:match xpath="*[prenom = 'Clara']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Julia']">
      <generate:match xpath="*[prenom = 'Julia']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Marion']">
      <generate:match xpath="*[prenom = 'Marion']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Martin']">
      <generate:match xpath="*[prenom = 'Martin']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Catherine']">
      <generate:match xpath="*[prenom = 'Catherine']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Maxime']">
      <generate:match xpath="*[prenom = 'Maxime']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Julien']">
      <generate:match xpath="*[prenom = 'Julien']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Tom']">
      <generate:match xpath="*[prenom = 'Tom']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Titouan']">
      <generate:match xpath="*[prenom = 'Titouan']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Pauline']">
      <generate:match xpath="*[prenom = 'Pauline']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Kimberley']">
      <generate:match xpath="*[prenom = 'Kimberley']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Maxence']">
      <generate:match xpath="*[prenom = 'Maxence']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Lilian']">
      <generate:match xpath="*[prenom = 'Lilian']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Lilou']">
      <generate:match xpath="*[prenom = 'Lilou']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Agathe']">
      <generate:match xpath="*[prenom = 'Agathe']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Gabriel']">
      <generate:match xpath="*[prenom = 'Gabriel']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Kilian']">
      <generate:match xpath="*[prenom = 'Kilian']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Nathan']">
      <generate:match xpath="*[prenom = 'Nathan']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Guillemette']">
      <generate:match xpath="*[prenom = 'Guillemette']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Noah']">
      <generate:match xpath="*[prenom = 'Noah']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Arthur']">
      <generate:match xpath="*[prenom = 'Arthur']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Éloïse']">
      <generate:match xpath="*[prenom = 'Éloïse']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Bastien']">
      <generate:match xpath="*[prenom = 'Bastien']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Valentin']">
      <generate:match xpath="*[prenom = 'Valentin']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Julie']">
      <generate:match xpath="*[prenom = 'Julie']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Fanny']">
      <generate:match xpath="*[prenom = 'Fanny']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Macéo']">
      <generate:match xpath="*[prenom = 'Macéo']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Yohan']">
      <generate:match xpath="*[prenom = 'Yohan']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Anaël']">
      <generate:match xpath="*[prenom = 'Anaël']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Clémence']">
      <generate:match xpath="*[prenom = 'Clémence']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Clotilde']">
      <generate:match xpath="*[prenom = 'Clotilde']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Jérémy']">
      <generate:match xpath="*[prenom = 'Jérémy']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Anaïs']">
      <generate:match xpath="*[prenom = 'Anaïs']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Gabin']">
      <generate:match xpath="*[prenom = 'Gabin']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Mathéo']">
      <generate:match xpath="*[prenom = 'Mathéo']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Corentin']">
      <generate:match xpath="*[prenom = 'Corentin']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Margaux']">
      <generate:match xpath="*[prenom = 'Margaux']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Evan']">
      <generate:match xpath="*[prenom = 'Evan']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Yohan']">
      <generate:match xpath="*[prenom = 'Yohan']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Paul']">
      <generate:match xpath="*[prenom = 'Paul']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Félix']">
      <generate:match xpath="*[prenom = 'Félix']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Lorenzo']">
      <generate:match xpath="*[prenom = 'Lorenzo']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Yüna']">
      <generate:match xpath="*[prenom = 'Yüna']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Catherine']">
      <generate:match xpath="*[prenom = 'Catherine']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Léa']">
      <generate:match xpath="*[prenom = 'Léa']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Zacharis']">
      <generate:match xpath="*[prenom = 'Zacharis']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Anaëlle']">
      <generate:match xpath="*[prenom = 'Anaëlle']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Margot']">
      <generate:match xpath="*[prenom = 'Margot']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Maïwenn']">
      <generate:match xpath="*[prenom = 'Maïwenn']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Noah']">
      <generate:match xpath="*[prenom = 'Noah']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Florian']">
      <generate:match xpath="*[prenom = 'Florian']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Lamia']">
      <generate:match xpath="*[prenom = 'Lamia']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Marwane']">
      <generate:match xpath="*[prenom = 'Marwane']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Bastien']">
      <generate:match xpath="*[prenom = 'Bastien']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Evan']">
      <generate:match xpath="*[prenom = 'Evan']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Noah']">
      <generate:match xpath="*[prenom = 'Noah']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Élisa']">
      <generate:match xpath="*[prenom = 'Élisa']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Maryam']">
      <generate:match xpath="*[prenom = 'Maryam']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Marine']">
      <generate:match xpath="*[prenom = 'Marine']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Chaïma']">
      <generate:match xpath="*[prenom = 'Chaïma']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Florian']">
      <generate:match xpath="*[prenom = 'Florian']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Guillemette']">
      <generate:match xpath="*[prenom = 'Guillemette']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Éléna']">
      <generate:match xpath="*[prenom = 'Éléna']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Zoé']">
      <generate:match xpath="*[prenom = 'Zoé']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Tristan']">
      <generate:match xpath="*[prenom = 'Tristan']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Cloé']">
      <generate:match xpath="*[prenom = 'Cloé']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Margaux']">
      <generate:match xpath="*[prenom = 'Margaux']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Florian']">
      <generate:match xpath="*[prenom = 'Florian']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Cloé']">
      <generate:match xpath="*[prenom = 'Cloé']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Adam']">
      <generate:match xpath="*[prenom = 'Adam']"/>
      <xsl:variable name="genre" select="homme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Anna']">
      <generate:match xpath="*[prenom = 'Anna']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Evan']">
      <generate:match xpath="*[prenom = 'Evan']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="*[prenom = 'Lena']">
      <generate:match xpath="*[prenom = 'Lena']"/>
      <xsl:variable name="genre" select="femme"/>
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="client">
      <xsl:variable name="genre" select="if (metier:isFemme(.)) then 'femme' else 'homme'"/>
      <xsl:copy>
         <xsl:attribute name="genre">
            <xsl:value-of select="$genre"/>
         </xsl:attribute>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <generate:remove/>
   <xsl:template match="comment()" priority="1">
      <xsl:message>FOUND COMMENT ! : <xsl:value-of select="."/>
      </xsl:message>
   </xsl:template>
   <xsl:template match="node() | @*">
      <xsl:copy>
         <xsl:apply-templates select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
</xsl:stylesheet>
