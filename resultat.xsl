<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:generate="http://jimetevenard.com/ns/generate-xsl" exclude-result-prefixes="xs" version="2.0">
    
    
   
    <xsl:template match="*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    
    <!-- We love attributes so much... -->
    <xsl:template match="@*">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    
    <!--Picard--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Royer--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Mallet--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Leroux--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Breton--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Richard--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Gautier--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Denis--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Dumas--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Brun--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Vasseur--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Garcia--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Gay--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Albert--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Fleury--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Fernandez--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Leveque--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Lemoine--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Brunet--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Dupuis--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Aubry--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Adam--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Robert--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Mallet--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Royer--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Charpentier--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Evrard--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Lemoine--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Richard--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Roux--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Caron--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Caron--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Deschamps--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Millet--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Lambert--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Maillard--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Remy--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Bouvier--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Mallet--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Millet--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Huet--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--David--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Arnaud--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Francois--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Bonnet--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Schmitt--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Brun--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Riviere--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Masson--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Lacroix--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Le gall--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Rey--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Lopez--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Henry--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Dufour--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Aubry--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Charles--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Sanchez--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Guerin--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Dupuis--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Perez--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Collet--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Muller--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Arnaud--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Roger--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Blanc--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Collin--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Lemoine--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Roux--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Andre--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Pierre--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Rousseau--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Andre--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Durand--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Lopez--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Brunet--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Adam--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Le gall--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Aubry--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Durand--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Poirier--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Rousseau--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Noel--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Le gall--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Richard--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Gauthier--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Colin--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Renaud--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Collet--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Bouvier--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Lebrun--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Picard--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Moreau--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Philippe--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Bonnet--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Gauthier--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Lambert--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Mathieu--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Gaillard--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template><!--Le gall--><xsl:template match="client">
        <xsl:copy>
            <xsl:attribute name="new-attr">hello !</xsl:attribute>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    
    
    
    
</xsl:stylesheet>