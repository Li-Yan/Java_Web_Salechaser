package salechaser;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChooseServlet extends HttpServlet {
	
	private static final long serialVersionUID = -7907458305252469720L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String urlString = request.getParameter("result_parameter");
		response.sendRedirect(urlString);
	}
}
