package com.jimetevenard.xslt.implSaxon;

import net.sf.saxon.s9api.Processor;

public class SaxonProcessorHolder {
	
	private static SaxonProcessorHolder instance;
	private Processor processor;
	public static final String LICENCED_PROP = "com.jimetevenard.generate-xsl:licenced-saxon";
	private static boolean licensed = false;
	
	private static boolean ready;
	
	private SaxonProcessorHolder(){
		
	}

	public static SaxonProcessorHolder getInstance() {
		if(!ready){
			instance = new SaxonProcessorHolder();
			instance.processor = new Processor(licensed);
			
			ready = true;
		}
		return instance;
	}

	public Processor getProcessor() {
		return processor;
	}

	public static void setLicensed(boolean licensed) {
		// CALL ME BEFORE getInstance !
		SaxonProcessorHolder.licensed = licensed;
	}
	

}
