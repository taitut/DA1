package com.fpoly.utils;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.web.multipart.MultipartFile;

public class FileUload {
	
	public static void saveFile(String uploadDir, String fileName, MultipartFile multipart) throws IOException {
		Path path =  Paths.get(uploadDir);
		if (!Files.exists(path)) {
			Files.createDirectory(path);
		}
		try (InputStream inputstream = multipart.getInputStream()) {
			Path filepath = path.resolve(fileName);
			Files.copy(inputstream, filepath, StandardCopyOption.REPLACE_EXISTING);
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
}
