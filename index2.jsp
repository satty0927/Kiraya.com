<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*"%>
    <%@ page import="javax.servlet.http.HttpSession" %>
	<%
    	try{
 			Class.forName("oracle.jdbc.driver.OracleDriver");
 			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
 			Statement st=con.createStatement();
 			HttpSession sess=request.getSession(false);
 			String s=(String)sess.getAttribute("email");
 		
 			ResultSet rs=st.executeQuery("select * from registration where email= '" +s+"'");
 			if(rs.next()){
 				HttpSession ss=request.getSession();
 				String uname=rs.getString(1);
 				ss.setAttribute("uname", uname);
 			}
            
            
          }catch(Exception e){}
	%>
		
<!DOCTYPE html>
<html>
<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>INDEX2</title> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="index.css">
        
        <script>
        
        		
        
        	function renter(){
        		document.getElementById("searchhouse").id="addhouse";
        		document.getElementById("addhouse").innerHTML="Add a house";
        		document.getElementById("addhouse").onclick=function(){addhouse()};
        		document.getElementById("approvedrequests").id="viewrequests";
        		document.getElementById("viewrequests").innerHTML="Check requests";
        		document.getElementById("viewrequests").onclick=function(){viewrequests()};
        		document.getElementById("btn3").innerHTML="Renter/Button 3";
        		document.getElementById("btn4").innerHTML="Renter/Button 4";
        	}
        	
        	function rentee(){
        		document.getElementById("addhouse").id="searchhouse";
        		document.getElementById("searchhouse").innerHTML="Search a house";
        		document.getElementById("searchhouse").onclick=function(){searchhouse()};
        		document.getElementById("viewrequests").id="approvedrequests";
        		document.getElementById("approvedrequests").innerHTML="Approved Requests";
        		document.getElementById("approvedrequests").onclick=function(){approvedrequests()};
        		document.getElementById("btn3").innerHTML="Rentee/Button 3";
        		document.getElementById("btn4").innerHTML="Rentee/Button 4";
        	}
        	
        	function addhouse(){
        		document.getElementById("page").data="addhouse.jsp";
        	}
        	function searchhouse(){
        		document.getElementById("page").data="searchhouse.jsp";
        	}
        	function viewrequests(){
        		document.getElementById("page").data="viewrequests.jsp";
        	}
        	function approvedrequests(){
        		document.getElementById("page").data="approvedrequests.jsp";
        	}
        	
        </script>
</head>
<body background="homes2.jpg" style="background-size: 100%">

		 <nav id="head" class="navbar bg-primary">
        	<div id="btn">
        	<div id="head2"></div>
        		<div id="primarybtn">
            <button id="home" class="btn btn-primary btn-lg" href="#">HOME</button>
            <button id="aboutus" class="btn btn-primary btn-lg">ABOUT US</button>
            <button id="contactus" type="button" class="btn btn-primary btn-lg">CONTACT US</button></div>
            <button id="registerbtn" type="button" class="btn btn-primary btn-lg" onclick=renter()>RENTER</button>
            <button id="loginbtn" type="button" class="btn btn-primary btn-lg" onclick=rentee()>RENTEE</button>
          </div>
          </nav>
        
        
        	
        
			<div class = "container-right"></div>
			
			<div id="renter" class="sidenav" style="border-radius:4px 4px 4px 4px;width: 200px;"><center>
                  <div style="padding:20px;">
                     <img id="pic" src="house2.jpg" class="img-circle" width="100" height="100">
                      <a><span class="black-text name" id="dashname">
                      <% HttpSession ss=request.getSession(false);
                      String username=(String)ss.getAttribute("uname");
                      out.print(username);%></span></a>
                      <a id="dashemail"><span class="black-text name"><%
         			HttpSession sess=request.getSession(false);
         			String dashname=(String)sess.getAttribute("email");
         			out.print(dashname);%></span></a><hr>
                </div class="btn-group-vertical"> 
                  <button style="width:100%" class="btn btn-primary btn-lg" id="addhouse" onclick=addhouse()>Add a house</button>
                  <button style="width:100%" class="btn btn-primary btn-lg" id="viewrequests" onclick=viewrequests()>View Requests</button>
                  <button style="width:100%" class="btn btn-primary btn-lg" id="btn3">Update Data</button>
                  <button style="width:100%" class="btn btn-primary btn-lg" id="btn4">Button 4</button></center>
            </div>
            
            
			

         

         
        <div id="foot">
            <footer class="bg-primary">
                <div class="container">
                  <div class="row">
                      <h5 class="white-text">Our Sponsors</h5>
                        <a href="#!">Le-Chachu.com</a>
                        <a class="white-text" href="http://www.silantechnology.com/">Silan Technology</a>
                        <a class="white-text" href="#!">Palamu Real Estates</a>
                        <a class="white-text" href="#!">Google</a>
                  </div>
                </div>
                <div class="footer-copyright">
                  <div class="container">
                  <!-- &copy --> 2018 Copyright
                  </div>
                </div>
              </footer>
        </div>
        <object id="page" width="1000" height="450">
    </body>
</html>