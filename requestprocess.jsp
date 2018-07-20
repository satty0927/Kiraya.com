<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*"%>
    <%@ page import="javax.servlet.http.HttpSession" %>
	<%
	try{
		
		
	String value=request.getParameter("val");
	
	char[] chars=value.toCharArray();
	int l=value.length();
	int i,pos=0;
	for(i=0;i<l;i++){
		if(chars[i]=='@'){
			pos=i;
			break;
		}
	}
	String fin=value.substring(0, pos);
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
	PreparedStatement ps=con.prepareStatement("insert into "+fin+"requestreceived values(?,?)");
	HttpSession sess=request.getSession(false);
	String email=(String)sess.getAttribute("email");
	ps.setString(1,email);
	ps.setString(2,"pending");
	
	char[] ch=email.toCharArray();
	int len=email.length();
	int q,posn=0;
	for(q=0;q<len;q++){
		if(ch[q]=='@'){
			posn=q;
			break;
		}
	}
	String fin1=email.substring(0, posn);
	PreparedStatement prep=con.prepareStatement("insert into "+fin1+"requestsent values(?,?)");
	prep.setString(1,value);
	prep.setString(2,"pending");
	ps.executeUpdate();
	prep.executeUpdate();
	con.close();
	response.sendRedirect("index2.jsp");
	%><script>
		alert("Request Done");
	</script>
	<%
	}
	catch(Exception e){out.print(e);}
	%>