package salechaser;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChooseServlet extends HttpServlet {
	
	private static final long serialVersionUID = -7907458305252469720L;

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		if (request.getAttribute("stores") != null) {
			ArrayList<SaleStore> stores = (ArrayList<SaleStore>) request.getAttribute("stores");
			System.out.println(stores.size());
		}
		response.sendRedirect("index.jsp");
	}
}
