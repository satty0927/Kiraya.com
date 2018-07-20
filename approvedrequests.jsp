<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*"%>
    <%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Approved requests</title>
   
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
 			String myemail=(String)sess.getAttribute("email");
 			
 			char[] chars=myemail.toCharArray();
	    	int l=myemail.length();
	    	int i,pos=0;
	    	for(i=0;i<l;i++){
	    		if(chars[i]=='@'){
	    			pos=i;
	    			break;
	    		}
	    	}
	    	String fin=myemail.substring(0, pos);
	    	String status="approved";
 		
 			ResultSet rs=st.executeQuery("select * from "+fin+"requestsent where status='"+status+"'");
 			
 			while(rs.next()){
 				String mail=rs.getString(1);
 				ResultSet res=st.executeQuery("select * from roomdata where email='"+mail+"'");
 				if (res.next()){%>
 	 				<div style="width:900px; height:320px;">
 	 				 <div class="row">
 	 			    <div class="col s12 m12">
 	 			      <div class="card">
 	 			        <form action=viewcontacts.jsp>
 	 			        <div class="card-content"> 	 			        
 	 			          <h3>I have a:<%out.print(res.getString(7));%></h3>
 	 			          <span>In  <%out.print(res.getString(4));%>,<%out.print(res.getString(3));%></span>
 	 			          <span style="float:right">Status:<b>Approved</b> </span>
 	 			          <input type="hidden" name="email" value=<%out.print(mail);%>>
 	 			        </div>
 	 			        <div class="card-action">
 	 			           <button type="submit" class="waves-effect waves-light btn-small">VIEW CONTACTS<i class="material-icons left">done_outline</i></button>
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