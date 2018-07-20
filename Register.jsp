<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>

	<%

		try{
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			
			String password=request.getParameter("password");	
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
			

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
			PreparedStatement ps=con.prepareStatement("insert into registration values(?,?,?,?,?,?,?,?)");
			ps.setString(1,name);
			ps.setString(2,email);
			ps.setString(3,phone);
			ps.setString(4,password);
			ps.setInt(5,0);
			ps.setString(6,"null");
			ps.setString(7,"null");
			ps.setString(8,"null");
			ps.executeUpdate();
			
			Statement st=con.createStatement();
			String requestreceived="create table "+fin+"requestreceived("+"requestoremail varchar(50),"+"status varchar2(10))";
			st.executeUpdate(requestreceived);
			String requestsent="create table "+fin+"requestsent("+"requestedemail varchar(50),"+"status varchar2(10))";
			st.executeUpdate(requestsent);
			%><script>
			alert('Successfully Registered');
			</script>
			<%
			response.sendRedirect("index.html");
			con.close();
		}
			catch(Exception e){
				out.print(e);
			}
	%>
		