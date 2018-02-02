<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:generate="http://jimetevenard.com/ns/generate-xsl"
    xmlns:intermediate-xsl="generate::intermediate-xsl"
    xmlns:target-xsl="generate::generate-target-stylesheet"
    xmlns:generate-utils="generate::internal-functions"
    xmlns:math="http://exslt.org/math"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    version="3.0">
    
    <!-- set true to ignore comments -->
    <xsl:param name="generate:skip-comments" select="false()" as="xs:boolean" />
    
    <!-- [For debug] set true to copy comments in the intermediate XSL -->
    <xsl:param name="generate:comment-intermediate" select="false()" as="xs:boolean" />
    
    <xsl:output indent="yes" />    
    <xsl:namespace-alias result-prefix="xsl" stylesheet-prefix="intermediate-xsl"/>   
    <xsl:variable name="generate:ns" select="'http://jimetevenard.com/ns/generate-xsl'"/>
    <xsl:variable name="defaultBuildMode" select="'#default'"/>
    <xsl:variable name="allBuildMode" select="'#all'"/>
    
    
    <!-- UTILS --> 
    <xsl:variable name="generate-utils:ncname.regex" select="'(\c)+?'"/>
    <xsl:variable name="generate-utils:qname.regex" select="$generate-utils:ncname.regex"/><!-- TMP !! -->
    <xsl:variable name="generate-utils:varReference.regex" select="concat('^\$',$generate-utils:qname.regex,'$')"/>
    <xsl:variable name="generate-utils:functionCall.regex" select="'TODO TODOOOO'"/>
    <!-- TODO : functionCall.regex NON, une simple regex ne suffira pas (recursion des parenthèses -->
    
    <xsl:function name="generate-utils:get-type" as="xs:string?">
        <!--
            This function (Tries to) retrieve the type of $element
        -->
        <xsl:param name="element" as="element()"></xsl:param>
        <xsl:variable name="xpath" as="xs:string?" select="$element/@select"/> 
        <xsl:choose>  
            <xsl:when test="$element/@as">
                <!-- $element has an explicit type -->
                <xsl:value-of select="$element/@as"/>
            </xsl:when>
            
            <xsl:when test="matches($xpath,$generate-utils:varReference.regex)">
                <!-- this XPath is a var or param reference -->
                <xsl:variable name="declaration" as="element()?" select="generate-utils:find-variable-declaration($xpath,$element)"/>
                <xsl:choose>
                    <xsl:when test="$declaration/@as">
                        <xsl:value-of select="$declaration/@as"/>         
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:message>[GENERATE-XSL][INFO] the type of variable "<xsl:value-of select="$xpath"/>" is not declared.</xsl:message>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            
            <xsl:when test="matches($xpath,$generate-utils:functionCall.regex)">
                <!-- this XPath is a function call -->
                <xsl:variable name="functionName" select="substring-before($xpath,'(')"/>
                <xsl:variable name="root" select="$element/ancestor-or-self::element(xsl:stylesheet)"/>
                <xsl:variable
                    name="declaration" as="element(xsl:function)?"
                    select="$root/xsl:function[resolve-QName(@name,$root) = resolve-QName($functionName,$element)]"/>
                <xsl:choose>
                    <xsl:when test="$declaration/@as">
                        <xsl:value-of select="$declaration/@as"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:message>[GENERATE-XSL][INFO] the type of function "<xsl:value-of select="$xpath"/>" is not declared.</xsl:message>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message>[GENERATE-XSL][INFO] the type of expression "<xsl:value-of select="$xpath"/>" could not be inferred.</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xsl:function name="generate-utils:find-variable-declaration" as="element()?">    
        <!-- 2 args signature -->
        <xsl:param name="xpath" as="xs:string"/>
        <xsl:param name="resolutionBase" as="node()"/>
        
        <xsl:sequence select="generate-utils:find-variable-declaration($xpath,$resolutionBase,$resolutionBase)"></xsl:sequence>
   </xsl:function>
    
    <xsl:function name="generate-utils:find-variable-declaration" as="element()?">
        <!-- 
            If you have a reference to '$toto' at a given point of the stylesheet
            This function retrieves what '$toto' stands for.
            It may be a xsl:variable or a xsl:param.
        -->
        <xsl:param name="xpath" as="xs:string"/>
        <xsl:param name="resolutionBase" as="node()"/>
        <xsl:param name="initialResolutionBase" as="node()"/>
        
        <xsl:variable name="varName" select="if(starts-with($xpath,'$')) then substring($xpath,2) else $xpath"/>
        <xsl:variable name="baseParent" select="$resolutionBase/parent::node()"/>
        <xsl:variable name="matchingDeclarations" select="$baseParent/(xsl:param|xsl:variable)[resolve-QName(@name,$baseParent) = resolve-QName($varName,$initialResolutionBase)]" as="element()*"/>

        <xsl:choose>
            <xsl:when test="exists($matchingDeclarations)">
                <xsl:sequence select="$matchingDeclarations[last()]"></xsl:sequence>
            </xsl:when>
            <xsl:when test="not(exists($resolutionBase/parent::node()))">
                <!-- We've reached the root -->
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="generate-utils:find-variable-declaration($xpath,$resolutionBase/parent::node(),$initialResolutionBase)" />
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:function>
    
    <xsl:function name="generate-utils:is-removed" as="xs:boolean">
        <xsl:param name="contextItem" />
        <xsl:param name="refs" as="element()*" />
        <xsl:param name="buildModes" as="xs:string*" />
        

        
        <xsl:variable name="refIsMatchingRemoveElement" as="xs:boolean" select="$refs[local-name() = 'remove'] and ($refs/tokenize(@mode,'\s+') = ($buildModes, $allBuildMode) or (not($refs/@mode) and $buildModes = $defaultBuildMode))"/>
        <xsl:sequence select="$contextItem/tokenize(@generate:remove,'\s+') = ($buildModes, $allBuildMode) or $refIsMatchingRemoveElement or $refs/@keep-original = 'no'" />
    </xsl:function>
    
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
            
            <!-- used templates -->
            <!--<xsl:apply-templates select="$base-stylesheet/generate:use-template" mode="used-templates"/>-->
            
            <!-- used global params -->
            <xsl:apply-templates select="$base-stylesheet/xsl:param[@generate:use = 'yes']" mode="global-params"/>
            
            
            
            
            
            
            <!-- intermediate-xsl : main template -->
            <intermediate-xsl:template name="init">
                <intermediate-xsl:comment>TARGET Generated at <intermediate-xsl:value-of select="current-dateTime()"/></intermediate-xsl:comment>
                <xsl:apply-templates select="." mode="generate-target" />
            </intermediate-xsl:template>
            
        </intermediate-xsl:stylesheet>
    </xsl:template>
    
    
    
    <!-- =============================================================================================== -->
    
    <xsl:template match="xsl:param" mode="global-params">
        <intermediate-xsl:param>
            <xsl:apply-templates select="node() | @*" mode="#current" />
        </intermediate-xsl:param>
    </xsl:template>
    
    <!-- 
        ### GENERATE NODES
        ==================
    -->
    <xsl:template match="generate:* | @generate:*" mode="#all">
        <!-- on dégage -->
  
    </xsl:template>
    
    <xsl:template match="generate:target-block" mode="generate-target">
        <!--
            Bloc de conde non signifiant dans la XSL initiale mais
            utilisé dans la XSL générée
            
            TODO, on garde ?
            TODO buildMode
         -->
        <xsl:apply-templates mode="#current" />
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
    
    <xsl:template match="generate:import|generate:param" mode="generate-target">
        <!-- generate générique, à voir à quels éléments on l'étend -->
        <xsl:element name="target-xsl:{local-name()}" namespace="generate::generate-target-stylesheet">
            <xsl:apply-templates select="node() | @*" mode="#current" />
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="generate:use-variable" mode="generate-target">
       <intermediate-xsl:variable>
           <xsl:attribute name="name" select="@name"/>
           <xsl:if test="exists(@as)">
               <xsl:copy-of select="@as"></xsl:copy-of>
           </xsl:if>
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
    
    <xsl:template match="generate:if" mode="generate-target">
        <intermediate-xsl:if test="{@test}">
            <xsl:apply-templates mode="generate-target">
                <xsl:with-param name="generate-block" select="." tunnel="yes" />
            </xsl:apply-templates>
        </intermediate-xsl:if>
    </xsl:template>
    
    <!--<xsl:template match="generate:use-template" mode="used-templates">
        <xsl:copy-of select="//xsl:template[@name = current()/@name]"></xsl:copy-of>
    </xsl:template>-->
    
    <xsl:template match="generate:copy-template" mode="generate-target">
        <xsl:param tunnel="yes" name="buildModes" select="$defaultBuildMode" />
        <xsl:param name="generate-block" select="." tunnel="yes" />
        <xsl:variable name="targetTemplate" as="element(xsl:template)">
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
        <xsl:variable name="nextBuildMode" select="if (@use-build-mode) then @use-build-mode else $buildModes"/>
        <xsl:message>NEXT BUILD MODE <xsl:value-of select="$nextBuildMode"/></xsl:message>
        <target-xsl:template>
            <xsl:apply-templates select="$targetTemplate/@*" mode="template-attributes"/>
            <xsl:apply-templates select="generate:*" mode="generated-template-attributes"/>
            <xsl:apply-templates select="generate:*" mode="generate-target">
                <xsl:with-param name="buildModes" tunnel="yes" select="$nextBuildMode" />
            </xsl:apply-templates>
            <xsl:apply-templates select="$targetTemplate/node()" mode="generate-target">
                <xsl:with-param name="buildModes" tunnel="yes" select="$nextBuildMode" />
            </xsl:apply-templates>
    
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
    
 
    <xsl:template match="generate:variable" mode="generate-target">
        <xsl:call-template name="generated-variable">
            <xsl:with-param tunnel="yes" name="buildModes" select="tokenize(@build,'\s+')" />
            <xsl:with-param name="name" select="@name" />
            <xsl:with-param name="definition" select="." />
        </xsl:call-template>
    </xsl:template>
    
    
    
    <!-- 
        ### XSL NODES
        =============
    -->
    
    <xsl:template match="xsl:call-template[@generate:build]" mode="generate-target">
        <xsl:param tunnel="yes" name="buildModes" select="$defaultBuildMode" />
        <xsl:variable name="callBuildMode" select="if(@generate:use-build-mode) then @generate:use-build-mode else '#template-call'"/>
        <!-- TODO ci dessus : attribut pour spécifier le mode (@genetate:mode)  -->
        <xsl:choose>
            <xsl:when test="tokenize(@generate:build,'\s+') = ($buildModes, $allBuildMode)">
                <xsl:comment>CALL ME MAYBE <xsl:value-of select="@name"/></xsl:comment>
                
                <xsl:variable name="targeted-template" select="(//xsl:template[@name = current()/@name])[1]" as="element(xsl:template)?"/>
                
                <intermediate-xsl:variable name="{generate-id(.)}-genId" ><intermediate-xsl:number /></intermediate-xsl:variable>
                <intermediate-xsl:variable name="{generate-id(.)}-templateGenerationID" select="concat('template-',{concat('''',tokenize(@name,':')[last()],'''')},'-call-{generate-id(.)}-',${generate-id(.)}-genId)"/>
                
                <target-xsl:variable name="{concat('{$',generate-id(.),'-templateGenerationID}')}">
                    <xsl:if test="$targeted-template/@as">
                        <xsl:copy-of select="$targeted-template/@as" ></xsl:copy-of>
                    </xsl:if>
                    <xsl:apply-templates select="$targeted-template/*" mode="#current" >
                        <xsl:with-param name="call-statement" select="." tunnel="yes" />
                        <xsl:with-param name="buildMode" select="$callBuildMode" tunnel="yes" />
                        <xsl:with-param name="callerBuildMode" select="$buildModes" />
                    </xsl:apply-templates>
                </target-xsl:variable>
                <target-xsl:copy-of select="{concat('${$',generate-id(.),'-templateGenerationID}')}"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:next-match />
            </xsl:otherwise>
        </xsl:choose>
     
    </xsl:template>
    
    <xsl:template match="xsl:template/xsl:param" mode="generate-target">
        <xsl:param name="callerBuildMode" as="xs:string?"/>
        <xsl:param tunnel="yes" name="buildModes" as="xs:string*"/>
        <xsl:param tunnel="yes" name="call-statement" as="element(xsl:call-template)?"  />
        <xsl:choose>
            <xsl:when test="$callerBuildMode">
                <xsl:variable name="evaluatingDef" select="$call-statement/xsl:with-param[@name = current()/@name][tokenize(@generate:build,'\s+') = $callerBuildMode]"/>
                <xsl:choose>
                    <xsl:when test="exists($evaluatingDef)">
                        <xsl:call-template name="generated-variable">
                            <xsl:with-param name="name" select="@name"/>
                            <xsl:with-param name="definition" select="$evaluatingDef" />
                            <xsl:with-param name="evaluate" select="true()" />
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <target-xsl:variable>
                            <xsl:apply-templates select="@*|node()" mode="generate-target" >
                                <xsl:with-param name="buildModes" select="$buildModes" tunnel="yes" />
                            </xsl:apply-templates>
                        </target-xsl:variable>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:next-match />
            </xsl:otherwise>
        </xsl:choose> 
    </xsl:template>
    
    <xsl:template match="xsl:template/@name" mode="template-attributes">
        <!--
            On supprime les @name pour éviter toute duplication
            TODO :
                Un peu radical, idéalement il ne faudrait les supprimer que si l'attribut est
                effectivement doublonné... (comment ?)
        -->
    </xsl:template>
    

    <xsl:template match="xsl:*" mode="#all"> 
        <xsl:param tunnel="yes" name="buildModes" select="$defaultBuildMode" as="xs:string*" />
        <xsl:variable name="ref" as="element()*" select="//generate:*[@id = current()/@generate:id or @name = current()/self::element(xsl:template)/@name]"/>
        <xsl:variable name="isRemoved" as="xs:boolean" select="generate-utils:is-removed(.,$ref,$buildModes)" />
        
        <xsl:if test="not($isRemoved)">
            <xsl:element name="target-xsl:{local-name()}" namespace="generate::generate-target-stylesheet">
                <xsl:apply-templates select="node() | @*" mode="#current" />
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
  
    <xsl:template match="xsl:if[@generate:build]" mode="#all">
        <xsl:param tunnel="yes" name="buildModes" select="$defaultBuildMode" />
        <xsl:choose>
            <xsl:when test="tokenize(@generate:build,'\s+') = ($buildModes, $allBuildMode)">
                <intermediate-xsl:if test="{@test}">
                    <xsl:apply-templates mode="#current" />
                </intermediate-xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:next-match />
            </xsl:otherwise>
        </xsl:choose>
       
    </xsl:template>

    
    <!--
        TODO : wrap dans variable (comme call-template) 
    
        TODO WARNING : la xsl:var genId peut potentiellement être dupliquée
        Si on a plusieurs for-each[@generate:build]
        
    -->
    <xsl:template match="xsl:for-each[@generate:build]" mode="#all">
        <xsl:param tunnel="yes" name="buildModes" select="$defaultBuildMode" />
        <xsl:choose>
            <xsl:when test="tokenize(@generate:build,'\s+') = ($buildModes, $allBuildMode)">
                <xsl:variable name="type" select="generate-utils:get-type(.)" as="xs:string?"/>
                
                <intermediate-xsl:variable name="{generate-id(.)}-genId" ><intermediate-xsl:number /></intermediate-xsl:variable>
                <intermediate-xsl:variable name="{generate-id(.)}-forEachGenerationID" select="concat('foreach-{generate-id(.)}-evaluation-',${generate-id(.)}-genId)"/>
                
                <target-xsl:variable name="{concat('{$',generate-id(.),'-forEachGenerationID}')}">
                    <xsl:choose>
                        <xsl:when test="$type">
                            <xsl:attribute name="as" select="$type"></xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:message>[GENERATE XSL][WARNING] the type of <xsl:value-of select="@select"/> could not be determined. It may lead to errors or unexpected behavior</xsl:message>
                        </xsl:otherwise>
                    </xsl:choose>
                    <intermediate-xsl:for-each select="{@select}">   
                        <xsl:apply-templates mode="#current" />
                    </intermediate-xsl:for-each>
                </target-xsl:variable>
                <target-xsl:copy-of select="{concat('${$',generate-id(.),'-forEachGenerationID}')}" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:next-match></xsl:next-match>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
   
   
    

    <xsl:template match="xsl:choose[@generate:build]" mode="#all">
        <xsl:param tunnel="yes" name="buildModes" select="$defaultBuildMode" />
        <xsl:choose>
            <xsl:when test="tokenize(@generate:build,'\s+') = ($buildModes, $allBuildMode)">
                <intermediate-xsl:choose>
                    <xsl:apply-templates mode="evaluate-choose"></xsl:apply-templates>
                </intermediate-xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:next-match />
            </xsl:otherwise>
        </xsl:choose>      
    </xsl:template>
    
    
    
    <xsl:template match="xsl:when" mode="evaluate-choose">
        <intermediate-xsl:when test="{@test}">
            <xsl:apply-templates mode="generate-target" />
        </intermediate-xsl:when>
    </xsl:template>
    
    <xsl:template match="xsl:otherwise" mode="evaluate-choose">
        <intermediate-xsl:otherwise>
            <xsl:apply-templates mode="generate-target" />
        </intermediate-xsl:otherwise>
    </xsl:template>
    
    
    <xsl:template match="xsl:value-of[@generate:build]" mode="generate-target">    
        <xsl:param tunnel="yes" name="buildModes" select="$defaultBuildMode" />
        <xsl:choose>
            <xsl:when test="tokenize(@generate:build,'\s+') = ($buildModes, $allBuildMode)">
                <intermediate-xsl:value-of>
                    <xsl:apply-templates select="@*" />
                    <xsl:apply-templates select="node()" mode="generate-target" />
                </intermediate-xsl:value-of>      
            </xsl:when>
            <xsl:otherwise>
                <xsl:next-match />
            </xsl:otherwise>
        </xsl:choose>           
    </xsl:template>
    
    

    

    <xsl:template match="xsl:variable" mode="#all">
        <!--
            ATTENTION, distinguer le cas Local/Global variable...
            
            BIEN PRECISER les contours du $generate-block, qui se veut le "scope" de la variable
            
            TODO : Améliorer la gestion $scope... Qui n'est utile que pour le @name
            l'ID doit fonctionner tout le temps, sans notion de scope car il est unique.
         -->
        
        <xsl:param tunnel="yes" name="buildModes" select="$defaultBuildMode" />
        
        <xsl:param name="generate-block" tunnel="yes" /> 
        
        <xsl:variable name="ref" select="//generate:*[@id = current()/@generate:id or @name = current()/self::element(xsl:template)/@name]"/>
        <xsl:variable name="isRemoved" as="xs:boolean" select="generate-utils:is-removed(.,$ref,$buildModes)" />
        
        <xsl:variable name="scope" select="if ($generate-block) then $generate-block else (/*)"/>
        <xsl:variable name="this" select="."/>
        <xsl:variable
            name="generate:redefinition"
            select="$scope//generate:redefine-variable[(@name = $this/@name) or (@id = $this/@generate:id)]"
            as="element(generate:redefine-variable)?"
        />
        <xsl:if test="@generate:use = 'yes'">
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
        </xsl:if>
        <xsl:choose>
            <xsl:when test="exists($generate:redefinition)">
                <xsl:call-template name="generated-variable">
                    <xsl:with-param name="name" select="$this/@name" />
                    <xsl:with-param name="definition" select="$generate:redefinition" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="tokenize(@generate:build,'\s+') = ($buildModes, $allBuildMode)">
                <xsl:call-template name="generated-variable">
                    <xsl:with-param name="name" select="$this/@name" />
                    <xsl:with-param name="evaluate" select="true()"></xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="not($isRemoved)">
                <target-xsl:variable>
                    <xsl:apply-templates select="node() | @*" mode="generate-target" />          
                </target-xsl:variable>   
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    

    <xsl:template name="generated-variable">
        <xsl:param tunnel="yes" name="buildModes" select="$defaultBuildMode" />
        <xsl:param name="name" as="xs:string" required="yes" />
        <xsl:param name="definition" as="element()?" />
        <xsl:param name="evaluate" as="xs:boolean" select="$definition/tokenize(@build,'\s+') = ($buildModes, $allBuildMode)"/>
        <target-xsl:variable>
            <xsl:attribute name="name" select="$name"></xsl:attribute>
            <xsl:if test="exists($definition/@as)">
                <xsl:copy-of select="$definition/@as"></xsl:copy-of>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="exists($definition/@select) and not($evaluate)">
                    <xsl:attribute name="select" select="$definition/@select" />
                </xsl:when>
                <xsl:when test="exists($definition/@select) and $evaluate">
                    <!-- TODO : COPY-OF/VALUE-OF ? -->
                    <intermediate-xsl:copy-of select="{$definition/@select}" />
                </xsl:when>
                <xsl:when test="$evaluate">
                    <!-- from <xsl:variable generate:build="build" -->
                    <!-- TODO : COPY-OF/VALUE-OF ? -->
                    <intermediate-xsl:value-of select="{@select}" />
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
    
    <xsl:template match="node() | @*" mode="#all" name="identity">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="generate-target"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="comment()" mode="#all" priority="1">
        <xsl:if test="not($generate:skip-comments)">
            <xsl:choose>
                <xsl:when test="$generate:comment-intermediate">
                    <xsl:comment select="." />
                </xsl:when>
                <xsl:otherwise>
                    <intermediate-xsl:comment>
                        <xsl:value-of select="."/>
                    </intermediate-xsl:comment>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
        
    </xsl:template>
    
    <xsl:template match="comment()[ancestor::node()/@generate:build]" mode="#all" priority="2">
       <!--
           on sucre les commentaires dans les blocs générés,
           sinon on peut avoir des déclaration de commentaire venant avant des declarations d'attributs.
       -->
    </xsl:template>

    <xsl:template match="@*" mode="generate-target evaluated-template-call" priority="1">
        <xsl:if test="not(namespace-uri(.) = $generate:ns)">
            <xsl:attribute name="{name()}" namespace="{namespace-uri()}">       
                <xsl:value-of select="concat('{''',replace(.,'''',''''''),'''}')"/>   
            </xsl:attribute>   
        </xsl:if>   
    </xsl:template>
    
    
    
    
    
</xsl:stylesheet>