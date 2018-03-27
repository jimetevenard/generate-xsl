package com.jimetevenard.utils;

import org.apache.logging.log4j.core.Logger;


public  class Log4JLogger implements AnyLogger {
	
	private Logger l;
	
	private Log4JLogger() {
		 
	}
	
	public static Log4JLogger of(Logger l){
		Log4JLogger ll = new Log4JLogger();
		ll.l = l;
		return ll;
	}

	@Override
	public void debug(String msg) {
		this.l.debug(msg);
		
	}

	@Override
	public void info(String msg) {
		this.l.info(msg);			
	}

	@Override
	public void warning(String msg) {
		this.l.warn(msg);			
	}

	@Override
	public void error(String msg) {
		this.l.error(msg);			
	}

	public Logger getL() {
		return l;
	}

	public void setL(Logger l) {
		this.l = l;
	}
	
}
