package com.filter;

import java.security.MessageDigest;

public class ShaEncoding {
	// ==== [SHA256 인코딩 - 문자열] ====
	public static String getSHA256(String data) {
		String SHA = "";
		try {
			MessageDigest sh = MessageDigest.getInstance("SHA-256"); // MessageDigest 라이브러리를 통해 해시 알고리즘 사용
			sh.update(data.getBytes()); // SHA-256을 호출하고, 리턴을 String으로 변환하여 byte[]로 받음
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer();
			
			//출력
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1)); // byte 타입의 범위 : -128 ~ 127
			}
			SHA = sb.toString();

		} catch (Exception e) {
			e.printStackTrace();
			SHA = null;
		}
		return SHA;
	}
}




//SHA (Sechre Hash Standard) 

//SHA(Secure Hash Algorithm, 안전한 해시 알고리즘) 함수들은 서로 관련된 암호학적 해시 함수들의 모음이다. 
//여러 종류가 존재하며 그중 SHA-1은 SHA 함수들 중 가장 많이 쓰이며, TLS, SSL, PGP, SSH, IPSec 등 많은 보안 프로토콜과 프로그램에서 사용되고 있다. 
//SHA-1은 이전에 널리 사용되던 MD5를 대신해서 쓰이기도 한다. 혹자는 좀 더 중요한 기술에는 SHA-256이나 그 이상의 알고리즘을 사용할 것을 권장한다.