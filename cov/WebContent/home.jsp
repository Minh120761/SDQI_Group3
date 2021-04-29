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
</head>
<body>
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



		String csvFilePath = "C:\\data\\4-2\\sdqiproject\\implementation\\docker-airflow-master\\covid\\data1.csv";
		
		
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
		        
		        
		        String query = "select * from covidd";
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
		        	String sql = "INSERT INTO covidd (country, who, total_cases, total_cases_per1lkpop, new_cases_in_7days, new_cases_in_7days_per1lkpop, new_cases_24hrs, total_deaths, total_deaths_per1lkpop, deaths_in_7days, deaths_in_7days_per1lkpop, deaths_in_24hrs, transmission) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
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
		               String toCase=data[2];
		               String toCasePop=data[3];
		               String casesWeek=data[4];
		               String casesWeekPop=data[5];
		               String casesDay=data[6];
		               String totalDeaths=data[7];
		               String totalDeathsPop=data[8];
		               String deathsWeek=data[9];
		               String deathsWeekPop=data[10];
		               String deathsDay=data[11];
		               String trans=data[12];
		               

		               statement.setString(1, countryName);
		               statement.setString(2, whoName);
		   				statement.setString(3, toCase);
		   				statement.setString(4, toCasePop);
		   				statement.setString(5, casesWeek);
		   				statement.setString(6, casesWeekPop);
		   				statement.setString(7, casesDay);
		   				statement.setString(8, totalDeaths);
		   				statement.setString(9, totalDeathsPop);
		   				statement.setString(10, deathsWeek);
		   				statement.setString(11, deathsWeekPop);
		   				statement.setString(12, deathsDay);
		   				statement.setString(13, trans);
		 				
		 				
		 				
		 				
		 				
		                statement.addBatch();
		 
		                if (count % batchSize == 0) {
		                    statement.executeBatch();
		                }
		            }
		 
		            lineReader.close();
		 
		            // execute the remaining queries
		            statement.executeBatch();
		 
		           
		        }
		        else
		        {
		        	
		        	
		        			String sql = " UPDATE covidd SET who=?, total_cases=?, total_cases_per1lkpop=?, new_cases_in_7days=?, new_cases_in_7days_per1lkpop=?, new_cases_24hrs=?, total_deaths=?, total_deaths_per1lkpop=?, deaths_in_7days =?, deaths_in_7days_per1lkpop =? , deaths_in_24hrs=?, transmission=? WHERE country=?" ;
		        			PreparedStatement statement = connection.prepareStatement(sql);
		
		        			BufferedReader lineReader = new BufferedReader(new FileReader(csvFilePath));
		        			String lineText = null;
		
		        			int count = 0;
		
		        			lineReader.readLine(); // skip header line public static void main(String[] args) {
		        			lineReader.readLine();
		        			while ((lineText = lineReader.readLine()) != null) {
		        			    String[] data = lineText.split(",");
		        			    
		        			    
		        			   
		        	             
		        	            String countryName = data[0];
		        	            String whoName = data[1];
		        	            String toCase=data[2];
		        	            String toCasePop=data[3];
		        	            String casesWeek=data[4];
		        	            String casesWeekPop=data[5];
		        	            String casesDay=data[6];
		        	            String totalDeaths=data[7];
		        	            String totalDeathsPop=data[8];
		        	            String deathsWeek=data[9];
		        	            String deathsWeekPop=data[10];
		        	            String deathsDay=data[11];
		        	            String trans=data[12];
		        	            

		        	           
		        	            statement.setString(1, whoName);
		        					statement.setString(2, toCase);
		        					statement.setString(3, toCasePop);
		        					statement.setString(4, casesWeek);
		        					statement.setString(5, casesWeekPop);
		        					statement.setString(6, casesDay);
		        					statement.setString(7, totalDeaths);
		        					statement.setString(8, totalDeathsPop);
		        					statement.setString(9, deathsWeek);
		        					statement.setString(10, deathsWeekPop);
		        					statement.setString(11, deathsDay);
		        					 statement.setString(12, trans);
		        					statement.setString(13, countryName);
		        			    
		        			    statement.addBatch();
		
		        			    if (count % batchSize == 0) {
		        			        statement.executeBatch();
		        			    }
		        			}
		
		        			lineReader.close();
		
		        			// execute the remaining queries
		        			statement.executeBatch();
		
		        			
		
		        	
		        	
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
      
      
      
<div class=container>
        <div class='tableauPlaceholder'  id='viz1619525096584' style='position: relative' ><noscript><a href='#'><img alt='Dashboard 2 ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;P9&#47;P95TQ3TSP&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='path' value='shared&#47;P95TQ3TSP' /> <param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;P9&#47;P95TQ3TSP&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en' /><param name='filter' value='publish=yes' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1619525096584');                    var vizElement = divElement.getElementsByTagName('object')[0];                    if ( divElement.offsetWidth > 800 ) { vizElement.style.width='1357px';vizElement.style.height='10027px';} else if ( divElement.offsetWidth > 500 ) { vizElement.style.width='1357px';vizElement.style.height='10027px';} else { vizElement.style.width='100%';vizElement.style.height='7927px';}                     var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>
      </div>
      
      
      
      
      
  </script>

      <script src="js/scripts.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

      
      
	
</body>
</html>