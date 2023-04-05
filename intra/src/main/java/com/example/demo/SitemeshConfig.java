package com.example.demo;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class SitemeshConfig extends ConfigurableSiteMeshFilter{
	
	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder)
	{
		// 설정 관련 내용 => default.jsp , exclude
		builder.addDecoratorPath("/*", "/views/common/default.jsp"); //(적용시키고자하는 문서,참조할문서)
		//builder.addDecoratorPath("/login/*", "/views/common/default2.jsp"); //문서를 다르게 적용시키고자할때 
		//builder.addExcludedPath("/login/my*");  //sitemesh적용 제외할 문서 , my로시작하는 모든 문서
	    builder.addExcludedPath("/member/sendmemo*");
	}

}
