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
<link rel="icon" type="image/png" href="img/logo.png">
<link rel="stylesheet" href="css/estilobasico.css">
<title>titulo</title>
</head>
<body background="/img/fond.jpg" >
<header>
	<h1>La Vallejo</h1>
</header>
<aside>
	<ul class="navbar">
		<% if (userLogin != null) { %>
		<li><div></div><p class='menu'><b>HOLA <%=userLogin.getNombre().toUpperCase()%></b></p></li>
		<% } else { %>
		<li><a href="gmailSesion"><div class='barra'></div><p class='menu'>Acceder</p></a></li>
		<% } %>
		<li><a href='index'><div class='barra'></div><p class='menu'>Pagina Principal</p></a></li>
		<% if (userLogin != null) { %>
		<li><a href='cerrarSesion'><div class='barra'></div><p class='menu'>Cerrar Sesión</p></a></li>
		<% } %>
	</ul>
</aside>
<nav>
	<ul class="stroke">Talleres La Vallejo
	</ul>
	

		<form action="" method="post">
			<!-- <img src="/img/fondo.png" alt="" width="890" height="800" />  -->
			<h1>Ficha de Matricula para el Taller</h1>
			<p>
				<label for="nombre">Nombre: </label> <input type="text"
					name="nombre" id="nombre"> <br /> <label for="apellido">Apellido:
				</label> <input type="text" name="apellido" id="apellido"> <br /> <label
					for="email">Email: </label> <input type="text" name="email"
					id="email"> <br /> <label type="grado">Grado: </label> <input
					type="text" name="grado" id="grado"><br> <input
					type="radio" name="sexo" id="varon" value="Varón"> <label
					for="varon">Varón:</label> <br /> <br /> <input type="radio"
					name="sexo" id="mujer" value="Mujer"> <label for="mujer">Mujer:
				</label> <br /> <br /> <label fot="Talleres">Talleres: </label> <select
					name="deportes">
					<option>Atletismo</option>
					<option>Natacion</option>
					<option>Judo</option>
					<option>Danza</option>
					<option>Ajedrez</option>
					<option>Oratoria</option>
					<br>
					<br>
					<br>
					<input type="submit" value="Matricular">
			</p>
		</form>
</nav>
</body>
</html>