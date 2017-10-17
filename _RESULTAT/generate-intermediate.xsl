<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:generate="http://jimetevenard.com/ns/generate-xsl"
    xmlns:intermediate-xsl="generate::intermediate-xsl"
    xmlns:target-xsl="generate::generate-target-stylesheet"
    xmlns:generate-utils="generate::internal-functions"
    xmlns:saxon="http://saxon.sf.net/"
    version="3.0">
    
    
    <xsl:output indent="yes" />    
    <xsl:namespace-alias result-prefix="xsl" stylesheet-prefix="intermediate-xsl"/>   
    <xsl:variable name="generate:ns" select="'http://jimetevenard.com/ns/generate-xsl'"/>
    
    
    <xsl:template match="/">
        <xsl:variable name="base-stylesheet" select="./xsl:stylesheet"/>
        <xsl:comment>INTERMEDIATE Generated at <xsl:value-of select="current-dateTime()"/></xsl:comment>
        
        <intermediate-xsl:stylesheet
            xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            xmlns:generate-target="generate::generate-target-stylesheet"
            version="3.0">
            
            <!-- 
                On reproduit à l'indentique les déclarations de préfixes.
                Sinon, ca peut poser des problèmes avec les fonctions importées
            -->
            <xsl:for-each select="in-scope-prefixes($base-stylesheet)">
                <xsl:namespace name="{.}" select="namespace-uri-for-prefix(.,$base-stylesheet)"></xsl:namespace>
            </xsl:for-each>
            
            <intermediate-xsl:output indent="yes" />
            
            <intermediate-xsl:namespace-alias result-prefix="xsl" stylesheet-prefix="generate-target"/>
            
            <!-- imports -->
            <xsl:apply-templates select="$base-stylesheet/generate:use-import" mode="imports"/>
            
            <!-- intermediate-xsl : main template -->
            <intermediate-xsl:template name="init">
                <intermediate-xsl:comment>TARGET Generated at <intermediate-xsl:value-of select="current-dateTime()"/></intermediate-xsl:comment>
                <xsl:apply-templates select="." mode="generate-target" />
            </intermediate-xsl:template>
            
        </intermediate-xsl:stylesheet>
    </xsl:template>
    
    
    
    <!-- =============================================================================================== -->
    
    
    
    <!-- 
        ### GENERATE NODES
        ==================
    -->
    <xsl:template match="generate:use-import" mode="imports">
        <intermediate-xsl:import>
            <xsl:attribute name="href" select="@href" />
        </intermediate-xsl:import>
    </xsl:template>
    
    
    <xsl:template match="generate:iterate" mode="generate-target">
        <xsl:param name="iterate-node" select="."/>
        <xsl:param name="template-node" select="./following-sibling::xsl:template[1]"/><!-- OU doit forcément être l'élement suivant ? -->
        <intermediate-xsl:for-each select="{@for}">
            <intermediate-xsl:variable name="generate:{@name}" select="."/>
            <xsl:apply-templates mode="generate-target">
                <xsl:with-param name="iterate-node" select="$iterate-node" tunnel="yes" />
                <xsl:with-param name="template-node" select="$template-node" tunnel="yes" />
            </xsl:apply-templates>
        </intermediate-xsl:for-each>
    </xsl:template>
    
    <xsl:template match="generate:template" mode="generate-target">
        <xsl:param name="iterate-node" tunnel="yes" />
        <xsl:param name="template-node" tunnel="yes" />
        <target-xsl:template>
            <xsl:apply-templates select="$template-node/@*" mode="generated-template"/>
            <xsl:apply-templates select="generate:*" mode="generated-template-attributes"/>
            <xsl:apply-templates select="generate:*" mode="generate-target"/>
            <xsl:apply-templates select="$template-node/node()" mode="generated-template">
                <xsl:with-param name="generate-instruction" select="$iterate-node" tunnel="yes"/>
            </xsl:apply-templates>
        </target-xsl:template>
    </xsl:template>
    
    <xsl:template match="(generate:match|generate:name|generate:priority|generate:mode|generate:as)" mode="generated-template-attributes">
        <!-- 
            PERTIENCE ?? créé à la base pour inférer 
            Si, si :) Oh oui !
        -->
        <xsl:variable name="raw-value" select="if(exists(@xpath)) then @xpath else @value"/>
        <xsl:message><xsl:value-of select="saxon:print-stack()"/></xsl:message>
        <xsl:attribute name="{local-name(.)}">
            <xsl:value-of select="$raw-value"/>        
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="generate:variable" mode="generate-target">
        <xsl:param name="iterate-node" tunnel="yes" />
        <intermediate-xsl:variable name="generate:{@name}" select="{@select}"/>
        <target-xsl:variable name="{@name}" select="{concat('{$generate:',@name,'}')}"/>
    </xsl:template>
    
    
    
    <!-- 
        ### XSL NODES
        =============
    -->
    <xsl:template match="xsl:*" mode="generate-target generated-template"> 
        <xsl:element name="target-xsl:{local-name()}" namespace="generate::generate-target-stylesheet">
            <xsl:apply-templates select="node() | @*" mode="#current" />
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="xsl:variable" mode="generated-template">
        <xsl:param name="generate-instruction"  tunnel="yes" as="element()"/>
        
        <xsl:message>[xsl:variable -> generated-template]" param $gen : <xsl:value-of select="$generate-instruction"/></xsl:message>
        <xsl:variable name="this" select="."/>
        <xsl:variable name="generate:is-redefined" select="exists($generate-instruction//generate:variable[@name = $this/@name])"/>
        
        <xsl:if test="not($generate:is-redefined)">
            <target-xsl:variable>
                <xsl:apply-templates select="node() | @*" mode="generated-template" />          
            </target-xsl:variable>    
        </xsl:if>
    </xsl:template>
    
    
    
    <!-- 
        ### IDENTITY FOR OTHER NODES
        ============================
    -->
    <xsl:template match="node() | @*" mode="#all" name="identity">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="generate-target"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    
    
</xsl:stylesheet>