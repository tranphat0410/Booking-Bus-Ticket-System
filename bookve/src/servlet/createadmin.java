package servlet;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import utils.DButilsadmin;

/**
 * Servlet implementation class createadmin
 */
//@WebServlet("/createadmin")
@WebServlet(urlPatterns = { "/createadmin" })

public class createadmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		// Forward to /WEB-INF/view/createadmin.jsp
		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/view/admin/createuser.jsp");
		dispatcher.forward(request, response);
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		DButilsadmin db = new DButilsadmin();
		
		String error =null;
		
		
		String UserName = request.getParameter("name");
		String LastName = request.getParameter("lastname");
		String Phone = request.getParameter("phone");
		String Email = request.getParameter("mail");
		String pass = request.getParameter("pass");
		String pass2 = request.getParameter("passagain");
		String Area = request.getParameter("area");
		String Role = request.getParameter("role");
		
		if(UserName==null||LastName==null||Phone==null||Email==null||pass==null||pass2==null||
		   Area==null||Role==null||UserName.length()==0||LastName.length()==0||Phone.length()==0||
		   Email.length()==0||pass.length()==0||pass2.length()==0||
		   Area.length()==0||UserName.length()==0)
		{
			error = "Required";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/WEB-INF/view/admin/createuser.jsp").include(request,response);
		}
		else if(db.cemail(Email)) {
			
			error = "account already exists";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/WEB-INF/view/admin/createuser.jsp").include(request,response);
			
		}
				
		else if (!pass.equals(pass2))
		{
			error = "The password and its confirm are not the same.";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/WEB-INF/view/admin/createuser.jsp").include(request,response);
			
		}
		else if (pass.equals(pass2))
		{
			String mapass = BCrypt.hashpw(pass, BCrypt.gensalt(12));
			if(db.adduser(UserName,LastName,Phone,Email,mapass,Area,Role))
			{
				request.setAttribute("thongbao", "added successfully");
				request.getRequestDispatcher("/WEB-INF/view/admin/createuser.jsp").include(request,response);
				
			}
		}
//		
			
		
	}

}
