package com.ssafy.happyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ConfirmationController {
	
	
	@GetMapping("/confirmation")
	public String confirmationView() {
		return "confirmation";
	}
	
}
