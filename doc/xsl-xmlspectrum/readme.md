##Files in the *xsl* directory
<table>
<thead>
<tr><th>File</th><th>Description</th></tr>
</thead>
<tbody>
<tr><td>xmlspectrum.xsl</td><td>Top-level stylesheet for XSLT/XML. Provides functions to be used by an importing stylesheet.</td>
</tr>
<tr><td>xq-spectrum.xsl</td><td>Top-level stylesheet for XQuery. Provides functions to be used by an importing stylesheet, imports xq-handler.xsl</td>
</tr>
<tr><td>xq-handler.xsl</td><td>Functions for processing XQuery sub-expression tokens except element/attribute-constructors, comments and string-literals. The open/closed state of the sub-expression must be supplied.</td>
</tr>
<tr><td>highlight-file.xsl</td><td>Transforms a plain-text or XML code file to HTML with syntax highlighted code. Optionally (for XSLT) transforms imported files and creates a table-of-contents file.</td></tr>
<tr><td>highlight-inline.xsl</td><td>Transforms an XHTML file containing code samples (embedded in <I>pre</I> elements) to syntax-highlighted HTML.</td></tr>
<tr>
<td>make-toc.xsl</td><td><I>Internal use only.</I> Imported by highlight-file.xsl for creation of a table-of-contents for multi-file XSLT proejcts</td>
</tr>
<tr>
<td>dummy*.xsl</td><td>XSLT files prefixed with 'dummy' are imported/included, but they only exist to allow xmlspectrum.xsl to be run against itself as a self-test. Eventually, these dummy files will be removed.</td>
</tr>
<tr>
<td>data/color-themes.xml</td><td>XML resource file that defines all color themes for syntax highlighting</td>
</tr>

</tbody>
</table>

##Usage

XMLSpectrum is implemented using standard XSLT 2.0 (no extensions). Therefore, any compliant XSLT 2.0 processor can be used to create the desired syntax-highlighted HTML output. The two top-level stylesheets, *highlight-file.xsl* and *highlight-inline.xsl* are designed to be fully working samples of how to import and use *xmlspectrum.xsl* - which is the core stylesheet.

*Note: The highlight-file.xsl stylesheet can process a multi-file modular XSLT project from a single-entry point XSLT, with the directory structure of the HTML output mirroring that of the input. The default output URIResolver for the Saxon XSLT processor automatically creates the required directories (from the `xsl:result-document` `href`), other processors may require that the required output directory structure is created in some other way.*

Typically, XSLT 2.0 transforms are initiated through the XSLT processor's API, through a GUI development tool or directly from the command-line. The command-line samples given here are for use with the Saxon XSLT 2.0 processor (Saxon-HE 9.4.0.6J was used for testing).

##XML Editor

###Oxygen XML Editor: Sample Transform Scenario

  1. *XML URL* $(currentFileURL}
  2. *XSL URL* *[path to highlight-file.xsl]
  3. Parameters Dialog:
	a. indent="2"
	b. auto-trim="yes"
  4. Output Dialog:
	a. Save As: ${cfd}\${cfn}.html
	b. Open in browser - Saved file [checked]

##Command Line

###Command-line params

   1. -s:*stylesheet.xsl* sets the stylesheet path/URI
   2. -it:main sets the inital template to 'main' (highlight-file.xsl only)
   3. -o:*op-destination* sets the output destination path (highlight-inline.xsl only)


