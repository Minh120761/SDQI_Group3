package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MythDao;

import modal.MythBean;

/**
 * Servlet implementation class MythServlet
 */
@WebServlet("/MythServlet")
public class MythServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MythDao mythDao=new MythDao();
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String  mythName=request.getParameter("mythname");
		String  mydes=request.getParameter("mythdes");
		
		
		MythBean myth=new MythBean();
		myth.setMythName(mythName);
		myth.setMythDescription(mydes);
		
		
		System.out.println("servley");
		
		try {
			System.out.println("going to dbcon");
			mythDao.mythEntry(myth);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("adb.html");
	
	}

}
