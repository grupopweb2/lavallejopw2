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
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Organigrama</title>
<link rel="icon" type="image/png" href="img/logo.png">
<link rel="stylesheet" href="css/estilobasico.css">

</head>
<body>
	<header>
		<p class='titulo'>
		<h1>LA VALLEJO</h1>
		</p>
	</header>
	<aside>
		<ul class="navbar">
			<% if (userLogin != null) { %>
			<li><div></div><p class='menu'><b>HOLA <%=userLogin.getNombre().toUpperCase()%></b></p></li>
			<% } else { %>
			<li><a href="gmailSesion"><div class='barra'></div><p class='menu'>Acceder</p></a></li>
			<% } %>
			<li><a href="descripcion.jsp"><div class='barra'></div><p class='menu'>Nosotros Somos</p></a></li>
			<li><a href="organigrama.jsp"><div class='barra'></div><p class='menu'>Organigrama</p></a></li>
			<li><a href="vision.jsp"><div class='barra'></div><p class='menu'>Nuestra Visión</p></a></li>
			<li><a href='index'><div class='barra'></div><p class='menu'>Página Principal</p></a></li>
			<% if (userLogin != null) { %>
			<li><a href='cerrarSesion'><div class='barra'></div><p class='menu'>Cerrar Sesión</p></a></li>
			<% } %>
		</ul>
	</aside>
	<nav>
		<ul class="stroke">Organigrama
		</ul>

		<center>
			<img style="margin: 28px;" alt="" src="img/ORGANIGRAMA.PNG"
				border="2" />
		</center>
	</nav>
</body>
</html>