<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:doc="http://jimetevenard.com/ns/generate-xsl/doc" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="#all" version="3.0">
 
    
    <xsl:template match="text()" mode="xml2html">
        <xsl:param name="identation-level" select="0" as="xs:integer" ></xsl:param>
        
        <xsl:variable name="content" select="normalize-space(.)"/>
        <xsl:if test="not($content = '')">
            <xsl:call-template name="indentation">
                <xsl:with-param name="counter" select="$identation-level * 4"></xsl:with-param>
            </xsl:call-template>
            
            <xsl:value-of select="$content"/>
            
            <xsl:text>&#xa;</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="*" mode="xml2html">
        <xsl:param name="identation-level" select="0" as="xs:integer" ></xsl:param>
        
        
        <xsl:call-template name="indentation">
            <xsl:with-param name="counter" select="$identation-level * 4"></xsl:with-param>
        </xsl:call-template>
        
       <span class="elt-name">
        <xsl:text>&lt;</xsl:text>
        <xsl:value-of select="name()"/>
        <xsl:apply-templates select="@*" mode="#current" />
        <xsl:text>&gt;</xsl:text>
       </span>
       <xsl:text>&#xa;</xsl:text>
        
              
        <xsl:apply-templates select="node()" mode="#current" >
            <xsl:with-param name="identation-level" select="$identation-level + 1" />
        </xsl:apply-templates>
        
        
        <xsl:call-template name="indentation">
            <xsl:with-param name="counter" select="$identation-level * 4"></xsl:with-param>
        </xsl:call-template>
        
        <span class="elt-name">
         <xsl:text>&lt;/</xsl:text>
         <xsl:value-of select="name()"/>
         <xsl:text>&gt;</xsl:text>
        </span>
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>
    
    <xsl:template match="@*" mode="xml2html">
        <xsl:text> </xsl:text>
        <span class="attr">
         <xsl:value-of select="name()"/>
         <xsl:text>="</xsl:text>
            <span class="attr-value">
                <xsl:value-of select="."/>
            </span>
         <xsl:text>" </xsl:text>
        </span>
    </xsl:template>
    
    <xsl:template name="indentation">
        <xsl:param name="counter"/>
        <xsl:message>counter is <xsl:value-of select="$counter"/></xsl:message>
        <xsl:variable name="espace" select="'&#160;'"/> 
        <xsl:if test="$counter gt 0">
            <xsl:value-of select="$espace"/>
            <xsl:call-template name="indentation">
                <xsl:with-param name="counter" select="$counter - 1"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>


</xsl:stylesheet>
