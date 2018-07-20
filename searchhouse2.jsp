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
				
<style>
body {
    font-family: Arial;
    color: white;
}

.split {
    height: 100%;
    width: 50%;
    position: fixed;
    z-index: 1;
    top: 0;
    overflow-x: hidden;
    padding-top: 20px;
}

.left {
    left: 0;
    background-color: #111;
}

.right {
    right: 0;
    background-color: #111;
}

.centered {
    position: absolute;
    top: 50%;
    left: 40%;
    transform: translate(-50%, -50%);
    text-align: center;
}
</style>
</head>
<body>

<div class="split left">
  <div class="centered">
    
			<div id="form1">
			<form class="form-horizontal" action="searchhouse2.jsp">
						    <div class="form-group">
						      <label class="control-label col-sm-2" for="country">Country:</label>
						      <div class="col-sm-8">
						      <input type="text" class="form-control" id="country" name="country">
						      </div>
						    </div>
						    <div class="form-group">
						      <label class="control-label col-sm-2" for="state">State:</label>
						      <div class="col-sm-8">          
						      <input type="text" class="form-control" id="state" name="state">
						      </div>
						    </div>
						    <div class="form-group">
						      <label class="control-label col-sm-2" for="city">City:</label>
						      <div class="col-sm-8">          
						      <input type="text" class="form-control" id="city" name="city">
						      </div>
						    </div>
						    <div class="form-group">        
						      <div class="col-sm-offset-2 col-sm-16">
						        <button type="submit" class="btn btn-default">SEARCH</button>
						      </div>
						 
			</form>
			</div>
  </div>
</div>

<div class="split right">
<h3><u>Houses for :</u></h3>
  <div class="centered">
    <div class="vertical-menu" id="myDIV">
    <%
    try{
    	String country=request.getParameter("country");
    	String state=request.getParameter("state");
    	String city=request.getParameter("city");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
			Statement st=con.createStatement();
        	ResultSet rs=st.executeQuery("select * from roomdata where country='"+country+"' and state='"+state+"' and city='"+city+"'");
        
        while(rs.next())
        {%>	
			<div class="card border-secondary mb-3" style="max-width:28rem;background-color:grey;"><form action="requestprocess.jsp">
			  <div class="card-header">Located in <u><%=rs.getString(4)%></u></div>
			    <h5 class="card-title">It's a <%=rs.getString(7)%></h5>
			    <p class="card-text">Negotiate upto:<%=rs.getInt(8)%></p>
			    <div class="col-sm-offset-2 col-sm-16">
			    <input type="hidden" name="val" value=<%String email=rs.getString(10) ;out.print(email);%>>
				<button type="submit" class="btn btn-default">REQUEST</button>
				</div></form>
			  </div>
			  <hr>
			 
			  	<% 
			  	}
        con.close();
    }catch(Exception e){
    	out.print(e);
    }
        
        %>
        </div>
  </div>
</div>
     
</body>
</html> 