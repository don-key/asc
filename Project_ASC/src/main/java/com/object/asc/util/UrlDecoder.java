package com.object.asc.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

/**
 * 
 * JSTL URLDecoder 클래스
 * 
 * @패키지 : com.object.asc.util
 * @파일명 : UrlDecoder.java
 * @작성자 : 이현명
 * @작성일 : 2017. 6. 27. 
 *
 */
public class UrlDecoder {

	 public static String urlDecode(String input) throws UnsupportedEncodingException 
	   { 
	      return URLDecoder.decode(input, "UTF-8"); 
	   } 	
}
