package com.fpoly.utils;

import java.util.Random;

import org.springframework.stereotype.Component;
@Component
public class RandomStringUtils {
public String  randomString (int maxlenght) {
	int leftLimit = 97; // letter 'a'
    int rightLimit = 122; // letter 'z'
    Random random = new Random();
    StringBuilder buffer = new StringBuilder(maxlenght);
    for (int i = 0; i < maxlenght; i++) {
        int randomLimitedInt = leftLimit + (int) 
          (random.nextFloat() * (rightLimit - leftLimit + 1));
        buffer.append((char) randomLimitedInt);
    }
    String generatedString = buffer.toString();

	return generatedString;
}
}
