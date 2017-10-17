<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:metier="http://cogip.biz"
    exclude-result-prefixes="xs"
    version="3.0">
    
    <xsl:variable name="prenomFeminins" select="doc('../prenoms-feminins.xml')"/>
    
    <xsl:function name="metier:isFemme" as="xs:boolean">
        <xsl:param name="client" as="element(client)"></xsl:param>
        <xsl:sequence select="$client/prenom = $prenomFeminins//prenom" />
    </xsl:function>
    
</xsl:stylesheet>