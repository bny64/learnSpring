package com.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SpringTestController {
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public ModelAndView TestController(ModelAndView mnv){
		System.out.println("index");				
		mnv.addObject("message", "hello~ Spring World");
		mnv.setViewName("index");
		return mnv;
	}
}