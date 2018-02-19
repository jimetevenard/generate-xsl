<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:doc="http://jimetevenard.com/ns/generate-xsl/doc" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:spectrum="internal"
    exclude-result-prefixes="#all" version="3.0">

    <xsl:output method="xhtml" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:import href="doc-code-blocks.xsl"/>

    <xsl:function name="doc:headerTag">
        <xsl:param name="elt" as="element()"/>
        <xsl:value-of
            select="concat('h', string(count($elt/ancestor::element()[doc:h or doc:*[starts-with(local-name(.), 'lang')]])))"
        />
    </xsl:function>

    <xsl:variable name="inlineElements"
        select="('a', 'img', 'link', 'b', 'i', 'span', 'namespaceRef', 'definitionRef', 'element', 'attribute', 'langNodeRef', 'code','br')"/>

    <xsl:template match="doc:meta">
        <!-- void -->
    </xsl:template>
    

    <xsl:template match="/">
        <html>
            <head>
                <meta name="viewport" content="width=device-width" />
                <link href="assets/bootstrap.min.css" rel="stylesheet"/>
                <link href="assets/doc.css" rel="stylesheet"/>
                <title>
                    <xsl:value-of select="(//doc:h)[1]"/>
                </title>
            </head>
            <body>
                <header>
                    <a class="project-repo">
                        <xsl:variable name="project" select="(//doc:project)[1]"/>
                        <xsl:attribute name="href" select="$project/@repository" />
                        <xsl:value-of select="$project"/>
                    </a>
                </header>
                <xsl:apply-templates/>
            </body>

        </html>
    </xsl:template>

    <xsl:template match="doc:doc">
        <main>
            <p class="update">
                <xsl:text>Révisé le </xsl:text>
                <xsl:value-of select="format-date(current-date(),'[D01] [MNn] [Y0001]','fr',(),())"/>
                <!-- bof, c'est pas parcequ'on lance cette transfo que la doc a effectivement été mise à jour... -->
            </p>
            <xsl:apply-templates/>
        </main>
    </xsl:template>
    
    <xsl:template match="doc:toc">
        <ul class="toc">
        <xsl:apply-templates mode="toc" select="/"></xsl:apply-templates>
        </ul>
    </xsl:template>
    
    <xsl:template match="* | text()"  mode="toc">
        <xsl:apply-templates mode="toc" />
    </xsl:template>
    
    <xsl:template match="doc:h|doc:langElement|doc:langAttribute"  mode="toc">
        <li>
            <a href="#">
            <xsl:choose>
                <xsl:when test="starts-with(local-name(),'lang')">
                    <xsl:value-of select="@name"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
            </a>
            <ul class="toc">
                <xsl:apply-templates mode="toc" />
            </ul>  
        </li>
    </xsl:template>
    
    <xsl:template match="doc:h">
        <xsl:element name="{doc:headerTag(.)}">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="doc:p[descendant::element()[not(local-name() = $inlineElements)]]">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="doc:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="doc:case">
        <div class="case">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="doc:warning|doc:info">
        <div class="alert alert-{local-name()}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    
    
    <xsl:template match="doc:br | doc:code | *:a | *:img | *:link | *:b | *:i | *:span | *:section">
        <xsl:element name="{local-name()}">
            <xsl:copy-of select="@*"></xsl:copy-of>
            <xsl:if test="local-name() = 'a'">
                <xsl:attribute name="target" select="'_blank'" />
            </xsl:if>
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="doc:element">
        <code class="element node">
            <xsl:text>&lt;</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>/&gt;</xsl:text>
        </code>
    </xsl:template>

    <xsl:template match="doc:attribute">
        <code class="attribute node">
            <xsl:text>@</xsl:text>
            <xsl:value-of select="."/>
        </code>
    </xsl:template>
    
    

    <xsl:template match="doc:langElement | doc:langAttribute">
        <xsl:variable name="langNodeType" select="concat(substring(local-name(), 5), ' ')"/>
        <div class="{local-name()} card langNode">
            <xsl:attribute name="id" select="concat('langnode-', escape-html-uri(@name))"/>
            <div class="card-body">
                <xsl:element name="{doc:headerTag(.)}">
                    <xsl:attribute name="class" select="'card-title'"/>
                    <xsl:value-of select="$langNodeType"/>
                    <code>
                        <xsl:value-of select="@name"/>
                    </code>
                </xsl:element>
                <xsl:apply-templates/>
            </div>
        </div>
    </xsl:template>



    <xsl:template match="doc:definition">
        <div class="definition">
            <xsl:attribute name="id" select="concat('definition-', @id)"/>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="doc:namespaceRef">
        <xsl:variable name="targetedNamespace" select="(//doc:namespace[@id = current()/@idRef])[1]"/>
        <a href="#" class="namespace-ref">
            <xsl:attribute name="title"
                select="$targetedNamespace/concat(@usual-prefix, ':', @uri)"/>
            <xsl:apply-templates/>
            <code class="uri"><xsl:value-of select="$targetedNamespace/@uri"/></code>
        </a>
    </xsl:template>

    <xsl:template match="doc:definitionRef">
        <xsl:variable name="referedDefinition"
            select="(//doc:definition[@id = current()/@idRef])[1]"/>
        <a>
            <xsl:attribute name="href" select="concat('#definition-', $referedDefinition/@id)"/>
            <xsl:apply-templates/>
        </a>
    </xsl:template>

    <xsl:template match="doc:langNodeRef">
        <xsl:variable name="referedLangNode"
            select="(//*[starts-with(local-name(.), 'lang')][@name = current()/@nameRef])[1]"/>
        <xsl:variable name="langNodeType"
            select="lower-case(substring-after(local-name($referedLangNode), 'lang'))"/>
        <a>
            <xsl:attribute name="href"
                select="concat('#langnode-', escape-html-uri($referedLangNode/@name))"/>
            <code class="{$langNodeType} ref node">
                <xsl:choose>
                    <xsl:when test="$langNodeType = 'attribute'">
                        <xsl:text>@</xsl:text>
                        <xsl:value-of select="$referedLangNode/@name"/>
                    </xsl:when>
                    <xsl:when test="$langNodeType = 'element'">
                        <xsl:text>&lt;</xsl:text>
                        <xsl:value-of select="$referedLangNode/@name"/>
                        <xsl:text>/&gt;</xsl:text>
                    </xsl:when>
                </xsl:choose>

            </code>
        </a>
    </xsl:template>
    
    
    <xsl:template match="doc:codeBlock">

           <!-- <pre lang="xslt">
                <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
                <xsl:copy-of select="*"/>    
                <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
            </pre>-->
        <pre>
            <xsl:apply-templates mode="xml2html"></xsl:apply-templates>
        </pre>
        
    </xsl:template>
    



</xsl:stylesheet>
