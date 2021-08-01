package com.fpoly.sitemesh;

import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.springframework.context.annotation.Configuration;
import javax.servlet.annotation.WebFilter;

@Configuration
@WebFilter(filterName="SitemeshFilter",urlPatterns="/*")
public class SitemeshFilter extends ConfigurableSiteMeshFilter {
}
