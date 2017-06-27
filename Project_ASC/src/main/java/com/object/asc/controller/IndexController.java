package com.object.asc.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * 
 * 인덱스 컨트롤러 
 * @RequestMapping("/") URI 매칭
 * 
 * @패키지 : com.object.asc.controller
 * @파일명 : IndexController.java
 * @작성자 : 
 * @작성일 : 2017. 6. 01. 
 * 
 */
@Controller
public class IndexController {
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	/**
	 * 
	 * 인덱스 페이지 단순 포워드
	 * 
	 * @Method Name : index
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		return "index";
	}
	
}
