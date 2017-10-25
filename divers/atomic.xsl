<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    
    <xsl:template name="main">
        <xsl:variable name="toto" as="xs:boolean">
            <xsl:value-of select="'false'"/>
        </xsl:variable>
        <xsl:message>
            <xsl:text>Lexical boolean : </xsl:text>
            <xsl:value-of select="if ($toto) then 'TOTO EST TRUE' else 'TOTO est false !'"/>
        </xsl:message>
    </xsl:template>
</xsl:stylesheet>