###XSLT parameters
XSLT parameters for both highlight-file and highlight-inline (unless specified otherwise)
Parameter Syntax: [param-name]=[param-value]

   1. *sourcepath*  string sets the target file URL/path to be highlighted
   2. *color-theme* [light | *dark* | roboticket-grey | roboticket-white | tomorrow-night | github | github-blue | pg-light] sets syntax-highlighting theme
   3. *indent*      integer sets number of indent chars for each nest-level
   4. *force-newline* inserts line-feeds for non-formatted XML. Use *indent* to set indentation
   5. *auto-trim*   [yes|*no*] trims all left-hand indentation characters
   6. *css-path*    optional. string sets custom URL for external CSS link element in output HTML
   7. *output-path* optional. sets the directory path to send output files to (highlight-file.xsl only)
   8. *font-name*   [scp|*std*] abbreviated name for HTML font: scp = [Adobe Source Code Pro](http://blogs.adobe.com/typblography/2012/09/source-code-pro.html) std = monospace
  9. *inline-css* [yes|*no*] embeds css color styles in each span element
  10. *link-names* [yes|*no*] processes all included/imported XSLT and adds hyperlinks and TOC
  11. *document-type*  optional. Identifies XML vocabulary when root element is different
  12. *document-type-prefix* optional. Associates an XML prefix with the *document-type*
  13. *format-mixed-content* optional. Applies indentation to mixed-content XML 

###Samples - *highlight-file.xsl* & *highlight-inline.xsl*

Examples running from the command-line using the Saxon-HE XSLT 2.0 processor:

###Sample Description

1. Colorise XSLT 2.0 file

2. Colorise XQuery 1.0 file "xqdoc-display.xqy"

3. Colorise XSD 1.1 snippet file

4. Colorise and indent XSLT file (the xmlspectrum source code) - use default dark theme

5. Colorise and reformat highlight-file.xsl- use light theme, recurse imports, creat toc and add hyper-links

6. Colorise and reformat docbook XSLT 2.0 from an absolute path - use light theme, recurse imports, creat toc and add hyper-links

7. Colorise XProc file

8. Colorise XSLT, XSD and XPath embedded within *pre* elements in an HTML file - use default dark theme

9. Colorise XSLT, XSD and XPath embedded within *pre* elements in an HTML file - use light-theme

10. Colorise and reformat XSLT file (the xmlspectrum source code) - use default dark theme

11. Colorise and reformat a blog entry containing XSLT, XSD and XPath - use default dark theme and Source Code Pro font

12. (Simplified for well-formed XML) colorise and reformat well-formed XSLT file:

### Command-Line Sample Syntax

```
1. java -cp "C:\Saxon\saxon9he.jar" net.sf.saxon.Transform -t -it:main -xsl:xsl/highlight-file.xsl sourcepath=../samples/xpathcolorer-x.xsl

2. java -cp "C:\Saxon\saxon9he.jar" net.sf.saxon.Transform -t -it:main -xsl:xsl/highlight-file.xsl sourcepath=../samples/xquery/xqdoc-display.xqy light-theme=no

3. java -cp "C:\Saxon\saxon9he.jar" net.sf.saxon.Transform -t -it:main -xsl:xsl/highlight-file.xsl sourcepath=../samples/schema-assert.xsd

4. java -cp "C:\Saxon\saxon9he.jar" net.sf.saxon.Transform -t -it:main -xsl:xsl/highlight-file.xsl sourcepath=../xsl/xmlspectrum.xsl indent=2

5. java -cp "C:\Saxon\saxon9he.jar" net.sf.saxon.Transform -t -it:main -xsl:xsl/highlight-file.xsl^
sourcepath=../xsl/highlight-file.xsl indent=2 link-names=yes theme=light output-path="new-output"

6. java -cp "C:\Saxon\saxon9he.jar" net.sf.saxon.Transform -t -it:main -xsl:xsl/highlight-file.xsl^
sourcepath="C:\docbook-xslt2-2.0.0\xslt\base\html\docbook.xsl" indent=0 link-names=yes

7. java -cp "C:\Saxon\saxon9he.jar" net.sf.saxon.Transform -t -it:main -xsl:xsl/highlight-file.xsl^
sourcepath=../samples/xproccorb.xpl

8. java -cp "C:\Saxon\saxon9he.jar" net.sf.saxon.Transform -t -xsl:xsl/highlight-inline.xsl^
-s:samples/html-inline-sample.html -o:output/highlighted-inline.html

9. java -cp "C:\Saxon\saxon9he.jar" net.sf.saxon.Transform -t -xsl:xsl/highlight-inline.xsl^
-s:samples/html-inline-sample.html -o:output/highlighted-inline.html theme=light

10. java -cp "C:\Saxon\saxon9he.jar" net.sf.saxon.Transform -t -xsl:xsl/highlight-inline.xsl^
-s:samples/badly-formatted-extract.html indent=2 auto-trim=yes -o:output/reformatted-extract.html

11. java -cp "C:\Saxon\saxon9he.jar" net.sf.saxon.Transform -t -xsl:xsl/highlight-inline.xsl^
-s:samples/blog-sample.html indent=2 font-name=scp -o:output/blog-sample.html

12. java -cp "C:\Saxon\saxon9he.jar" net.sf.saxon.Transform -t^
-xsl:xsl/highlight-file.xsl -s:xsl/xmlspectrum.xsl indent=2
```

##Links

Introduction and features: [xmlspectrum/readme](https://github.com/pgfearo/xmlspectrum/blob/master/readme.md)















