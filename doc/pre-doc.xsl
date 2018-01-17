<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:doc="http://jimetevenard.com/ns/generate-xsl/doc"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <doc:doc>
            <xsl:comment>
                <title>...</title>
                <p>...</p>
            </xsl:comment>
            <xsl:apply-templates/>
        </doc:doc>
        
    </xsl:template>

    <xsl:template match="xsl:template[starts-with(@match,'xsl')][contains(@match,'@')]">
        <doc:langAttribute>
            <xsl:attribute name="name" select="./@match"></xsl:attribute>
            
        </doc:langAttribute>
        
    </xsl:template>
    
    <xsl:template match="xsl:template[starts-with(@match,'generate')]">
        <doc:langElement>
            <xsl:attribute name="name" select="./@match"></xsl:attribute>
            
        </doc:langElement>
        
    </xsl:template>
    
    <xsl:template match="xsl:template" >
        <doc:langNode>

            <xsl:attribute name="name" select="./@match"></xsl:attribute>
            <xsl:comment>Undefined</xsl:comment>
            
        </doc:langNode>
        
    </xsl:template>
    
    
</xsl:stylesheet>