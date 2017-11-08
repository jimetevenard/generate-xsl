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
        
distinct-values((//generate:*/name(),//generate:*/@*/concat(parent::node()/name(),'/@',name()),//@generate:*/concat(parent::node()/name(),'/@',name())))
    -->
   
    
    <generate:remove id="fonctions-metier"/>
    <xsl:import href="../_IMPORTS/fonctions.xsl" generate:id="fonctions-metier"/>
    
    <!-- TODO d'une pierre deux coups ? -->
    <generate:use-import href="../_IMPORTS/fonctions.xsl"/>
    
    
    
    
    <xsl:variable name="a-random-var" select="concat('toto','tata')" generate:evaluate="yes"/>
    
    
    
  
   
    
    <generate:use-variable select="doc('../clients.xml')//client" name="clients"/>
    <generate:for-each select="$clients" name="client" >
        <generate:copy-template name="tplClient" keep-original="no">
            <generate:set-match value="*[prenom = '{$client/prenom}']" />
            <generate:redefine-variable
                name="genre"
                select="if (metier:isFemme(.)) then 'femme' else 'homme'"
                evaluate="yes" />
            <generate:variable name="toto" select="count(//toto)"  evaluate="yes"></generate:variable>
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
            <xsl:call-template name="conditional-processes">
                <xsl:with-param name="monClient" select="."/>
            </xsl:call-template>
        </xsl:copy>
    </xsl:template>
    

    <generate:remove id="un-template-peu-utile"/>
    <xsl:template match="comment()" priority="1" generate:id="un-template-peu-utile">
        <xsl:message>
            <xsl:text>COMMENT FOUND : </xsl:text>
            <xsl:value-of select="."/>
        </xsl:message>
    </xsl:template>
    
    <xsl:template name="conditional-processes">
        <xsl:param name="monClient" />
        <xsl:if test="true()" generate:evaluate="yes" >
            <xsl:message>Dude, looks like I'll always do this</xsl:message>
        </xsl:if>
        <xsl:if test="false()" generate:evaluate="yes">
            <xsl:message>Dude, looks like I'll never do that</xsl:message>
        </xsl:if>
        <xsl:choose generate:evaluate="yes">
            <xsl:when test="false()">
                <xsl:message>Une cliente</xsl:message>
            </xsl:when>
            <xsl:when test="true()">
                <xsl:message>Un client avec un prenom long...</xsl:message>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message>Un client autre...</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- identity -->
    <xsl:template match="node() | @*" name="baseIdentity">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"></xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>