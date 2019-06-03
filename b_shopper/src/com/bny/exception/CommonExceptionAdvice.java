package com.bny.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;

public class CommonExceptionAdvice {
	/**
	 * @ContorllerAdvice�� ���� ��ü�� ��Ʈ�ѿ��� �߻��ϴ� Exception�� ���������� ó���ϴ� Ŭ������� �������.
	 * */
	private static Logger logger = LoggerFactory.getLogger(CommonExceptionAdvice.class);
	
	@ExceptionHandler(Exception.class)
	public void commonException(Exception e) {
		logger.info("bny exception : {}", e);
	}
}
