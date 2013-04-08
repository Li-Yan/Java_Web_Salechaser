package salechaser;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChooseServlet extends HttpServlet {
	
	private static final long serialVersionUID = 6178340552751985717L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		SharedMemory.checked_stores.clear();
		
		for (int i = 0; i < SharedMemory.max_list; i++) {
			String activeString = request.getParameter(String.valueOf(i));
			if ("on".equalsIgnoreCase(activeString)) {
				SharedMemory.checked_stores.add(i);
			}
		}
		
		response.sendRedirect("../index.jsp");
	}
}
