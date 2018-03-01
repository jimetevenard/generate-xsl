package com.jimetevenard.xslt.api;

import com.jimetevenard.xslt.implSaxon.SaxonXSLTGenerator.GenerationException;
import com.jimetevenard.xslt.utils.ParamsMap;


/**
 * Generate the compled XSLT for a given source XSLT
 * 
 * @author ext-jetevenard
 *
 */
public interface XSLGenerator {
	
	/**
	 * Compiles an annoted XSL
	 * 
	 * @param params : the parameters to apply
	 * @param sourceXSLTPath : the XSLT file to compile
	 * @param generatedXSLTPath : the path where we'll put the generated XSLT
	 */
	public void compile(ParamsMap params, String sourceXSLTPath, String generatedXSLTPath) throws GenerationException;
	
	
	/**
	 * Compiles an annoted XSL
	 * 
	 * @param params : the parameters to apply
	 * @param sourceXSLTPath : the XSLT file to compile
	 * @param generatedXSLTPath : the path where we'll put the generated XSLT
	 * @param intermediateXSLTPath : for log purpose, we can provide a path to write the intermediate XSLT
	 * @throws GenerationException 
	 */
	public void compile(ParamsMap params, String sourceXSLTPath, String generatedXSLTPath, String intermediateXSLTPath) throws GenerationException;

}
