package com.eshop.tool;


import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

public class MD5 {

	/**
	 * @param args
	 * @category ����MD5���û��������
	 */
	MessageDigest m;
	BASE64Encoder b;
	String n;
	public String complie(String s){
		try {
			s = s.trim();
			m = MessageDigest.getInstance("MD5");
			b = new BASE64Encoder();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		try {
			n = b.encode(m.digest(s.getBytes("UTF-8")));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return n;
	}
	public static void main(String[] args) {
		//����Աadmin����admin
		String str = new MD5().complie("admin");
		System.out.println(str);
		//�ͻ�zhangxinghua���û�����714106749
		String str2 = new MD5().complie("714106749");
		System.out.println(str2);
	}

}
