package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DButilscustomer;
import utils.DButilsseller;

/**
 * Servlet implementation class userFamousTravelServlet
 */
@WebServlet("/userFamousTravelServlet")
public class userFamousTravelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DButilsseller db = new DButilsseller(); 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userFamousTravelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String text = "F1F2F3F4F5";
		
		int lan =1;
		for(int i = 1; i < text.length();)
		{
			System.out.println("-----------------");
			System.out.println("lan " + lan);
			String in= text.substring(0, 2);
			System.out.println("In: " + in);
		text= text.substring(2, text.length());
		System.out.println("Text: " + text);
		lan++;
		}
		response.sendRedirect("home");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		DButilscustomer db2 = new DButilscustomer();
		String PS = request.getParameter("PS");
		String PF = request.getParameter("PF");
		String Status = "wait";
		System.out.println(PS);
		System.out.println(PF);
		System.out.println(Status);
		request.setAttribute("GO", PS);
		request.setAttribute("END", PF);
		request.setAttribute("travels", db.searchtravel());
		request.setAttribute("MyTravel", db2.listfamoustravelCus(PS, PF, Status));
		RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/view/customer/listtravelview.jsp");
		rd.include(request, response);
	}

}
