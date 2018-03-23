package com.jimetevenard.xslt.implSaxon;

import java.io.IOException;

import org.apache.logging.log4j.Logger;

import com.jimetevenard.xslt.api.XSLGenerator;
import com.jimetevenard.xslt.utils.ConfigMap;
import com.jimetevenard.xslt.utils.IntermediateXdm;
import com.jimetevenard.xslt.utils.ParamsMap;

import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.XdmDestination;

public class SaxonXSLTGenerator implements XSLGenerator {
	
	
	
	private  Logger log;
	private ConfigMap config = new ConfigMap();
	private GoSaxon saxonCompiler;
	
	
	public SaxonXSLTGenerator(Logger log, String catalogPath){
		this(log, catalogPath, false); // Use Saxon HE by default
	}

	public SaxonXSLTGenerator(Logger log, String catalogPath, boolean useLicensedSaxonEdition) {
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
		
		config.put(ConfigMap.SOURCE_PATH, sourceXSLTPath);
		log.info("Generating Intermediate XSL");
		try {
			saxonCompiler.generateIntermediate(config, intermediateXdm);
		} catch (SaxonApiException | IOException e) {
			throw new GenerationException("An error occured compiling to intermediate XSL", e);
		}

		// Hop, on génére la xsl finale
		config.put(ConfigMap.SOURCE_PATH, null);
		config.put(ConfigMap.OUTPUT_PATH, generatedXSLTPath);

		log.info("Executing Intermediate XSL ");
		try {
			saxonCompiler.executeIntermediate(config, params, intermediateXdm);
		} catch (SaxonApiException | IOException e) {
			throw new GenerationException("An error occured while processing intermediate XSL", e);

		}
		

	}
	
	@Override
	public void compile(ParamsMap params, String sourceXSLTPath, String generatedXSLTPath,
			String intermediateXSLTPath) throws GenerationException {
		
		// Version avec intermediate serialisé dans un fichier
		
		

		



		// Generate intermediate
		
		config.put(ConfigMap.SOURCE_PATH, sourceXSLTPath);
		config.put(ConfigMap.OUTPUT_PATH, intermediateXSLTPath);

		log.info("Generating Intermediate XSL");
		try {
			saxonCompiler.generateIntermediate(config);
		} catch (SaxonApiException | IOException e) {
			throw new GenerationException("An error occured compiling to intermediate XSL", e);
		}

		// Hop, on génére la xsl finale
		config.put(ConfigMap.XSL_PATH, intermediateXSLTPath);
		config.put(ConfigMap.SOURCE_PATH, null);
		config.put(ConfigMap.OUTPUT_PATH, generatedXSLTPath);

		log.info("Executing Intermediate XSL ");
		try {
			saxonCompiler.executeIntermediate(config, params);
		} catch (SaxonApiException | IOException e) {
			throw new GenerationException("An error occured while processing intermediate XSL", e);

		}

	}



	public class GenerationException extends Exception {

		public GenerationException(String message, Throwable cause) {
			super(message, cause);
			// TODO Auto-generated constructor stub
		}

		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;

	}

}
