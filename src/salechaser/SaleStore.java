package salechaser;

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
		if ((s = object.getString("dealTitle")) != null) this.dealTitle = s;
		if ((s = object.getString("dealinfo")) != null) this.dealinfo = s;
		if ((s = object.getString("URL")) != null) this.URL = s;
		if ((s = object.getString("lat")) != null) this.latitude = Double.parseDouble(s);
		if ((s = object.getString("lon")) != null) this.longitude = Double.parseDouble(s);
	}
}
