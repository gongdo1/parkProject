package com.park.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptStr {
	public String encryptionStr(String ac_pw) {
		String encStr = null;
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(ac_pw.getBytes());
			byte[] resultData = md.digest();
			
			StringBuffer sb = new StringBuffer();
			for(byte b : resultData) {
				String t = Integer.toString((b & 0xff)+0x100, 16).substring(1);
				sb.append(t);
			}
			encStr = sb.toString();
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return encStr;
		
	}
}
