package com.gstarcad.website.util;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;

import org.apache.commons.codec.binary.Hex;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class DESUtil {
	static byte[] desKeyData = "haochen#123456".getBytes();

	public static String encode(String input) {
		try {

			DESKeySpec desKeySpec = new DESKeySpec(desKeyData);
			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
			SecretKey sKey = keyFactory.generateSecret(desKeySpec);
			Cipher c = Cipher.getInstance("DES");
			c.init(Cipher.ENCRYPT_MODE, sKey);
			byte b[] = c.doFinal(input.getBytes());
			return dumpBytes(b);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	

	public static String decode(String input) {
		try {
			DESKeySpec desKeySpec = new DESKeySpec(desKeyData);
			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
			SecretKey sKey = keyFactory.generateSecret(desKeySpec);
			Cipher c = Cipher.getInstance("DES");
			c.init(Cipher.DECRYPT_MODE, sKey);
			byte[] hexBytes = toBytes(input);
			if(hexBytes == null){//非des加密字符串
				return null;
			}
			byte bytes[] = c.doFinal(hexBytes);
			return new String(bytes);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String dumpBytes(byte[] bs) {
		return new String(Hex.encodeHex(bs));
	}

	public static byte[] toBytes(String str) {
		try {
			return Hex.decodeHex(str.toCharArray());
		} catch (Exception e) {
			//e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		
		System.out.println(encode("123456"));
		System.out.println(decode("6aa09591592ef99e"));
	}
	
}
