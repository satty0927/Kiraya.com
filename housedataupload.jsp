<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.servlet.http.HttpSession" %>
     <%@ page import="java.sql.*"%>

    
    <%
    HttpSession locationdata=request.getSession();
    String bhk=request.getParameter("bhk");
    String lat=request.getParameter("lat");
    String lng=request.getParameter("lng");
    String country=(String)locationdata.getAttribute("country");
    String state=(String)locationdata.getAttribute("state");
    String city=(String)locationdata.getAttribute("city");
    String locality=(String)locationdata.getAttribute("locality");
    String charge=request.getParameter("price");
    int pay=Integer.parseInt(charge);

		
   try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
    PreparedStatement ps=cn.prepareStatement("insert into roomdata values(?,?,?,?,?,?,?,?,?)");
    ps.setString(1,country);
	ps.setString(2,state);
	ps.setString(3,city);
	ps.setString(4,locality);
	ps.setString(5,lat);
	ps.setString(6,lng);
	ps.setString(7,bhk);
	ps.setInt(8,pay);
	ps.setString(9,"null");
	ps.executeUpdate();
	%><script>
	alert('Update Successful');
	</script>
	<%
	response.sendRedirect("index2.jsp");
	
    
    }catch(Exception e){
    	out.print(e);
    }
	%>