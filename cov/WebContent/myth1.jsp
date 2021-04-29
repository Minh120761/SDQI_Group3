 </div>
      </div>
<!DOCTYPE html>
<html>
<head>
 <title>Covid Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">


  <link rel="stylesheet" href="myth.css">
  <link rel="stylesheet" href="login.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
                <a class="nav-link"  href="adp.html">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="#">Myths</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="fact1.jsp">Facts</a>
              </li>
            
             <li class="nav-item c">
                <a class="nav-link" href="home.html">logout</a>
              </li>
            
            
            </ul>
          </div>
        </div>
      </nav>
      <br>
      
      
      
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%! Connection con;Statement st;ResultSet rs; %>


<%
try{
	Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/trail","postgres","root");
	st=con.createStatement();
	rs=st.executeQuery("select * from myths");
}
catch(Exception e)
{
 e.printStackTrace();
}


%>


<div>
        <div class="card" .card style="width: 50rem;">
        
          <div class="card-header">
            Myths
          </div>
 <table>
  
<% 
	      try
			{
	          while(rs.next())
		     {
	        	  out.print("<tr>");
			  out.print("<td>"+rs.getString(2)+"</td>");
			  
			  out.print("</tr>");  
		     }
	        }
    catch(Exception e)
	{
	 e.printStackTrace();	}
%>
</table>  
  
  <script src="js/scripts.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>