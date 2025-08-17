package com.example.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;

@Configuration
@EnableWebMvc
public class WebMvcConfig implements WebMvcConfigurer {

        @Bean
        public InternalResourceViewResolver viewResolver() {
                InternalResourceViewResolver resolver = new InternalResourceViewResolver();
                resolver.setViewClass(JstlView.class);
                resolver.setPrefix("/WEB-INF/view/");
                resolver.setSuffix(".jsp");
                return resolver;
        }

        @Override
        public void configureViewResolvers(ViewResolverRegistry registry) {
                registry.viewResolver(viewResolver());
        }

        @Override
        public void addResourceHandlers(ResourceHandlerRegistry registry) {
                // CSS resources
                registry.addResourceHandler("/css/**")
                                .addResourceLocations("classpath:/css/", "/resources/css/");

                // JavaScript resources
                registry.addResourceHandler("/js/**")
                                .addResourceLocations("/resources/js/");

                // Assets (images, demos)
                registry.addResourceHandler("/assets/**")
                                .addResourceLocations("/resources/assets/");

                // Static resources (general)
                registry.addResourceHandler("/resources/**")
                                .addResourceLocations("/resources/");

                registry.addResourceHandler("/images/**")
                                .addResourceLocations("/resources/images/");

                registry.addResourceHandler("/client/**")
                                .addResourceLocations("/resources/client/", "classpath:/static/");

                // registry.addResourceHandler("/**")
                // .addResourceLocations("classpath:/static/", "/resources/static/");
        }

        // @Bean
        // public Validator validator() {
        // return new LocalValidatorFactoryBean();
        // }

        // @Override
        // public Validator getValidator() {
        // return validator();
        // }

}
