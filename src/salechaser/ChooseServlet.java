package salechaser;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChooseServlet extends HttpServlet {
	
	private static final long serialVersionUID = -7907458305252469720L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String urlQuery = request.getParameter("choose_parameter");
		response.sendRedirect("index.jsp?" + urlQuery);
	}
}
