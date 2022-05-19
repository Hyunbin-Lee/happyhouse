package com.ssafy.happyhouse;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.ssafy.happyhouse.model.dao")
public class HappyhouseSpringApplication {

	public static void main(String[] args) {
		SpringApplication.run(HappyhouseSpringApplication.class, args);
	}

}
