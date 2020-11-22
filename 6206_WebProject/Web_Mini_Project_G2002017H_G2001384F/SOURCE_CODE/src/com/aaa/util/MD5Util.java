package com.aaa.util;

import java.security.MessageDigest;

/***
 * 密码加密的工具类
 *
 */
public class MD5Util {
	public static String MD5(String s) {
	    try {
	        MessageDigest md = MessageDigest.getInstance("MD5");
	        //字节数组;
	        byte[] bytes = md.digest(s.getBytes("utf-8"));
	        return toHex(bytes);
	    }
	    catch (Exception e) {
	        throw new RuntimeException(e);
	    }
	}
	//16进制
	private static String toHex(byte[] bytes) {
		//常量 字符数组;16;0-F;mysql-?
	    final char[] HEX_DIGITS = "0123456789ABCDEF".toCharArray();
	    StringBuilder ret = new StringBuilder(bytes.length * 2);
	    for (int i=0; i<bytes.length; i++) {
	        ret.append(HEX_DIGITS[(bytes[i] >> 4) & 0x0f]);
	        ret.append(HEX_DIGITS[bytes[i] & 0x0f]);
	    }
	    return ret.toString();
	    //0x：0000 1111
	}
	//测试
//	public static void main(String[] args) {
//		System.out.println(Integer.toBinaryString('2'));
//		char ch='2'>>4;
//		System.out.println(Integer.toBinaryString(ch));
//	}
}
