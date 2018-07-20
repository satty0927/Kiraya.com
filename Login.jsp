<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="javax.servlet.http.HttpSession" %>
	<%
    	
	    String email=request.getParameter("email");
 		String password=request.getParameter("password");
 		HttpSession sess=request.getSession();
 		session.setAttribute("email",email);
 		int i=0;
 		
 		try{
 			Class.forName("oracle.jdbc.driver.OracleDriver");
 			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
 			Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from registration where email='"+email+"' and password='"+password+"'");
            
            if(rs.next())
            {
            	response.sendRedirect("index2.jsp");
    			}
            else{
            	out.println("invalid data");
            }
          con.close();
 		}catch(Exception e){
 			out.print(e);
 		}
	%>
		