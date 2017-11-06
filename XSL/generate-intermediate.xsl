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
        
        
        
        <!-- First, we check ID's -->
        <xsl:if test="not(count(//xsl:*[@generate:id]) = count(distinct-values(//xsl:*[@generate:id]/@generate:id))) or exists(//xsl:*[@generate:id = ''])">
            <xsl:message terminate="yes">[FATAL] All @generate:id must be UNIQUE and NOT EMPTY.</xsl:message>
        </xsl:if>
        
        
        
        
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
    <xsl:template match="generate:*" mode="#all">
        <!-- on dégage -->
    </xsl:template>
    
    <xsl:template match="generate:use-import" mode="imports">  
        <xsl:variable name="targeted-import" select="//xsl:import[@generate:id = current()/@id]" as="element(xsl:import)?"/>
        <xsl:variable name="href" select="if (@href) then @href else $targeted-import/@href"/>
            <xsl:choose>
                <xsl:when test="$href">
                    <intermediate-xsl:import>
                        <xsl:attribute name="href" select="$href"></xsl:attribute>
                    </intermediate-xsl:import>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:message>[ERROR] generate:use-import must either have a @href or a @id that reference a unique actual xsl:import.</xsl:message>
                </xsl:otherwise>
            </xsl:choose>
    </xsl:template>
    
    <xsl:template match="generate:use-variable" mode="generate-target">
       <intermediate-xsl:variable>
           <xsl:attribute name="name" select="@name"/>
           <xsl:choose>
               <xsl:when test="@select">
                   <xsl:attribute name="select" select="@select" />
               </xsl:when>
               <xsl:otherwise>
                   <xsl:copy-of select="./node()"></xsl:copy-of>
               </xsl:otherwise>
           </xsl:choose>
       </intermediate-xsl:variable>
    </xsl:template>
    
    <xsl:template match="generate:for-each" mode="generate-target">
        <intermediate-xsl:for-each select="{@select}">
            <xsl:if test="@name">
                <intermediate-xsl:variable name="{@name}" select="." />
            </xsl:if>
            <xsl:apply-templates mode="generate-target">
                <xsl:with-param name="generate-block" select="." tunnel="yes" />
            </xsl:apply-templates>
        </intermediate-xsl:for-each>
    </xsl:template>
    
    <xsl:template match="generate:copy-template" mode="generate-target">
        <xsl:param name="generate-block" select="." tunnel="yes" />
        <xsl:variable name="template" as="element(xsl:template)">
            <xsl:choose>
                <xsl:when test="@id">
                    <xsl:sequence select="//xsl:template[@generate:id = current()/@id]"/>
                </xsl:when>
                <xsl:when test="@name">
                    <xsl:sequence select="//xsl:template[@name = current()/@name]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:message>[ERROR] generate:template must have a @id or @name that references an actual template</xsl:message>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <target-xsl:template>
            <xsl:apply-templates select="$template/@*" mode="generated-template"/>
            <xsl:apply-templates select="generate:*" mode="generated-template-attributes"/>
            <xsl:apply-templates select="generate:*" mode="generate-target"/>
            <xsl:apply-templates select="$template/node()" mode="generated-template"/>
                
            
        </target-xsl:template>
    </xsl:template>
    
    <xsl:template
        match="generate:set-match|generate:set-mode|generate:set-priority|generate:set-name|generate:set-as|generate:set-visibility"
        mode="generated-template-attributes">
        
        <xsl:variable name="attName" select="substring(local-name(.),5)"/>
        <xsl:attribute name="{$attName}" select="@value" />
    </xsl:template>
    
    
    <xsl:template match="generate:with-param" mode="generate-target">
        <!-- TODO OOO -->
        <!-- 
            Remplacer le @select et/ou content du param s'il existe ?
        -->
    </xsl:template>
    
    <xsl:template match="generate:redefine-variable" mode="generate-target">
        <!--
            Cf. template des xsl:variable
         -->
    </xsl:template>
    

    
    <!-- ============== OLDIE !! ================== -->
    <!--<xsl:template match="(generate:match|generate:name|generate:priority|generate:mode|generate:as)" mode="generated-template-attributes">
        <!-\- 
            PERTIENCE ?? créé à la base pour inférer 
            Si, si :) Oh oui !
        -\->
        <xsl:variable name="raw-value" select="if(exists(@xpath)) then @xpath else @value"/>
        <xsl:message><xsl:value-of select="saxon:print-stack()"/></xsl:message>
        <xsl:attribute name="{local-name(.)}">
            <xsl:value-of select="$raw-value"/>        
        </xsl:attribute>
    </xsl:template>
    -->
    
    <!-- ============== NEW :) ================== -->
    <xsl:template match="generate:variable" mode="generate-target">
        <xsl:call-template name="generated-variable">
            <xsl:with-param name="name" select="@name" />
            <xsl:with-param name="definition" select="." />
        </xsl:call-template>
    </xsl:template>
    
    
    
    <!-- 
        ### XSL NODES
        =============
    -->
    
    <xsl:template match="xsl:template/@name" mode="generated-template">
        <!--
            On supprime les @name pour éviter toute duplication
            TODO :
                Un peu radical, idéalement il ne faudrait les supprimer que si l'attribut est
                effectivement doublonné... (comment ?)
        -->
    </xsl:template>
    
    <!-- ============== NEW :) ================== -->
    <xsl:template match="xsl:*" mode="generate-target generated-template"> 
        <xsl:variable name="ref" select="//generate:*[@id = current()/@generate:id or @name = current()/self::element(xsl:template)/@name]"/>
        <xsl:variable name="isRemoved" as="xs:boolean" select="local-name($ref) = 'remove' or $ref/@keep-original = 'no'" />
        
        <xsl:if test="not($isRemoved)">
            <xsl:element name="target-xsl:{local-name()}" namespace="generate::generate-target-stylesheet">
                <xsl:apply-templates select="node() | @*" mode="#current" />
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <!-- ============== NEW :) ================== -->
    <xsl:template match="xsl:variable" mode="generated-template">
        <!--
            ATTENTION, distinguer le cas Local/Global variable...
            
            BIEN PRECISER les contours du $generate-block, qui se veut le "scope" de la variable
         -->
        <xsl:param name="generate-block" tunnel="yes" />
        <xsl:variable name="this" select="."/>
        <xsl:variable
            name="generate:redefinition"
            select="$generate-block//generate:redefine-variable[(@name = $this/@name) or (@id = $this/@generate:id)]"
            as="element(generate:redefine-variable)?"
        />
        <xsl:choose>
            <xsl:when test="exists($generate:redefinition)">
                <xsl:call-template name="generated-variable">
                    <xsl:with-param name="name" select="$this/@name" />
                    <xsl:with-param name="definition" select="$generate:redefinition" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <target-xsl:variable>
                    <xsl:apply-templates select="node() | @*" mode="generated-template" />          
                </target-xsl:variable>   
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    
    <!--
        ============= YEPAAA ! ================
        
        
    -->
    <xsl:template name="generated-variable">
        <xsl:param name="name" as="xs:string" required="yes" />
        <xsl:param name="definition" as="element()" required="yes"></xsl:param>
        <target-xsl:variable>
            <xsl:attribute name="name" select="$name"></xsl:attribute>
            <xsl:choose>
                <xsl:when test="exists($definition/@select) and not($definition/@evaluate = 'yes')">
                    <xsl:attribute name="select" select="$definition/@select" />
                </xsl:when>
                <xsl:when test="exists($definition/@select) and $definition/@evaluate = 'yes'">
                    <intermediate-xsl:copy-of select="{$definition/@select}" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="$definition/node()" mode="generate-target" />  
                </xsl:otherwise>
            </xsl:choose>
        </target-xsl:variable>  
    </xsl:template>
    
    <!-- 
        ### IDENTITY FOR OTHER NODES
        ============================
    -->
    
    <!-- ============== OLDIE !! ================== -->
    <xsl:template match="node() | @*" mode="#all" name="identity">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="generate-target"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    
    
</xsl:stylesheet>