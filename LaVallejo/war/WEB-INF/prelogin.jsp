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
	UserService us = UserServiceFactory.getUserService();
	User user = us.getCurrentUser();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Usuario no existente</title>
</head>
<body>
<center>
<%if (user != null) {%>
	<p><h1>HOLA <%= user.getNickname()%> (<%= user.getEmail() %>)</h1>
	<h2>Usted no se encuentra en nuestra base de datos</h2>
			<a href="cerrarSesion">Regresar</a>
			Si usted es particular alumno 
			o padre puede <a href="registrar.jsp">registrarse</a> sin incovenientes, 
			de lo contrario es profesor, personal o algun administrativo, requerira
			<a href="contactenos.jsp">solicitar</a> que el director de la institucion 
			educativa lo registre
		<p><a href="cerrarSesion">Acceder con otra cuenta</a>
<% } else { %>
	<p><h1>HOLA, usted aun no esta logeado</h1>
	<p><h2><a href="gmailSesion">Acceder</a></h2>
<% } %>
</center>
</body>
</html>