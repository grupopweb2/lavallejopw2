<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pw2.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>

<%@ page import="java.io.IOException"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="javax.jdo.PersistenceManager"%>
<%@ page import="javax.servlet.RequestDispatcher"%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%
PersistenceManager pm = PMF.get().getPersistenceManager();
List<Persona> personas = (List<Persona>) pm.newQuery("select from " 
							+ Persona.class.getName()).execute();
UserService us = UserServiceFactory.getUserService();
User user = us.getCurrentUser();
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mostrando</title>
</head>
<body>

<center><table border="1">
 	<tr>
		<td>Nombres</td><td>Apellidos</td><td>Sexo</td><td>email</td><td>categoria</td><td>Activo</td><td>Admin</td>
 	</tr>
<% for (Persona p: personas) { %>
	<tr>
		<td><%= p.getNombre() %></td><td><%= p.getApellido() %></td><td><%= p.getSexo() %></td><td> <%= p.getEmail() %></td>
		<td><%= p.getCategoria() %></td><td><%= p.isActivo() %></td><td><%= p.isAdmin() %></td>
 	</tr>
<% } %>
<% if (user != null) {%>
	<tr>
		<td>Actual</td>
		<td align="center" colspan="6"><%= user.getEmail() %></td>
 	</tr>
<% } else {%>
	<tr>
		<td>Actual</td>
		<td align="center" colspan="6">No hay</td>
 	</tr>
<% } %>
</table></center>
</body>
</html>