package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import utils.DButilsadmin;

/**
 * Servlet implementation class userSignUpServlet
 */
@WebServlet("/userSignUpServlet")
public class userSignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userSignUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		DButilsadmin db = new DButilsadmin();
		
		String error =null;
		
		
		String UserName = request.getParameter("uname");
		String LastName = request.getParameter("lname");
		String Phone = request.getParameter("Cphone");
		String Email = request.getParameter("Cmail");
		String pass = request.getParameter("Npass");
//		String pass = BCrypt.hashpw(request.getParameter("Npass"), BCrypt.gensalt(12));
		String pass2 = request.getParameter("Npassagain");
//		String pass2 = BCrypt.hashpw(request.getParameter("Npassagain"), BCrypt.gensalt(12));
		String Area = request.getParameter("Carea");
		String Role = "Customer";
		
		if(UserName==null||LastName==null||Phone==null||Email==null||pass==null||pass2==null||
		   Area==null||Role==null||UserName.length()==0||LastName.length()==0||Phone.length()==0||
		   Email.length()==0||pass.length()==0||pass2.length()==0||
		   Area.length()==0||UserName.length()==0)
		{
			error = "Required";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/WEB-INF/view/LoginAndSignUpView.jsp").include(request,response);
		}
		else if(db.cemail(Email)) {

			error = "account already exists";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/WEB-INF/view/LoginAndSignUpView.jsp").include(request,response);
			
		}
				
		else if (!pass.equals(pass2))
		{
			error = "The password and its confirm are not the same.";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/WEB-INF/view/LoginAndSignUpView.jsp").include(request,response);
			
		}
		else if (pass.equals(pass2))
		{
			String mapass = BCrypt.hashpw(pass, BCrypt.gensalt(12));
			if(db.adduser(UserName,LastName,Phone,Email,mapass,Area,Role))
			{
				
				request.setAttribute("thongbao", "added successfully");
				request.getRequestDispatcher("/WEB-INF/view/LoginAndSignUpView.jsp").include(request,response);
				
			}
		}
	}

}
