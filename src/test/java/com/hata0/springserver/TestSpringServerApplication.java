package com.hata0.springserver;

import org.springframework.boot.SpringApplication;

public class TestSpringServerApplication {

	public static void main(String[] args) {
		SpringApplication.from(SpringServerApplication::main).with(TestcontainersConfiguration.class).run(args);
	}

}
