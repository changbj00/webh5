import org.apache.commons.codec.binary.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class Test1 {
	static String key = "A91DBAB64154FE7A640E89E0089F0A1E";

	public static void main(String[] args) {

		String input = "1";
		String value = encrypt(input);
		System.out.println(value);
	}

	public static String encrypt(String input) {
		byte[] output = null;
		try {
			SecretKeySpec skey = new SecretKeySpec(key.getBytes(), "AES");
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");// 算法/模式/补码方式
			cipher.init(Cipher.ENCRYPT_MODE, skey);
			output = cipher.doFinal(input.getBytes());
		} catch (Exception var5) {
			var5.printStackTrace();
		}
		return Base64.encodeBase64String(output);
	}
}