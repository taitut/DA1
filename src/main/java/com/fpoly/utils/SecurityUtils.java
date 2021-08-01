package com.fpoly.utils;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import com.fpoly.dto.MyUser;


public class SecurityUtils {
	
	public static MyUser getPrincipal() {
		MyUser myuser = (MyUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return myuser;
	}
	
	@SuppressWarnings("unchecked")
	public static List<String> getAuthorities(){
		List<String> results = new ArrayList<>();
		List<GrantedAuthority> authorities = (List<GrantedAuthority>)(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
        for (GrantedAuthority authority : authorities) {
            results.add(authority.getAuthority());
        }
		return results;
	}
}
