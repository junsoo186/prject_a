package com.adpoker.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	
	@GetMapping({"/main--this"})
	public String mainPage() {
		System.out.println("main 작동중 삐비빅~!");
		return "/main";
	}
	
}
