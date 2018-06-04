package com.jimetevenard.xslt.implSaxon;

import java.io.IOException;


import com.jimetevenard.xslt.GenerationException;
import com.jimetevenard.xslt.utils.ConfigMap;
import com.jimetevenard.xslt.utils.IntermediateXdm;
import com.jimetevenard.xslt.utils.ParamsMap;

import net.sf.saxon.s9api.SaxonApiException;

public class XSLTGenerator {
	
	
	

	private GoSaxon saxonCompiler;
	
	



	public XSLTGenerator(String catalogPath){
		this( catalogPath, false); // Use Saxon HE by default
	}

	public XSLTGenerator(String catalogPath, boolean useLicensedSaxonEdition) {
		super();


		
		saxonCompiler = new GoSaxon(catalogPath, useLicensedSaxonEdition);
		
		
	}

	public void compile(ParamsMap params, String sourceXSLTPath, String generatedXSLTPath) throws GenerationException {
		
		IntermediateXdm intermediateXdm = new IntermediateXdm();
		
		// Version avec intermediate en mémoire


		// Generate intermediate
		ConfigMap configSetp1 = new ConfigMap();
		configSetp1.put(ConfigMap.SOURCE_PATH, sourceXSLTPath);
		try {
			saxonCompiler.generateIntermediate(configSetp1, intermediateXdm);
		} catch (SaxonApiException | IOException e) {
			throw new GenerationException("An error occured compiling to intermediate XSL", e);
		}

		// Hop, on génére la xsl finale
		ConfigMap configStep2 = new ConfigMap();
		configStep2.put(ConfigMap.SOURCE_PATH, null);
		configStep2.put(ConfigMap.OUTPUT_PATH, generatedXSLTPath);

		try {
			saxonCompiler.executeIntermediate(configStep2, params, intermediateXdm);
		} catch (SaxonApiException | IOException e) {
			throw new GenerationException("An error occured while processing intermediate XSL", e);

		}
		

	}
	
	public void compile(ParamsMap params, String sourceXSLTPath, String generatedXSLTPath,
			String intermediateXSLTPath) throws GenerationException {
		
		// Version avec intermediate serialisé dans un fichier
		
		// TODO à supprimer

		



		// Generate intermediate
		ConfigMap configSetp1 = new ConfigMap();
		configSetp1.put(ConfigMap.SOURCE_PATH, sourceXSLTPath);
		configSetp1.put(ConfigMap.OUTPUT_PATH, intermediateXSLTPath);

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
