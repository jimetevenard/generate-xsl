package com.jimetevenard.xslt;

import com.jimetevenard.utils.AnyLogger;
import com.jimetevenard.xslt.implSaxon.SaxonProcessorHolder;
import com.jimetevenard.xslt.implSaxon.SaxonXSLTGenerator;
import com.jimetevenard.xslt.implSaxon.SaxonXSLTGenerator.GenerationException;
import com.jimetevenard.xslt.utils.ParamsMap;


/**
 * Generate the compled XSLT for a given source XSLT
 * 
 * @author ext-jetevenard
 *
 */
public abstract class XSLGenerator {
	
	/**
	 * Crée une Instance de type XSLGenerator.
	 * Par défaut, l'instance est un com.jimetevenard.xslt.implSaxon.SaxonXSLTGenerator
	 * 
	 * 
	 * @see com.jimetevenard.xslt.implSaxon.SaxonXSLTGenerator
	 * 
	 * @param log : Le logger à utiliser
	 * @param catalogPath : Chemin du Ctatalogue XML à utiliser
	 * @return
	 */
	public static XSLGenerator newInstance(AnyLogger log, String catalogPath){
		// TODO choix d'une autre implementation (System.property, service provider...)
		
		boolean useLicensedSaxonEdition = Boolean.parseBoolean(System.getProperty(SaxonProcessorHolder.LICENCED_PROP));
		return new SaxonXSLTGenerator(log, catalogPath, useLicensedSaxonEdition);
		
	}
	
	/**
	 * Compiles an annoted XSL
	 * 
	 * @param params : the parameters to apply
	 * @param sourceXSLTPath : the XSLT file to compile
	 * @param generatedXSLTPath : the path where we'll put the generated XSLT
	 * @throws GenerationException 

	 */
	public abstract void compile(ParamsMap params, String sourceXSLTPath, String generatedXSLTPath) throws GenerationException;
	
	
	/**
	 * Compiles an annoted XSL
	 * 
	 * @param params : the parameters to apply
	 * @param sourceXSLTPath : the XSLT file to compile
	 * @param generatedXSLTPath : the path where we'll put the generated XSLT
	 * @param intermediateXSLTPath : for log purpose, we can provide a path to write the intermediate XSLT
	 * @throws GenerationException 
	 */
	public abstract void compile(ParamsMap params, String sourceXSLTPath, String generatedXSLTPath, String intermediateXSLTPath) throws GenerationException;

}
