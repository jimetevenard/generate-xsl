package com.jimetevenard.xslt.launcher;

public class Launcher {

	public static void main(String[] args) {

		
		if(args.length == 0){
			help();
		} else {
			// TODO DOOOOOOOOO !
		}

	}
	
	public static void help(){
		StringBuilder l = new StringBuilder();
		
		l.append("Usage\n-----\n");
		l.append("\t[options] --scenario <scenari-file.xml>\n");
		
		l.append("\nOptions\n-------\n");
		l.append("\t--license   | -l : Use licenced Saxon\n");		
		l.append("\t--debug-dir | -d <directory> : dir to save intermediate XSLs (for debug purpose)\n");
		
		System.out.print(l.toString());;
	}

}
