package com.fpoly.config;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class testpass {

	public static String encrytePassword(String password) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.encode(password);
    }
 

	

}
