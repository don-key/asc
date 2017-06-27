package com.object.asc.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 파일 업로드용 클래스
 * 
 * @패키지 : com.object.asc.util
 * @파일명 : UploadFileUtils.java
 * @작성자 : 이종윤
 * @작성일 : 2017. 6. 01.
 *
 */
public class UploadFileUtils {

	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);
	
	/**
	 * 
	 * 업로드한 파일을 생성한 폴더에 저장
	 * 
	 * @param uploadPath 	파일의 저장 경로
	 * @param originalName 	원본 파일의 이름
	 * @param fileData			파일 데이터
	 * @return
	 * @throws Exception 
	 */
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		
		UUID uuid = UUID.randomUUID();	// 랜덤 UUID 생성
		String savedName = uuid.toString() + "_" + originalName;
		String savedPath = calcPath(uploadPath);		// 저장될 경로 계산
		File target = new File(uploadPath+savedPath, savedName);
		FileCopyUtils.copy(fileData, target);	// 원본 파일 저장
		
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);	// 원본 파일의 확장자
		
		String uploadedFileName = null;
		
		if (MediaUtils.getMediaType(formatName) != null) {												// 확장자가 이미지(jpg, gif, png)면
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);		// 썸네일 생성
		} else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		
		return uploadedFileName;
	}
	
	/**
	 * 
	 * 파일이 저장 될 경로 계산
	 * 
	 * @param uploadPath		파일 저장 경로
	 * @return path           파일 path 리턴
	 */
	private static String calcPath(String uploadPath) {
		String path = File.separator + "asc";
		makeDir(uploadPath, path); 
		return path; 
		
	}
	
	/**
	 * 
	 * 파일 경로 생성
	 * 
	 * @param uploadPath	파일 저장 경로
	 * @param paths			생성할 파일 경로 (프로젝트 내역 번호, 사용자 번호)
	 */
	private static void makeDir(String uploadPath, String... paths) {
		if (new File(paths[paths.length-1]).exists()) {
			return;
		}
		
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			if (!dirPath.exists()) {
				dirPath.mkdirs();
			}
		}
	}
	
	/**
	 * 
	 * 썸네일 이미지 생성
	 * 
	 * @param uploadPath		메소드의 파라미터에 사용된 기본 경로
	 * @param path				프로젝트 내역 번호/사용자 번호 폴더
	 * @param fileName			현재 업로드 된 파일 이름
	 * @return
	 * @throws Exception 
	 */
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);		// 썸네일 이미지 파일의 높이를 100px로 동일하게 설정
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	/**
	 * 
	 * 아이콘 생성 (파일 확장자가 이미지가 아닐 경우)
	 * 
	 * @param uploadPath		메소드의 파라미터에 사용된 기본 경로
	 * @param path				프로젝트 내역 번호/사용자 번호 폴더
	 * @param fileName			현재 업로드 된 파일 이름
	 * @return
	 */
	private static String makeIcon (String uploadPath, String path, String fileName) {
		String iconName = uploadPath + path + File.separator + fileName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
}
