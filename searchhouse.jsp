<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="javax.servlet.http.HttpSession" %>
    <!DOCTYPE html>
			<html>
			<head>
			<meta name="viewport" content="width=device-width, initial-scale=1">
					<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
			        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
				<link rel="stylesheet" href="index.css">
			</head>
			<body>
			
			
			<div class="vertical-menu">
    <%
    try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
			Statement st=con.createStatement();
        	ResultSet rs=st.executeQuery("select * from roomdata");
        
        while(rs.next())
        {%>
			        	
			<button>
			 <div class="card">
			  <h5 class="card-title"><%=rs.getString(4)%></h5>
			    <p class="card-text">Charge:<%=rs.getString(4)%></p>
			</div></button>
			<hr>
			
			
			<% }
    }catch(Exception e){}
        %>
        </div>
			
			</body>
			</html>