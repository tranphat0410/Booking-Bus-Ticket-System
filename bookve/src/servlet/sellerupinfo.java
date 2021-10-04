package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DButilsseller;

/**
 * Servlet implementation class sellerupinfo
 */ 

@WebServlet(urlPatterns = { "/sellerupinfo" })
public class sellerupinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DButilsseller db = new DButilsseller();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		request.setAttribute("travels", db.viewupinfo(id));

		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/view/seller/uptravel.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("id"));
		String time = request.getParameter("time");
		String timeout = request.getParameter("timeout");
		String status = request.getParameter("Status");
			
			if(db.upinfo(id, time, timeout, status))
			{
				request.setAttribute("travels", db.viewupinfo(id));
				request.setAttribute("thongbao", "Updated successed.");
				RequestDispatcher dispatcher = this.getServletContext()
						.getRequestDispatcher("/WEB-INF/view/seller/uptravel.jsp");
				dispatcher.forward(request, response);
			}
	}

}
