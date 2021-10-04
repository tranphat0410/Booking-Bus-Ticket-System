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
 * Servlet implementation class sellerupusertick
 */
@WebServlet("/sellerupusertick")
public class sellerupusertick extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DButilsseller db = new DButilsseller();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sellerupusertick() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int id = Integer.parseInt(request.getParameter("id"));

		request.setAttribute("ticket", db.ticket(id));

		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/view/seller/upticket.jsp");
		dispatcher.forward(request, response);
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		int id = Integer.parseInt(request.getParameter("id"));
		
		
		String lastname = request.getParameter("lastname");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		if(db.upuserticket(id, lastname, name, phone)) 
		{
			request.setAttribute("ticket", db.ticket(id));

			RequestDispatcher dispatcher = request.getServletContext()
					.getRequestDispatcher("/WEB-INF/view/seller/upticket.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
