package com.i9he.m2b.util;
import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

/**
 * @author Administrator
 * 
 */
public class SyAESUtil {

	private String phone = "13392870595";

	private static String sKey = "FBW0FNOAoZtRcQr5";

	public String getPhone() {
		return phone;
	}
	
	private static final String AESTYPE = "AES/ECB/PKCS5Padding";

	public static String decrypt(String sKey, String encryptData) {

		byte[] decrypt = null;
		try {
			Key key = generateKey(sKey);
			Cipher cipher = Cipher.getInstance(AESTYPE);
			cipher.init(Cipher.DECRYPT_MODE, key);
			decrypt = cipher.doFinal(Base64.decodeBase64(encryptData.getBytes("utf-8")));
			return new String(decrypt, "utf-8").trim();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private static Key generateKey(String key) throws Exception {
		try {
			SecretKeySpec keySpec = new SecretKeySpec(key.getBytes(), "AES");
			return keySpec;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public static String encrypt(String sKey, String plainText) {
		byte[] encrypt = null;
		try {
			Key key = generateKey(sKey);
			Cipher cipher = Cipher.getInstance(AESTYPE);
			cipher.init(Cipher.ENCRYPT_MODE, key);
			encrypt = cipher.doFinal(plainText.getBytes("utf-8"));
			return new String(Base64.encodeBase64(encrypt), "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String convertUnicode(String ori) {
		char aChar;
		int len = ori.length();
		StringBuffer outBuffer = new StringBuffer(len);
		for (int x = 0; x < len; ) {
			aChar = ori.charAt(x++);
			if (aChar == '\\') {
				aChar = ori.charAt(x++);
				if (aChar == 'u') {
					// Read the xxxx
					int value = 0;
					for (int i = 0; i < 4; i++) {
						aChar = ori.charAt(x++);
						switch (aChar) {
							case '0':
							case '1':
							case '2':
							case '3':
							case '4':
							case '5':
							case '6':
							case '7':
							case '8':
							case '9':
								value = (value << 4) + aChar - '0';
								break;
							case 'a':
							case 'b':
							case 'c':
							case 'd':
							case 'e':
							case 'f':
								value = (value << 4) + 10 + aChar - 'a';
								break;
							case 'A':
							case 'B':
							case 'C':
							case 'D':
							case 'E':
							case 'F':
								value = (value << 4) + 10 + aChar - 'A';
								break;
							default:
								throw new IllegalArgumentException(
										"Malformed   \\uxxxx   encoding.");
						}
					}
					outBuffer.append((char) value);
				} else {
					if (aChar == 't')
						aChar = '\t';
					else if (aChar == 'r')
						aChar = '\r';
					else if (aChar == 'n')
						aChar = '\n';
					else if (aChar == 'f')
						aChar = '\f';
					outBuffer.append(aChar);
				}
			} else
				outBuffer.append(aChar);
		}
		return outBuffer.toString();
	}

	public static void main(String[] args) {
		

		
		String params = "zaGyhC+PzfXJ+F8JY+EoNLuKrJMwgao4gjzXjnGS4WXOnvMk1erRvGlCYFciZGy8w26XnDYhVWL43Nj9omoeWwF1cb7i7wokDP+DtcvYMLKO7U3y3PGk+t9yujrC3b8m0IhynoRCDbmx6+yIsxCofA==";
		String sign = decrypt(sKey,params) ;
		System.out.println("5559 40000 2017-01-02 5335 4028778159af48f10159b059e0790033");
		System.out.printf("sign:"+sign);

		
	}

}
