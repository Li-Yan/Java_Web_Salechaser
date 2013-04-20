package salechaser;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

public class SearchServlet extends HttpServlet {
	/*
	 * return URL format:
	 * 	index.jsp?show_result=1&stores=name@,@dealTitle@,@URL@,@showImag@,@geocodee@,@expirationDate@,@address@,@phone@;@...
	 */

	private static final long serialVersionUID = -260652636708185564L;
	private static final String api_8coupons_key = "d53d442c6196098bbf1455fec0df04c608077cb55278b4238781ded759b9dea7f2453f1ee46bb3090eb441c080a1b093";
	private static final String url_8coupons_getdeals = "http://api.8coupons.com/v1/getdeals?";
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private String saleSearch(HashMap<String, String> Parameter) {
		String urlString = url_8coupons_getdeals + "key=" + api_8coupons_key;
		//Set parameters
		Iterator iter = Parameter.entrySet().iterator();
		while (iter.hasNext()) {
			Map.Entry<String, String> entry = (Entry<String, String>) iter.next();
			urlString = urlString + "&" + entry.getKey() + "=" + entry.getValue();
		}
		
		String response = "";
		String line;
		try {
			URL url = new URL(urlString);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			BufferedReader rd = new BufferedReader(new InputStreamReader(connection.getInputStream()));
	         while ((line = rd.readLine()) != null) {
	            response = response + line;
	         }
	         rd.close();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return response;
	}
	
	private ArrayList<SaleStore> parseResult(String jsonString) {
		JSONArray jsonArray = new JSONArray(jsonString);
		ArrayList<SaleStore> stores = new ArrayList<SaleStore>();
		for (int i = 0; i < jsonArray.length(); i++) {
			stores.add(new SaleStore((JSONObject) jsonArray.get(i)));
		}
		return stores;
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		HashMap<String, String> parameter = new HashMap<String, String>();
		String zipcode = request.getParameter("zipcode_textField");
		if (zipcode != null) {
			if (!zipcode.equals("Empty is valid")) {
				parameter.put("zipcode", zipcode);
			}
		}
		String mileradius = request.getParameter("mileradius_textField");
		if (mileradius != null) {
			if (!mileradius.equals("Empty is valid")) {
				parameter.put("mileradius", mileradius);
			}
		}
		String category = request.getParameter("category_select");
		if (category != null) {
			if (!category.equals("any")) {
				parameter.put("categoryid", SharedMemory.categoryID.get(category));
			}
		}
		String keyword = request.getParameter("keyword_textField");
		if (keyword != null) {
			if (!keyword.equals("Empty is valid")) {
				parameter.put("search", keyword);
			}
		}
		parameter.put("limit", String.valueOf(SharedMemory.max_list));
		
		String urlString = request.getParameter("search_parameter");
		if (urlString.indexOf("index.jsp") < 0) {
			urlString = urlString + "index.jsp";
		}
		String result = saleSearch(parameter);
		ArrayList<SaleStore> stores = parseResult(result);
		request.setAttribute("show_result", 1);
		request.setAttribute("stores", stores);
		
		ServletContext sc = getServletContext();
		RequestDispatcher rd = null;
		rd = sc.getRequestDispatcher("/index.jsp");
        rd.forward(request, response);
		
		/*
		String urlString = "../index.jsp?show_result=1";
		if (stores.size() > 0) {
			urlString = urlString + "&stores=";
			int m = 0;
			for (SaleStore saleStore : stores) {
				if (m == 0) m = 1;
				else urlString = urlString + "@;@";		//using "@!@" to separate different stores
				urlString = urlString + saleStore.name + "@,@" + saleStore.dealTitle + "@,@" + 
						saleStore.URL + "@,@" + saleStore.showImage + "@,@" + 
						String.valueOf(saleStore.latitude) + "," + String.valueOf(saleStore.longitude) +
						"@,@" + saleStore.expirationDate + "@,@" + saleStore.address + "@,@" + saleStore.phone;
			}
		}
		*/
		//response.sendRedirect(urlString);
	}
}
