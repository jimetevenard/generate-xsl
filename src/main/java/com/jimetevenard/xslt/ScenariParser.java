package com.jimetevenard.xslt;

import java.io.File;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashSet;
import java.util.Set;

import com.jimetevenard.xslt.GenerationScenario;
import com.jimetevenard.xslt.implSaxon.SaxonScenariParser;
import com.jimetevenard.xslt.utils.ParamsMap;

import net.sf.saxon.s9api.DocumentBuilder;
import net.sf.saxon.s9api.Processor;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.XPathCompiler;
import net.sf.saxon.s9api.XPathExecutable;
import net.sf.saxon.s9api.XPathSelector;
import net.sf.saxon.s9api.XdmItem;
import net.sf.saxon.s9api.XdmNode;
import net.sf.saxon.s9api.XdmValue;


/**
 * A parser to deal with scenari xml File.<br>
 * 
 * Referer to <a href="https://jimetevenard.github.io/generate-xsl/scenari.xsd" > the Scenari File schema</a><br />
 * 
 * By default, the implementation provided by the {@link #newInstance(String) newInstance} method
 * is a {@link SaxonScenariParser} instance.
 * 
 * @author jetevenard
 *
 */
public abstract class ScenariParser {
	
	
	/**
	 * Parses the XML file and builds a set of {@link GenerationScenario}
	 * 
	 * @throws SaxonApiException
	 * @throws URISyntaxException
	 */
	public abstract void parse() throws SaxonApiException, URISyntaxException; // TODO Saxon Ici
	
	/**
	 * Accessor for the scenarios set.
	 * This method must be called after the {@link #parse()} method.
	 * 
	 * @return the scenarios found in the XML file.
	 */
	public abstract Set<GenerationScenario> getScenari();
	
	/**
	 * Constructs an new Instance to process
	 * a <a href="https://jimetevenard.github.io/generate-xsl/scenari.xsd" >scenari XML file</a>.
	 * 
	 * @param xmlFilePath : The path to the XML File
	 * @return an instance of this type.
	 */
	public static ScenariParser newInstance(String xmlFilePath){
		// TODO mécanisme de choix d'implémentation
		// System.property, service provider...
		
		return new SaxonScenariParser(xmlFilePath);
	}

}
