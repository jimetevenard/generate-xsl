package com.jimetevenard.xslt.launcher;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Arguments {
	
	List<String> arguments;
	Map<String, String> options;
	
	public Arguments(String[] args){
		
		arguments = new ArrayList<>();
		options = new HashMap<>();
		//String nextOption 
		
		for (String arg : args) {
			if(arg.startsWith("--")){
				
			} else {
				
			}
		}
		
	}

}
