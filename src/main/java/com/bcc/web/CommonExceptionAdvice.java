package com.bcc.web;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CommonExceptionAdvice {

	@ExceptionHandler(value = Exception.class)
	public String handleException(Exception e) {
		e.printStackTrace();
		return "error/commonException";
	}
}
