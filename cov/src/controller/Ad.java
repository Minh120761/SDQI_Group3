package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDao;
import modal.LoginBean;

/**
 * Servlet implementation class Ad
 */
@WebServlet("/Ad")
public class Ad extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	private LoginDao loginDao;

	public void init() {
		loginDao = new LoginDao();
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String aEmail = request.getParameter("email");
		String aPassword = request.getParameter("password");
		LoginBean loginBean = new LoginBean();
		loginBean.setAdminEmail(aEmail);;
		loginBean.setAdminPassword(aPassword);
		PrintWriter out = response.getWriter(); 
		try {
			if (loginDao.validate(loginBean)) {
				//HttpSession session = request.getSession();
				// session.setAttribute("username",username);
				//out.print("User...!"); 
				response.sendRedirect("adb.html");
			} else {
				
				out.print("Invalid User...!"); 
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		
		
	}

}
