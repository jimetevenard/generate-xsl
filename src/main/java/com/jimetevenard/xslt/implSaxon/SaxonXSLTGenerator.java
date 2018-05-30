package com.jimetevenard.xslt.implSaxon;

import java.io.IOException;

import org.apache.logging.log4j.Logger;

import com.jimetevenard.utils.AnyLogger;
import com.jimetevenard.xslt.GenerationException;
import com.jimetevenard.xslt.XSLGenerator;
import com.jimetevenard.xslt.utils.ConfigMap;
import com.jimetevenard.xslt.utils.IntermediateXdm;
import com.jimetevenard.xslt.utils.ParamsMap;

import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.XdmDestination;

public class SaxonXSLTGenerator extends XSLGenerator {
	
	
	
	private  AnyLogger log;
	private GoSaxon saxonCompiler;
	
	



	public SaxonXSLTGenerator(AnyLogger log, String catalogPath){
		this(log, catalogPath, false); // Use Saxon HE by default
	}

	public SaxonXSLTGenerator(AnyLogger log, String catalogPath, boolean useLicensedSaxonEdition) {
		super();
		this.log = log;
		log.debug("We create the generator with catalog" + catalogPath);
		
		saxonCompiler = new GoSaxon(catalogPath, useLicensedSaxonEdition);
		
		
	}

	@Override
	public void compile(ParamsMap params, String sourceXSLTPath, String generatedXSLTPath) throws GenerationException {
		
		IntermediateXdm intermediateXdm = new IntermediateXdm();
		
		// Version avec intermediate en mémoire


		// Generate intermediate
		ConfigMap configSetp1 = new ConfigMap();
		configSetp1.put(ConfigMap.SOURCE_PATH, sourceXSLTPath);
		log.info("Generating Intermediate XSL for " + sourceXSLTPath);
		try {
			saxonCompiler.generateIntermediate(configSetp1, intermediateXdm);
		} catch (SaxonApiException | IOException e) {
			throw new GenerationException("An error occured compiling to intermediate XSL", e);
		}

		// Hop, on génére la xsl finale
		ConfigMap configStep2 = new ConfigMap();
		configStep2.put(ConfigMap.SOURCE_PATH, null);
		configStep2.put(ConfigMap.OUTPUT_PATH, generatedXSLTPath);

		log.info("Executing Intermediate XSL for : " + generatedXSLTPath);
		try {
			saxonCompiler.executeIntermediate(configStep2, params, intermediateXdm);
		} catch (SaxonApiException | IOException e) {
			throw new GenerationException("An error occured while processing intermediate XSL", e);

		}
		

	}
	
	@Override
	public void compile(ParamsMap params, String sourceXSLTPath, String generatedXSLTPath,
			String intermediateXSLTPath) throws GenerationException {
		
		// Version avec intermediate serialisé dans un fichier
		
		// TODO à supprimer

		



		// Generate intermediate
		ConfigMap configSetp1 = new ConfigMap();
		configSetp1.put(ConfigMap.SOURCE_PATH, sourceXSLTPath);
		configSetp1.put(ConfigMap.OUTPUT_PATH, intermediateXSLTPath);

		log.info("Generating Intermediate XSL");
		try {
			saxonCompiler.generateIntermediate(configSetp1);
		} catch (SaxonApiException | IOException e) {
			throw new GenerationException("An error occured compiling to intermediate XSL", e);
		}

		// Hop, on génére la xsl finale
		ConfigMap configStep2 = new ConfigMap();
		configStep2.put(ConfigMap.XSL_PATH, intermediateXSLTPath);
		configStep2.put(ConfigMap.SOURCE_PATH, null);
		configStep2.put(ConfigMap.OUTPUT_PATH, generatedXSLTPath);

		log.info("Executing Intermediate XSL ");
		try {
			saxonCompiler.executeIntermediate(configStep2, params);
		} catch (SaxonApiException | IOException e) {
			throw new GenerationException("An error occured while processing intermediate XSL", e);

		}

	}



	public GoSaxon getSaxonCompiler() {
		return saxonCompiler;
	}

}
