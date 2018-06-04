package com.jimetevenard.xslt;

import java.io.File;
import java.net.URISyntaxException;
import java.util.Set;


import com.jimetevenard.xslt.implSaxon.ScenariParser;
import com.jimetevenard.xslt.implSaxon.XSLTGenerator;

import net.sf.saxon.s9api.SaxonApiException;

/**
 * 
 * <h1>Driver</h1>
 * 
 * This is the entry point to the Java API.
 * 
 * It processes the scenari file via a {@link ScenariParser}, and execute the compilation with a {@link XSLTGenerator}.
 * 
 * 
 * 
 * @author jimetevenard
 *
 */
public class Driver {
	
	private File scenariFile;
	private File catalog;
	private File dirForIntermediates; // for debug
	private boolean licencedSaxon;
	
	/**
	 * 
	 * @param log logger
	 * @param scenariFile Scenari file - cf. https://jimetevenard.github.io/generate-xsl/scenari.xsd
	 * @param catalog <a href="https://www.oasis-open.org/committees/entity/spec-2001-08-06.html">XML Catalog file</a>
	 */
	public Driver( File scenariFile, File catalog) {
		super();
		this.scenariFile = scenariFile;
		this.catalog = catalog;

	}
	/**
	 * 
	 * @param log : logger
	 * @param scenariFile Scenari file : cf. https://jimetevenard.github.io/generate-xsl/scenari.xsd
	 */
	public Driver( File scenariFile) {
		super();
		this.scenariFile = scenariFile;

	}
	
	
/**
 * For debug purpose, you might want to have a look to the intermediate generated XSL.<br>
 * If this param is set, the intermediate XSL will be stored there.
 * 
 * @param dirForIntermediates (must be an existing directory)
 */
	public void setDirForIntermediates(File dirForIntermediates) {
		this.dirForIntermediates = dirForIntermediates;
	}
	
	/**
	 * Set to true to use Saxon PE/EE functionalities.<br>
	 * <i>The you need to buildthis project with SaxonEE/PE dependency + licence</i>
	 * 
	 * 
	 * @param licencedSaxon
	 */
	public void setLicencedSaxon(boolean licencedSaxon) {
		this.licencedSaxon = licencedSaxon;
	}
	
	
	/**
	 * Once you've built a Driver and eventually set
	 * {@link Driver#setDirForIntermediates(File) dirForIntermediates} and 
	 * {@link Driver#setLicencedSaxon(boolean) licencedSaxon}, use this method
	 * to launch the generation process.
	 * 
	 * @throws GenerationException if an error occur during the compilation.
	 */
	public void launch() throws GenerationException{
		
	
		String catalogPath = this.catalog != null ? catalog.getAbsolutePath() : "";
		XSLTGenerator generator = new XSLTGenerator( catalogPath, licencedSaxon);
		ScenariParser scenariParser = new ScenariParser(scenariFile.getAbsolutePath());
		
		try {
			
			scenariParser.parse();
			Set<GenerationScenario> scenari = scenariParser.getScenari();

			
			
			
			/*
			 * Les paramètre XSLT sont exprimés dans le fichier des scenari sous forme
			 * d'une expression XPath.
			 * 
			 * Le Context-Item utilisé pour l'évaluation de ce XPath est la racine du fichier des scenari.
			 * (Utile notamment pour la resolution d'URI relatives)
			 * 
			 */
			 generator.getSaxonCompiler().setParamsContextItem(scenariParser.getScenariFileNode());


	
			
			
			for (GenerationScenario s : scenari) {
				if( this.dirForIntermediates != null && this.dirForIntermediates.isDirectory() ){
					String intermediateFilePath = new File(this.dirForIntermediates, intermediateFileName()).getAbsolutePath();
					generator.compile(s.getParams(), s.getSourceXslPath(), s.getTargetXslPath(), intermediateFilePath);
				} else {
					generator.compile(s.getParams(), s.getSourceXslPath(), s.getTargetXslPath());
				}
			}
			
		} catch(SaxonApiException | URISyntaxException e){
			// TODO SAXON ??
	
			throw new GenerationException("Oupsy !", e);
		}
		
	}
	
	private String intermediateFileName(){
		return "intermediate-" + System.currentTimeMillis()
		+ '-' + Math.round(Math.random() * 10000) + ".xsl";
	}
	
	
	
	

}
