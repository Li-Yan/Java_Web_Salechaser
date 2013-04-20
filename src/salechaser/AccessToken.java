package salechaser;

import java.util.HashMap;
import java.util.Random;

public class AccessToken {
	private static final String allChar = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"; 
	
	public static HashMap<String, String> chooseMap = new HashMap<String, String>();
	
	public static String TokenGenerate() {
		Random random = new Random(System. currentTimeMillis());
		String token = "";
		for (int i = 0; i < 64; i++) {
			int r = random.nextInt(allChar.length());
			token += allChar.charAt(r);
		}
		return token;
	}
	
	public static int PutCheck(String token, String check) {
		chooseMap.put(token, check);
		System.out.println(token + " " + check);
		return 1;
	}
	
	public static String GetCheck(String token) {
		return chooseMap.get(token);
	}
}
