package salechaser;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

public class ChosenStoreServlet extends HttpServlet {

	private static final long serialVersionUID = 7700165656387529633L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		
		PrintWriter out=response.getWriter();
		String searchWord = request.getParameter("search");
		String chooseWord = request.getParameter("choose");
		
		ArrayList<SaleStore> map_stores = SaleStore.getStores(searchWord, chooseWord);
		JSONArray jsonArray = new JSONArray();
		for (SaleStore saleStore : map_stores) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("name", saleStore.name);
			jsonObject.put("address", saleStore.address);
			jsonObject.put("phone", saleStore.phone);
			jsonObject.put("showImage", saleStore.showImage);
			jsonObject.put("expirationDate", saleStore.expirationDate);
			jsonObject.put("dealTitle", saleStore.dealTitle);
			jsonObject.put("URL", saleStore.URL);
			jsonObject.put("latitude", saleStore.latitude);
			jsonObject.put("longitude", saleStore.longitude);
			jsonArray.put(jsonObject);
		}
		out.write(jsonArray.toString());
		out.close();
	}
}
