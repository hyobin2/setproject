package egovframework.com.cmm;

import egovframework.rte.fdl.cmmn.exception.handler.ExceptionHandler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ComOthersExcepHndlr implements ExceptionHandler {

	private static final Logger LOGGER = LoggerFactory.getLogger(ComOthersExcepHndlr.class);

    public void occur(Exception exception, String packageName) {
    	//log.debug(" ServiceExceptionHandler run...............");
    	LOGGER.error(packageName, exception);
    }
}
