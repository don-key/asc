package com.object.asc.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

public class UrlDecoder {

	 public static String urlDecode(String input) throws UnsupportedEncodingException 
	   { 
	      return URLDecoder.decode(input, "UTF-8"); 
	   } 	
}
