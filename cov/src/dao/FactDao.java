package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import modal.FactBean;


public class FactDao {

	public int factEntry(FactBean fact) throws ClassNotFoundException {
        

	       int result = 0;
	       try
	       {
	    	   Class.forName("org.postgresql.Driver");
	    	   Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/trail","postgres","root");
	    	   PreparedStatement st = con.prepareStatement("insert into facts values(?, ?)");
	        
	    	   st.setString(1,fact.getFactName());
	    	   st.setString(2,fact.getFactDescription());
	    	   
	       
	    	  
	    	   
	    	   result= st.executeUpdate(); 
	    	   st.close(); 
	    	   con.close();    
	    	   System.out.println("inserted successfully");
	    	   
	         } 
	         catch (Exception e) { 
	             e.printStackTrace(); 
	         }  

	        
	        return result;
	        
	}
}
