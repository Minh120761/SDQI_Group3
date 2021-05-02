package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


import modal.MythBean;

public class MythDao {
	
	public int mythEntry(MythBean myth) throws ClassNotFoundException {
        

	       int result = 0;
	       try
	       {
	    	   Class.forName("org.postgresql.Driver");
	    	   Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/trail","postgres","root");
	    	   PreparedStatement st = con.prepareStatement("insert into myths values(?, ?)");
	        
	    	   st.setString(1,myth.getMythName());
	    	   st.setString(2,myth.getMythDescription());
	    	   
	       
	    	  
	    	   
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
