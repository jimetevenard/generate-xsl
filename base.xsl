<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:generate="http://jimetevenard.com/ns/generate-xsl"
    exclude-result-prefixes="xs"
    version="2.0">
    
    
   
    <xsl:template match="*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"></xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    
    <!-- We love attributes so much... -->
    <xsl:template match="@*">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <generate:iterate for="doc('clients.xml')//nom" as="client">
        <generate:match xpath="*[nom = '{$client}']"/>
    </generate:iterate>
    <xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"></xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    
    
    <generate:remove/>
    <xsl:template match="comment()">
        <xsl:message>FOUND COMMENT ! : <xsl:value-of select="."/></xsl:message>
    </xsl:template>
</xsl:stylesheet>