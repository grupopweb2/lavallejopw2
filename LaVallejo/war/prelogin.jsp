<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pw2.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<% User user = (User) request.getAttribute("personax"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Usuario no existente</title>
</head>
<body>
<center>
	<p><h1>HOLA <%= user.getNickname()%> (<%= user.getEmail() %>)</h1>
	<h2>Usted no se encuentra en nuestra base de datos</h2>
			<a href="index.jsp">Regresar</a>
			<td width="20%">Si usted es particular alumno 
			o padre puede <a href="registrar.jsp">registrarse</a> sin incovenientes, 
			de lo contrario es profesor, personal o algun administrativo, requerira
			<a href="contactenos.jsp">solicitar</a> que el director de la institucion 
			educativa lo registre
		<p><a href="cerrarSesion">Acceder con otra cuenta</a>
</center>
</body>
</html>