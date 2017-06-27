package com.object.asc.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

/**
 * 
 * 파일 확장자를 통해 이미지 타입인지 판별
 * 
 * @패키지 : com.object.asc.util
 * @파일명 : MediaUtils.java
 * @작성자 : 이종윤
 * @작성일 : 2017. 6. 01. 
 *
 */
public class MediaUtils {

	private static Map<String, MediaType> mediaMap;
	
	static {
		mediaMap = new HashMap<String, MediaType>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	
	public static MediaType getMediaType(String type) {
		return mediaMap.get(type.toUpperCase());
	}
}
