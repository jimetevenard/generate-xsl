package com.jimetevenard.utils;

/**
 * 
 * Interface for representing a Logger.
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
