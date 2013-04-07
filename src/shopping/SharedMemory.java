package shopping;

import java.util.ArrayList;
import java.util.HashMap;

public class SharedMemory {
	public static boolean show_result = false;
	
	public static final HashMap<String, String> categoryID = new HashMap<String, String>() {
		private static final long serialVersionUID = 3131766601636547206L;
	{
		put("Restaurants", "1");
		put("Entertainment", "2");
		put("Beauty & Spa", "3");
		put("Services", "4");
		put("Shopping", "6");
		put("Travel", "7");
	}};
	
	public static ArrayList<SaleStore> stores = new ArrayList<SaleStore>();
}
