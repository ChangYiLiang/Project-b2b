package com.i9he.m2b.manage.utils;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.i9he.common.exception.I9heException;

public class SimpleLoggerInterceptor implements MethodInterceptor {

	private static final String ERROR_CODE = "5000";
	
	private static final Logger logger = Logger.getLogger(SimpleLoggerInterceptor.class);

	@Override
	public Object invoke(MethodInvocation invocation) throws Throwable {
		
		final Logger targetLogger = Logger.getLogger(invocation.getThis().getClass());
		final SimpleLogger loggerInfo = invocation.getMethod().getAnnotation(SimpleLogger.class);
		String errorCode = null;
		String errorMessage = null;
		if (loggerInfo != null && loggerInfo.value() != null) {
			String[] values = loggerInfo.value();
			if (values.length > 1) {
				errorCode = values[0];
				errorMessage = String.format("[%s] 出错", values[1]);
			} else if (values.length == 1) {
				errorCode = ERROR_CODE;
				errorMessage = String.format("[%s] 出错", values[0]);
			}
		}
		try {
			return invocation.proceed();
		} catch (I9heException e) {
			targetLogger.error(StringUtils.defaultString(errorMessage, e.getMessage()), e);
			throw e;
		} catch (Exception e) {
			targetLogger.error(StringUtils.defaultString(errorMessage, e.getMessage()), e);
			throw new I9heException(errorCode, StringUtils.defaultString(errorMessage, e.getMessage()), e);
		}
	}

}
