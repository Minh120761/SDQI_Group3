package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FactDao;
import modal.FactBean;
import modal.MythBean;

/**
 * Servlet implementation class FactServlet
 */
@WebServlet("/FactServlet")
public class FactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   private FactDao factDao=new FactDao();
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String  factName=request.getParameter("factname");
		String  factdes=request.getParameter("factdes");
		
		
		FactBean fact=new FactBean();
		fact.setFactName(factName);
		fact.setFactDescription(factdes);
		
		
		System.out.println("servley");
		
		try {
			System.out.println("going to dbcon");
			factDao.factEntry(fact);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("adb.html");
	
	}

}
