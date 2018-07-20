<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<%
	try{
			String reqemail=request.getParameter("email");
			char[] chars=reqemail.toCharArray();
	    	int l=reqemail.length();
	    	int i,pos=0;
	    	for(i=0;i<l;i++){
	    		if(chars[i]=='@'){
	    			pos=i;
	    			break;
	    		}
	    	}
	    	String fin=reqemail.substring(0, pos);
	    	String mymail=(String)session.getAttribute("email");
	    	Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
			PreparedStatement ps=con.prepareStatement("update "+fin+"requestsent set status=? where requestedemail=?");
			ps.setString(1,"approved");
			ps.setString(2,mymail);
			ps.executeUpdate();
			
			char[] characters=mymail.toCharArray();
			int len=mymail.length();
			int q,p=0;
			for(q=0;q<len;q++){
				if(characters[q]=='@'){
	    			p=q;
	    			break;
				}
			}
			String fin1=mymail.substring(0,p);
			PreparedStatement preps=con.prepareStatement("update "+fin1+"requestreceived set status=? where requestoremail=?");
			preps.setString(1,"approved");
			preps.setString(2,reqemail);
			preps.executeUpdate();
            con.close();
            %>
            <script>
            alert("approved");
            </script>
            <%
	}	
	catch(Exception e){
		out.print(e);
	}
%>
			