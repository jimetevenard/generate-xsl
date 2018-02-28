package com.jimetevenard.xslt.utils;

import java.net.URL;

import javax.xml.namespace.QName;





public class GenerateXslUtils {
	
	public static final QName INTERMIDIATE_INITAL_TEMPLATE = new QName("init");
	
	public static  String generateXslPath;
	
	static {
		URL xslUrl = GenerateXslUtils.class.getClassLoader().getResource("generateXSL/xsl/generate.xsl");
		generateXslPath = xslUrl.getPath();
	}
	
	

}
