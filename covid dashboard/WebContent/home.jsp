<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*" %>
<%@page import="java.nio.file.*" %>


<!DOCTYPE html>
<html>
<head>
 <title>Covid Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
  
  <link rel="stylesheet" href="a.css">
  <link rel="stylesheet" href="login.css">
 <script type="text/javascript" src="https://prod-apnortheast-a.online.tableau.com/javascripts/api/tableau-2.8.0.js"></script>
<script src="d.js"></script>

  
 
</head>
<body onload="initViz();">
		<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark ">
        <div class="container-fluid">
          <a class="navbar-brand" href="#">Covid Dashboard</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="#">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="myth.jsp">Myths</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="fact.jsp">Facts</a>
              </li>
            
              <li class="nav-item v">
                <a class="nav-link" href="login.html">Login</a>
              </li>
              
            
            </ul>
          </div>
        </div>
      </nav>
      
      
<%



		String csvFilePath = "C:\\data\\4-2\\sdqiproject\\implementation\\docker-airflow-master\\covid\\clean2.csv";
		
		
		if(Files.exists(Paths.get(csvFilePath)))
		{
		
		    int batchSize = 20;
		    Class.forName("org.postgresql.Driver");
		    Connection connection = null;
		    
		    try 
		    {
		
		        connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/trail", "postgres", "root");
		        connection.setAutoCommit(false);
		        System.out.println("connection");
		        
		        
		        String query = "select * from covid";
		        Statement st1=connection.createStatement();
		        ResultSet rs=st1.executeQuery(query);
		        int countt=0;
		        while(rs.next())
		        {
		        	countt++;
		        	System.out.println(countt);
		        }
		        	
		        if(countt==0)
		        {
		        	String sql = "INSERT INTO covid (country, who, total_cases, total_cases_per1lkpop, new_cases_in_7days, new_cases_in_7days_per1lkpop, new_cases_in_24hrs, total_deaths, total_deaths_per1lkpop, deaths_in_7days, deaths_in_7days_per1lkpop, deaths_in_24hrs, transmission) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
		            PreparedStatement statement = connection.prepareStatement(sql);
		 
		            BufferedReader lineReader = new BufferedReader(new FileReader(csvFilePath));
		            String lineText = null;
		 
		            int count = 0;
		 
		            lineReader.readLine(); // skip header line public static void main(String[] args) {
		           
		            while ((lineText = lineReader.readLine()) != null)
		            {
		            	
		            	String[] data=new String[50];
		                data = lineText.split(",");
		                
		                String countryName = data[0];
		                String whoName = data[1];
		                Float toCase=Float.valueOf(data[2]);
			               Float  toCasePop=Float.valueOf(data[3]);
			               System.out.println(data[2]);
			               Float casesWeek= Float.valueOf(data[4]);
			               Float casesWeekPop=Float.valueOf(data[5]);
			               Float casesDay= Float.valueOf(data[6]);
			               Float totalDeaths= Float.valueOf(data[7]);
			               Float totalDeathsPop=Float.valueOf(data[8]);
			               Float deathsWeek= Float.valueOf(data[9]);
			               Float deathsWeekPop=Float.valueOf(data[10]);
			               Float deathsDay= Float.valueOf(data[11]);
			               String trans=data[12];
			               

			               statement.setString(1, countryName);
			               statement.setString(2, whoName);
			   				statement.setFloat(3, toCase);
			   				statement.setFloat(4, toCasePop);
			   				statement.setFloat(5, casesWeek);
			   				statement.setFloat(6, casesWeekPop);
			   				statement.setFloat(7, casesDay);
			   				statement.setFloat(8, totalDeaths);
			   				statement.setFloat(9, totalDeathsPop);
			   				statement.setFloat(10, deathsWeek);
			   				statement.setFloat(11, deathsWeekPop);
			   				statement.setFloat(12, deathsDay);
			   				statement.setString(13, trans);
			 				
			 				
			 				
		 
		                
			   				statement.executeUpdate();
							System.out.println("inserted");
		            }
		 
		            lineReader.close();
		 
		            // execute the remaining queries
		            statement.executeBatch();
		 
		           
		        }
		        else
		        {
		        	
		        	
		        			String sql = " UPDATE covid SET who=?, total_cases=?, total_cases_per1lkpop=?, new_cases_in_7days=?, new_cases_in_7days_per1lkpop=?, new_cases_in_24hrs=?, total_deaths=?, total_deaths_per1lkpop=?, deaths_in_7days =?, deaths_in_7days_per1lkpop =? , deaths_in_24hrs=?, transmission=? WHERE country=?" ;
		        			PreparedStatement statement = connection.prepareStatement(sql);
		
		        			BufferedReader lineReader = new BufferedReader(new FileReader(csvFilePath));
		        			String lineText = null;
		
		        			int count = 0;
		
		        			lineReader.readLine(); // skip header line public static void main(String[] args) {
		        			
		        			while ((lineText = lineReader.readLine()) != null) {
		        			    String[] data = lineText.split(",");
		        			    
		        			    
		        			   
		        	             
		        			    String countryName = data[0];
				                String whoName = data[1];
				                Float toCase=Float.valueOf(data[2]);
					               Float  toCasePop=Float.valueOf(data[3]);
					               System.out.println(data[2]);
					               Float casesWeek= Float.valueOf(data[4]);
					               Float casesWeekPop=Float.valueOf(data[5]);
					               Float casesDay= Float.valueOf(data[6]);
					               Float totalDeaths= Float.valueOf(data[7]);
					               Float totalDeathsPop=Float.valueOf(data[8]);
					               Float deathsWeek= Float.valueOf(data[9]);
					               Float deathsWeekPop=Float.valueOf(data[10]);
					               Float deathsDay= Float.valueOf(data[11]);
					               String trans=data[12];	        	           
					              
					               statement.setString(1, whoName);
					   				statement.setFloat(2, toCase);
					   				statement.setFloat(3, toCasePop);
					   				statement.setFloat(4, casesWeek);
					   				statement.setFloat(5, casesWeekPop);
					   				statement.setFloat(6, casesDay);
					   				statement.setFloat(7, totalDeaths);
					   				statement.setFloat(8, totalDeathsPop);
					   				statement.setFloat(9, deathsWeek);
					   				statement.setFloat(10, deathsWeekPop);
					   				statement.setFloat(11, deathsDay);
					   				statement.setString(12, trans);
					   			 statement.setString(13, countryName);
		        			    
		        			    //statement.addBatch();
								statement.executeUpdate();
								System.out.println("updated");
		        			    //if (count % batchSize == 0) {
		        			    //    statement.executeBatch();
		        			   // }
		        			}
		
		        			lineReader.close();	
		        }
		        
		        connection.commit();
		        st1.close();
		        connection.close();
		        
		       try
		       {
		        Files.deleteIfExists(Paths.get(csvFilePath));
		        System.out.println("deleted");
		       }
		       catch(IOException ix)
		       {
		    	   System.err.println(ix);
		       }
		
		    } 
		    catch (IOException ex)
		    {
		        System.err.println(ex);
		    } 
		    catch (SQLException ex)
		    {
		        ex.printStackTrace();
		    }
		}
		else
		{
			System.out.println("no file");
		}

%>
      
	<div id=cont> </div>

  
  

      <script src="js/scripts.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

      
      
	
</body>
</html>