package com.jimetevenard.xslt.api;

import com.jimetevenard.utils.AnyLogger;
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
	
	
	public static XSLGenerator newInstance(AnyLogger log, String catalogPath){
		// TODO choix d'une autre implementation (System.property, service provider...)
		
	boolean useLicensedSaxonEdition = Boolean.parseBoolean(System.getProperty(SaxonXSLTGenerator.LICENCED_PROP));
	return new SaxonXSLTGenerator(log, catalogPath, useLicensedSaxonEdition);
		
	}
	
	/**
	 * Compiles an annoted XSL
	 * 
	 * @param params : the parameters to apply
	 * @param sourceXSLTPath : the XSLT file to compile
	 * @param generatedXSLTPath : the path where we'll put the generated XSLT
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
