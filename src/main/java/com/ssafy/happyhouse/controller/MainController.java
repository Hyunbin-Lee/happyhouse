package com.ssafy.happyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	@GetMapping("/")
	public String test() {
		return "index";
	}
	@GetMapping("/about")
	public String about() {
		return "/about";
	}
	@GetMapping("/contact")
	public String contact() {
		return "/contact";
	}
	@GetMapping("/sitemap")
	public String sitemap() {
		return "/sitemap";
	}
	@GetMapping("/vueqna")
	public void vueqna() {
		
	}
}
