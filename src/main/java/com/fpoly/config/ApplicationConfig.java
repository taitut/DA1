package com.fpoly.config;

import java.nio.file.Path;
import java.nio.file.Paths;

import org.modelmapper.ModelMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ApplicationConfig implements WebMvcConfigurer {
	 @Bean
	   public ModelMapper modelMapper() {
	      ModelMapper modelMapper = new ModelMapper();
	      return modelMapper;
	   }
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		exposeDirectory("upload", registry);
	}
	public void  exposeDirectory(String dirName, ResourceHandlerRegistry registry) {
		Path uploadDir = Paths.get(dirName);
		String uploadPath = uploadDir.toFile().getAbsolutePath();
		if (dirName.startsWith("../")) {
			dirName  = dirName.replace("../", "");
		}
		registry.addResourceHandler("/"+dirName+"/**").addResourceLocations("file:/"+uploadPath+"/");
	}
	 
}
