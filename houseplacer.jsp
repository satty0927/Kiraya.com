<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
	String country=request.getParameter("country");
	String state=request.getParameter("state");
	String city=request.getParameter("city");
	String locality=request.getParameter("locality");
	
	HttpSession locationdata=request.getSession();
	locationdata.setAttribute("country", country);
	locationdata.setAttribute("state", state);
	locationdata.setAttribute("city", city);
	locationdata.setAttribute("locality", locality);
	
	response.sendRedirect("addhouse2.jsp");
%>