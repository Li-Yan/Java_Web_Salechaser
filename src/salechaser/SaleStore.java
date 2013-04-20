package salechaser;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.JSONObject;

public class SaleStore {
	public String ID;
	public String name;
	public String address;
	public String phone;
	public String showImage;
	public String postDate;
	public String expirationDate;
	public String dealTitle;
	public String dealinfo;
	public String URL;
	public double latitude;
	public double longitude;
	
	public SaleStore(JSONObject object) {
		String s = "";
		if ((s = object.getString("ID")) != null) this.ID = s;
		if ((s = object.getString("name")) != null) this.name = s;
		if ((s = object.getString("address")) != null) this.address = s;
		if ((s = object.getString("address2")) != null) {
			if (!s.equals("")) this.address = this.address + ", " + s;
		}
		if ((s = object.getString("city")) != null) this.address = this.address + ", " + s;
		if ((s = object.getString("state")) != null) this.address = this.address + ", " + s;
		if ((s = object.getString("ZIP")) != null) this.address = this.address + ", " + s;
		if ((s = object.getString("phone")) != null) {
			if (!s.equals("")) {
				String phoneStrings[] = s.split("\\.");
				this.phone = "+1 (" + phoneStrings[0] + ") " + phoneStrings[1] + "-" + phoneStrings[2];
			}
		}
		if ((s = object.getString("showImage")) != null) this.showImage = s;
		if ((s = object.getString("postDate")) != null) this.postDate = s;
		if ((s = object.getString("expirationDate")) != null) this.expirationDate = s;
		if ((s = object.getString("dealTitle")) != null) this.dealTitle = s.replaceAll("\\'", "\\\\'");
		if ((s = object.getString("dealinfo")) != null) this.dealinfo = s.replaceAll("\\'", "\\\\'");
		if ((s = object.getString("URL")) != null) this.URL = s;
		if ((s = object.getString("lat")) != null) this.latitude = Double.parseDouble(s);
		if ((s = object.getString("lon")) != null) this.longitude = Double.parseDouble(s);
	}
	
	public static boolean insertStore(MemoryDB db, SaleStore saleStore, int resultID, 
			int date, String searchWord) {
		String query = "INSERT INTO stores VALUES (";
		query += "'" + saleStore.ID + "', ";
		query += resultID + ", ";
		query += "'" + saleStore.name + "', ";
		query += "'" + saleStore.address + "', ";
		query += "'" + saleStore.phone + "', ";
		query += "'" + saleStore.showImage + "', ";
		query += "'" + saleStore.postDate + "', ";
		query += "'" + saleStore.expirationDate + "', ";
		query += "'" + saleStore.dealTitle + "', ";
		query += "'" + saleStore.dealinfo + "', ";
		query += "'" + saleStore.URL + "', ";
		query += saleStore.latitude + ", ";
		query += saleStore.longitude + ", ";
		query += date + ", ";
		query += "'" + searchWord + "');";
		db.Execute(query);
		return true;
	}
	
	public static boolean saveStores(ArrayList<SaleStore> stores, int date, String searchWord) {
		MemoryDB db = new MemoryDB();
		db.Execute("DELETE FROM stores WHERE searchWord='" + searchWord + "';");
		int index = 0;
		for (SaleStore saleStore : stores) {
			insertStore(db, saleStore, index++, date, searchWord);
		}
		db.DB_Close();
		return true;
	}
	
	public static boolean needSearch(int date, String searchWord) {
		boolean needSearch = false;
		MemoryDB db = new MemoryDB();
		String query = "SELECT id FROM stores WHERE date=" + date + " AND searchWord='" + searchWord 
				+ "';";
		ResultSet result = db.ExecuteQuery(query);
		try {
			needSearch = !result.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.DB_Close();
		return needSearch;
	}
}
