package com.fpoly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloDeploy {
	@GetMapping("/aq")
	public String Hello (Model model) {
		model.addAttribute("a","ditmemay");
		return "/hello";
	}
}
