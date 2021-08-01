package com.fpoly.controller.admin;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.fpoly.utils.FileUload;
@Component
public class ImageUpload {
	public String imageUpload(MultipartFile multipart) {
		String fileName = StringUtils.cleanPath(multipart.getOriginalFilename());
		String uploadDir = "upload/";
		try {
			FileUload.saveFile(uploadDir, fileName, multipart);
			return fileName;
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
		
		
		
	}
}
