package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class IntraApplication {

	public static void main(String[] args) {
		SpringApplication.run(IntraApplication.class, args);
	}
	
	@Bean //메인함수실행시 bean도 실행됨
	public FilterRegistrationBean<SitemeshConfig> sitemeshbean()
	{
		FilterRegistrationBean<SitemeshConfig> bean=new FilterRegistrationBean<SitemeshConfig>(); // 객체생성
		bean.setFilter(new SitemeshConfig());
		return bean;
	}

}
