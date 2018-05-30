package com.jimetevenard.xslt;

import java.io.File;
import java.net.URISyntaxException;
import java.util.Set;


import com.jimetevenard.utils.AnyLogger;
import com.jimetevenard.xslt.implSaxon.SaxonProcessorHolder;
import com.jimetevenard.xslt.implSaxon.ScenariParser;
import com.jimetevenard.xslt.implSaxon.XSLTGenerator;

import net.sf.saxon.s9api.SaxonApiException;

public class Driver {
	
	private File scenariFile;
	private File catalog;
	private File dirForIntermediates; // for debug
	private boolean licencedSaxon;
	private AnyLogger log;
	
	
	public Driver(AnyLogger log, File scenariFile, File catalog) {
		super();
		this.scenariFile = scenariFile;
		this.catalog = catalog;
		this.log = log;
	}

	public void setDirForIntermediates(File dirForIntermediates) {
		this.dirForIntermediates = dirForIntermediates;
	}

	public void setLicencedSaxon(boolean licencedSaxon) {
		this.licencedSaxon = licencedSaxon;
	}
	
	public void launch() throws GenerationException{
		
	
		
		XSLTGenerator generator = new XSLTGenerator(log, catalog.getAbsolutePath(), licencedSaxon);
		ScenariParser scenariParser = new ScenariParser(scenariFile.getAbsolutePath());
		
		try {
			
			scenariParser.parse();
			Set<GenerationScenario> scenari = scenariParser.getScenari();

			
			
			
			/*
			 * Les paramètre XSLT sont exprimés dans le fichier des scenari sous forme
			 * d'une expression XPath.
			 * 
			 * Le Context-Item utilisé pour l'évaluation de ce XPath est la racine du fichier des scenari.
			 * (Utile notemment pour la resolution d'URI relatives)
			 * 
			 * TODO : REFACTO
			 * - Ou on assume Saxon et on dégage les classes abstraites
			 * - Ou on introduit un mécanisme générique pour ça
			 * - Dans tous les cas, ce n'est pas ici qu'il faut faire ça
			 *   - Dans la mesure ou ces objets sont très liés, il faudrait les construire ensemble
			 *    (Sachant que que si on garde la "pseudo" généricité (il faut qu'ils fassent partie de la même implem)
			 */
			((XSLTGenerator) generator).getSaxonCompiler()
					.setParamsContextItem(((ScenariParser) scenariParser).getScenariFileNode());


	
			
			
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
