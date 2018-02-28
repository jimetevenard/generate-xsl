package com.jimetevenard.xslt.implSaxon;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.Map.Entry;

import javax.xml.transform.stream.StreamSource;

import org.xmlresolver.Resolver;

import com.jimetevenard.xslt.utils.ConfigMap;
import com.jimetevenard.xslt.utils.GenerateXslUtils;
import com.jimetevenard.xslt.utils.ParamsMap;

import net.sf.saxon.s9api.Destination;
import net.sf.saxon.s9api.DocumentBuilder;
import net.sf.saxon.s9api.Processor;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.Serializer;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.s9api.XdmNode;
import net.sf.saxon.s9api.XsltCompiler;
import net.sf.saxon.s9api.XsltExecutable;
import net.sf.saxon.s9api.XsltTransformer;

/**
 * Utility class to perfom as saxon XSLT
 * 
 * @author ext-jetevenard
 *
 */
public class GoSaxon {

	/*
	 * TODO
	 * ====
	 * 
	 * En l'état, cette classe ne sert pas à grand chose...
	 * Elle a vocation à
	 * simplifier, mais cette histoire de config map et tout, c'est vraiment
	 * plus simple ?
	 * 
	 * Passer en Singleton
	 * 
	 * 
	 * Créer une méthode pour chaque step :
	 * 
	 * La premiere pour générer
	 * l'intermediate avec l'XsltTransformer déjà instancié sur generate.xsl -
	 * 
	 * La deuxième pour faire tourner l'intermediate
	 * 
	 */
	
	
	private static final QName IT_SAXON_QNAME = new QName(GenerateXslUtils.INTERMIDIATE_INITAL_TEMPLATE);
	
	private  Processor proc; 
	private  XsltCompiler compiler;
	private  DocumentBuilder docBuilder;
	
	
	private  XsltExecutable generateXsltExecutable;
	private  XsltTransformer generalXsltTransfomrer;
	private  boolean ready = false;
	
	public GoSaxon(String catalogPath) {
		try {
			proc = new Processor(false); // false => licensed Saxon
			compiler = proc.newXsltCompiler();
			docBuilder = proc.newDocumentBuilder();
			
			
			generateXsltExecutable = compiler.compile(new StreamSource(new File(GenerateXslUtils.generateXslPath)));
			generalXsltTransfomrer = generateXsltExecutable.load();
			
			System.setProperty("xml.catalog.files", catalogPath);
			Resolver resolver = new Resolver();
			compiler.setURIResolver(resolver);
			
			ready = true;
		} catch (SaxonApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public  void generateIntermediate(ConfigMap config) throws SaxonApiException, IOException{
		
		checkState();
		

		XdmNode doc =  docBuilder.build(new File(config.get(ConfigMap.SOURCE_PATH)));
		generalXsltTransfomrer.setSource(doc.asSource());
		
		
		// prévoir aussi une XDMDestination (en dehors de la méthode)
		String fileOutput = config.get(ConfigMap.OUTPUT_PATH);
		if (fileOutput != null && !(fileOutput.isEmpty())) {
			generalXsltTransfomrer.setDestination(fileDestination(fileOutput));
		}

		// pas de params...
	

		generalXsltTransfomrer.transform();
		
		
	}
	
	public void executeIntermediate(ConfigMap config, ParamsMap params) throws SaxonApiException, IOException{
		
		checkState();
		
		
		XsltExecutable intermediateXsltExecutable = compiler.compile(new StreamSource(new File(config.get(ConfigMap.XSL_PATH))));
		XsltTransformer intermediateXsltTransfomrer = generateXsltExecutable.load();
		
		String fileOutput = config.get(ConfigMap.OUTPUT_PATH);
		if (fileOutput != null && !(fileOutput.isEmpty())) {
			generalXsltTransfomrer.setDestination(fileDestination(fileOutput));
		}

		if (params != null) {
			for (Entry<javax.xml.namespace.QName, String> e : params.entrySet()) {
				generalXsltTransfomrer.setParameter(new QName(e.getKey()), new XdmAtomicValue(e.getValue()));
			}
		}

		intermediateXsltTransfomrer.setInitialTemplate(IT_SAXON_QNAME);
		

		intermediateXsltTransfomrer.transform();

	}
	
	private void checkState(){
		if(!ready){
			throw new IllegalStateException("GoSaxon did not instanciate properly");
		}
	}
	
	
	

	private  Destination fileDestination(String path) throws IOException {
		File out = new File(path);
		if (!out.getParentFile().exists()) {
			out.getParentFile().mkdirs();
		}
		out.createNewFile();
		return proc.newSerializer(out);
	}

}
