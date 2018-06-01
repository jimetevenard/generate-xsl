package com.jimetevenard.utils;

/**
 * 
 * Interface for representing a Logger.
 * 
 * (To wrap various logging system ; Log4j, MavenLogin, etc. )
 * 
 * 
 * @author jetevenard
 *
 */
public interface AnyLogger {
	
	public void debug(String msg);
	
	public void info(String msg);
	
	public void warn(String msg);
	
	public void error(String msg);

}
