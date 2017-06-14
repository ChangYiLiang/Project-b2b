package com.i9he.m2b.manage.utils;

import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;
import org.springframework.context.annotation.AnnotationBeanNameGenerator;

public class FullBeanNameGenerator extends AnnotationBeanNameGenerator {

	@Override
	public String generateBeanName(BeanDefinition definition, BeanDefinitionRegistry registry) {
		System.out.println("generate bean: " + definition.getBeanClassName().replace('.', '_'));
		return definition.getBeanClassName().replace('.', '_');
	}
	
}
