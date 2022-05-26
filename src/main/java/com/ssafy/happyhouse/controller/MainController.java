package com.ssafy.happyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	@GetMapping("/")
	public String test() {
		return "index";
	}
	@GetMapping("/newsView")
	public String news() {
		return "/news";
	}
	@GetMapping("/about")
	public String about() {
		return "/about";
	}
	@GetMapping("/contact")
	public String contact() {
		return "/contact";
	}
	@GetMapping("/vueqna")
	public void vueqna() {
		
	}
}
