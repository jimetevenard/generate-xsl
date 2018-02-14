<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:generate="http://jimetevenard.com/ns/generate-xsl"
    xmlns:metier="http://cogip.biz"
    exclude-result-prefixes="xs"
    version="3.0">
    
    <!--
        Prépa : Syntaxe V2
        
        Je veux :
        =========
        
        - Un use-var global $clients (sur lequel itérer)
            => clarifier generate:use-variable / genrate:variable, generate:use-import
        - Introduction des ID
            => On peut conserver la convention d'annoter au dessus 
        - <generate:iterate /@for : Mathhieu n'aime pas trop
            - (pourquoi pas tout simplement <generate:for-each / @select ?)
            - Virer le @name ou le rendre facultatif ? (moi j'aime bien)
        
        
         
         CALRIFIER : 
         ===========
         
         => Quand et comment on évalue les expressions ?
         
         => Comment on identifie les éléments cibles ?
            - ID systématique ?
            - Pour certains éléments, alternative à l'ID (ex: @name pour les templates )
            - Conservation d'un comportement par défaut basé sur le sibling ?
                (Attention au risque de confusion)
            Valable aussi bien pour les generate:remove, g
         
         => generate:template, changer la sysntaxe
            - Il faut clarifier le fait qu'on reprend (copy ?) un template existant
            - Clarifier également le fait qu'on remplace le match / des variables / des params
                   [ <generate:with-variable ... > ] ?
            - S
            
         Est-ce qu'on fait des PI ou on reste en XML
         - J'aime pas trop les PI (contenu considéré comme simple texte, a parser soi-même... )
         - En mettre partout dans les templates
        -->
    <?test-pi toto="titi"?>
    
    
   
    
    <!-- On ne veut pas de cet import dans la XSL finale -->
    <generate:remove/>
    <xsl:import href="../_IMPORTS/fonctions.xsl"/>
    
    <!-- En revanche, on a besoin dans le contexte de la géneration -->
    <generate:use-import href="../_IMPORTS/fonctions.xsl"/>
  
   
    
    
    <generate:iterate for="doc('../clients.xml')//client" name="client">
        <generate:template>
            <generate:match xpath="*[prenom = '{$generate:client/prenom}']"/>
            <generate:variable name="genre" select="concat('''',if (metier:isFemme(.)) then 'femme' else 'homme','''')" />
            <!-- 
                ATTENTION :
                    generate:variable => target-xsl:variable
                    generate:use-variable => intermediate-xsl:variable
                    VOIR DANS CHAQUE CE QUE JE VEUX (cf. plus bas)
                         (@select? | @use-select? | @value? | @compute?)
                         
                
                ACTUELLEMENT Je rermplace directement le select par @generate:variable/@select
                Don j'obtiens à l'arrivé un select="femme" qui sera interpreté comme du XPath (./femme)
                d'ou cet affreux concat(''''
                
                IL FAUT : préciser ici si ce que je veux
                - Construire une expression XPath qui deviendra le @select de la target-xsl:variable
                - OU obtenir une valeur qui sera la VALEUR de le target-xsl:variable.
                    TOUT N'est pas sérializable, éléments, séquences non primitives...
                    
                    Dans ce cas, il faut prévoir une fonction :
                    # SI [not($valeur instance of xs:anyAtomicType)]
                        => ALORS message erreur - impossible de sérialiser 
                            AU MOMENT DE LA GENREATION DE L'INTER            <=================\
                            PLUS SIMPLE et perti                                               I
                    # SINON                                                                    I
                        => representation lexicale de la valeur                                I
                         =>( évalue dans le sequence constructor et pas dans un select         I
                            pour autocaster si la variable est typée)                          I
                                                                                               I
                    On génère intermediate-variable avec la sequence en question               I
                    @name = generate:leNomDeLaVar                                              I
                                                                                               I
                    Récuperation pour serialization via une fx (OU PLUS SIMPLE cf. ici  >>=====/  )
                    
                    
                    
            -->
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