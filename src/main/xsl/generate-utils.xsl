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
    
    
    <xsl:variable name="generate:ns" select="'http://jimetevenard.com/ns/generate-xsl'"/>
    <xsl:variable name="defaultBuildMode" select="'#default'"/>
    <xsl:variable name="allBuildMode" select="'#all'"/>
    
    
    <!-- UTILS --> 
    <xsl:variable name="generate-utils:ncname.regex" select="'(\c)+?'"/>
    <xsl:variable name="generate-utils:qname.regex" select="$generate-utils:ncname.regex"/><!-- TMP !! -->
    <xsl:variable name="generate-utils:varReference.regex" select="concat('^\$',$generate-utils:qname.regex,'$')"/>
    
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
            
            <xsl:when test="generate-utils:is-function-call($xpath,$element)">
                <!-- this XPath is a (simple) function call -->
                <xsl:variable name="declaration" as="element(xsl:function)?" select="generate-utils:find-function-declaration($xpath,$element)"/>
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
        <xsl:sequence select="$contextItem/tokenize(@generate:remove,'\s+') = ($buildModes, $allBuildMode) or $refIsMatchingRemoveElement" />
    </xsl:function>
    
    <xsl:function name="generate-utils:is-function-call" as="xs:boolean">
        <xsl:param name="xPath" as="xs:string" />
        <xsl:param name="resolutionBase" as="node()"/>
        <!-- 
            TODO : déctecter si une expression xPath est de type
            ns:function-call(args... )
        -->
        <xsl:sequence select="false()"></xsl:sequence>
    </xsl:function>
    
    <xsl:function name="generate-utils:find-function-declaration" as="element(xsl:function)?">
        <xsl:param name="xPath" as="xs:string" />
        <xsl:param name="resolutionBase" as="node()"/>
        <!-- this does not work for expressions like "functA()/functB()" -->
        
        <xsl:variable name="functionName" select="substring-before($xPath,'(')"/>
        <xsl:variable name="root" select="$resolutionBase/ancestor-or-self::element(xsl:stylesheet)"/>
        <xsl:sequence      
            select="$root/xsl:function[resolve-QName(@name,$root) = resolve-QName($functionName,$resolutionBase)]"/>
    </xsl:function>
  
    
    
    
    
    
    
</xsl:stylesheet>