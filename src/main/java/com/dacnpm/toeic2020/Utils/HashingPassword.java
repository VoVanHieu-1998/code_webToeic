package com.dacnpm.toeic2020.Utils;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

public class HashingPassword {
	static final String SALT = "toeic";

	public static String encrypt(String originPassword) {
		String result = null;
		byte[] salt = SALT.getBytes();
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			md.update(salt);
			byte[] hashPass = md.digest(originPassword.getBytes(StandardCharsets.US_ASCII));
			result = java.util.Base64.getEncoder().encodeToString(hashPass).substring(0, 32);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
public static void main(String[] args) {
	String pass = encrypt("1234");
	System.out.println(pass);
}
}
