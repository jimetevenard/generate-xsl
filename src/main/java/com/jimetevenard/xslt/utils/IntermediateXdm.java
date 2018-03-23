package com.jimetevenard.xslt.utils;



import javax.xml.transform.Source;

import net.sf.saxon.s9api.Destination;
import net.sf.saxon.s9api.XdmDestination;

public class IntermediateXdm {
	
	private XdmDestination intermediateXmdDest;
	
	public IntermediateXdm(){
		intermediateXmdDest = new XdmDestination();
	}
	
	public Destination getDestination(){
		return intermediateXmdDest;
	}
	
	public Source getSource(){
		return intermediateXmdDest.getXdmNode().asSource();
	}
	
	
	
	

}
