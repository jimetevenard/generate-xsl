package com.jimetevenard.xslt.utils;

import java.io.File;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;

import javax.xml.namespace.QName;





public class GenerateXslUtils {
	
	public static final QName INTERMIDIATE_INITAL_TEMPLATE = new QName("init");
	
	private static final String GENERATE_REL_PATH = "generateXSL/xsl/generate.xsl";
	
	public static  InputStream generateXslAsStream(){
		return GenerateXslUtils.class.getClassLoader().getResourceAsStream(GENERATE_REL_PATH);
	}
	public static File generateXslAsFile() throws URISyntaxException{
		return new File(GenerateXslUtils.class.getClassLoader().getResource(GENERATE_REL_PATH).toURI());
	}
	
	public static String generateXslPath() {
		return GenerateXslUtils.class.getClassLoader().getResource(GENERATE_REL_PATH).toString();
	}
	
	
	
	

}
