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
	Persona userLogin = (Persona) getServletContext().getAttribute("userLogin");
	if (user == null) {
		userLogin = null;
	}
%>
<!DOCTYPE hml>
<html>
<head>
<link rel="icon" type="image/png" href="img/logo.png">
<title>REQUISITOS</title>
<link rel="stylesheet" href="css/estilobasico.css">
<body>
<header>
<p class='titulo'><h1>LA VALLEJO</h1></p>
  </header>
  <aside>
   <ul class="navbar">
   <% if (userLogin != null) { %>
	<li><div></div><p class='menu'><b>HOLA <%=userLogin.getNombre().toUpperCase()%></b></p></li>
	<% } else { %>
	<li><a href="gmailSesion"><div class='barra'></div><p class='menu'>Acceder</p></a></li>
	<% } %>
   	<li><a href="requisitos.jsp"><div class='barra'></div><p class='menu'>Requisitos </p></a></li>
   	<li><a href=""><div class='barra'></div><p class='menu'>Cronograma</p></a></li>
	<li><a href='index'><div class='barra'></div><p class='menu'>Pagina Principal</p></a></li>
  	<% if (userLogin != null) { %>
	<li><a href='cerrarSesion'><div class='barra'></div><p class='menu'>Cerrar Sesión</p></a></li>
	<% } %>
  </ul>
  </aside>
  <nav>
<center>
<ul class="stroke">Requisitos de la Institucion</ul>
<ul type="square">
<table>



<tr>
<td><li>Edad cumplida al 31 de marzo paraq inicial y primaria </li></td>
</tr>
<tr>
<td><li>Ficha unica de matricula(codigo modular de colegio de procedencia y codigo del educando)</li></td>
</tr>
<tr>
<td><li>Partida de Nacimiento</li></td>
</tr>
<tr>
<td><li>DNI del estudiante</li></td>
</tr>
<tr>
<td><li>DNI de los padres o apoderados</li></td>
</tr>
<tr>
<td><li>Ultima boleta de notas</li></td>
</tr>
<tr>
<td><li>Certificado de estudios y comportamiento</li></td>
</tr>
<tr>
<td><li>4 fotos tamaño carnet</li></td>
</tr>
<tr>
<td><li>Firmar el reglamento interno del colegio</li></td>
</tr>

</ul>
</body>
</table>
</center>
</head>
</html>