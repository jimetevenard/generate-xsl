package com.jimetevenard.xslt.api;

import java.io.File;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashSet;
import java.util.Set;

import com.jimetevenard.xslt.api.GenerationScenario;
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

public abstract class ScenariParser {
	
	
	
	public abstract void parse() throws SaxonApiException, URISyntaxException;
	
	public abstract Set<GenerationScenario> getScenari();
	
	public static ScenariParser newInstance(String confPath){
		// TODO mécanisme de choix d'implémentation
		// System.property, service provider...
		
		return new SaxonScenariParser(confPath);
	}

}
