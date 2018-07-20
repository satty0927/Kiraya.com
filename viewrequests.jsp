<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*"%>
    <%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View requests</title>
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js"></script>
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css">
 	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">          
</head>
<body>
	
	<%
    	try{
 			Class.forName("oracle.jdbc.driver.OracleDriver");
 			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
 			Statement st=con.createStatement();
 			HttpSession sess=request.getSession(false);
 			String email=(String)sess.getAttribute("email");
 			
 			char[] chars=email.toCharArray();
	    	int l=email.length();
	    	int i,pos=0;
	    	for(i=0;i<l;i++){
	    		if(chars[i]=='@'){
	    			pos=i;
	    			break;
	    		}
	    	}
	    	String fin=email.substring(0, pos);
	    	String status="pending";
 		
 			ResultSet rs=st.executeQuery("select * from "+fin+"requestreceived where status='"+status+"'");
 			
 			while(rs.next()){
 				String mail=rs.getString(1);
 				ResultSet res=st.executeQuery("select * from registration where email='"+mail+"'");
 				if (res.next()){%>
 	 				<div style="width:900px; height:320px;">
 	 				 <div class="row">
 	 			    <div class="col s12 m12">
 	 			      <div class="card">
 	 			        <div class="card-image offset-s6" style="width:300px; height:320px;float:right">
 	 			          <img src="house2.jpg">
 	 			        </div>
 	 			        <form action=approvingrequest.jsp>
 	 			        <div class="card-content"> 	 			        
 	 			          <h3><%out.print(res.getString(1));%></h3>
 	 			          <span>Contact:<%out.print(res.getString(3));%></span>
 	 			          <blockquote>Age:<%out.print(res.getString(5));%></blockquote>
 	 			          <blockquote>Martial Status:<%out.print(res.getString(7));%></blockquote>
 	 			          <blockquote>Occupation:<%out.print(res.getString(8));%></blockquote>
 	 			          <input type="hidden" name="email" value=<%out.print(mail);%>>
 	 			        </div>
 	 			        <div class="card-action">
 	 			           <button type="submit" class="waves-effect waves-light btn-small">APPROVE<i class="material-icons left">done_outline</i></button>
 	 			        </div>
 	 			        </form>
 	 			      </div>
 	 			    </div>
 	 			  </div>
 	 			  <div> <%			
 				}
 				
 			}con.close();
            
            
          }catch(Exception e){
        	  out.print(e);
          }
	%>


			
 	
	</body>
</html>