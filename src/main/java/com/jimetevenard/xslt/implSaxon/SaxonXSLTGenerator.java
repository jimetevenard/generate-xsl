package com.jimetevenard.xslt.implSaxon;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.xml.namespace.QName;

import org.apache.logging.log4j.Logger;

import com.jimetevenard.xslt.api.XSLGenerator;
import com.jimetevenard.xslt.implSaxon.SaxonXSLTGenerator.GenerationException;
import com.jimetevenard.xslt.utils.ConfigMap;
import com.jimetevenard.xslt.utils.GenerateXslUtils;
import com.jimetevenard.xslt.utils.ParamsMap;


import net.sf.saxon.s9api.SaxonApiException;

public class SaxonXSLTGenerator implements XSLGenerator {
	
	private static final DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd-HH-mm-ss");
	
	
	private  Logger log;
	private ConfigMap config = new ConfigMap();
	private GoSaxon saxonCompiler;
	
	

	public SaxonXSLTGenerator(Logger log, String catalogPath) {
		super();
		this.log = log;
		log.debug("We create the generator with catalog" + catalogPath);
		
		saxonCompiler = new GoSaxon(catalogPath);
		
		
	}

	@Override
	public void compile(ParamsMap params, String sourceXSLTPath, String generatedXSLTPath) throws GenerationException {
		
		// TODO : Version avec intermediate en mémoire
		
		throw new RuntimeException("This method does nothing, and is proud of it.");

	}
	
	@Override
	public void compile(ParamsMap params, String sourceXSLTPath, String generatedXSLTPath,
			String intermediateXSLTPath) throws GenerationException {
		
		// Version avec intermediate écrit sous forme de fichier
		
		String now = dateFormatter.format(LocalDateTime.now());
		

		



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
