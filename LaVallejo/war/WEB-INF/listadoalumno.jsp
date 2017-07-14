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
	List<Persona> listado = (List<Persona>)getServletContext().getAttribute("listado");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equip="Content-type" content="text/html;charset=UTF-8">
<title>Menu de alumnos</title>
<link rel="icon" type="image/png" href="img/logo.png">
<link rel='stylesheet' href='css/estilobasico.css'>
<link rel="stylesheet" href="/css/jquery-ui.css">
<script src="/js/jquery/jquery-1.12.4.js"></script>
<script src="/js/jquery/jquery-ui.js"></script>

<style type="text/css">
fieldset {
	width: 13em;
	padding: 2em;
	margin-top: -7em;
	margin-right: 2em;
}

td {
	padding: .5em;
	text-align: center;
	background: #d0dafd;
	color: #339;
}
tr:hover td {
	background: #aaffaa;
}
</style>
</head>
<body>
	<!-- Menu de navegacion -->
	<header>
	<p class='titulo'>
	<h1>LA VALLEJO</h1>
	</p>
	</header>

	<!-- Menu de navegacion -->
	<aside>
	<ul class="navbar">
		<% if (userLogin != null) { %>
		<li><div></div>
			<p class='menu'>
				<b>HOLA <%=userLogin.getNombre().toUpperCase()%></b>
			</p></li>
		<% } else { %>
		<li><a href="gmailSesion"><div class='barra'></div>
				<p class='menu'>Acceder</p></a></li>
		<% } %>
		<li><a href='redireccionar?site=menualumno'><div
					class='barra'></div>
				<p class='menu'>Menu Alumno</p></a></li>
		<li><a href='redireccionar?site=menudocente'><div
					class='barra'></div>
				<p class='menu'>Menu Profesor</p></a></li>
		<li><a href='index'><div class='barra'></div>
				<p class='menu'>Pagina Principal</p></a></li>
		<% if (userLogin != null) { %>
		<li><a href='cerrarSesion'><div class='barra'></div>
				<p class='menu'>Cerrar Sesión</p></a></li>
		<% } %>
	</ul>
	</aside>
	<nav>
	<ul class="stroke">Menú alumno
	</ul>

	<ul class="navbar">


		<fieldset>
			<legend><%=listado.size() > 0 ? "RESULTADOS" : "SIN RESULTADOS"%></legend>
			<table>
				<tr>
					<td><b>Nombres</b></td>
					<td><b>Apellidos</b></td>
					<td><b>Sexo</b></td>
					<td><b>email</b></td>
					<td><b>categoria</b></td>
					<td><b>Activo</b></td>
					<td><b>Admin</b></td>
					<td><b>Acción</b></td>
				</tr>
				<% for (Persona p : listado) { %>
				<tr>
					<td><%=p.getNombre()%></td>
					<td><%=p.getApellido()%></td>
					<td><%=p.getSexo()%></td>
					<td><%=p.getEmail()%></td>
					<td><%=p.getCategoria()%></td>
					<td><%=p.isActivo()%></td>
					<td><%=p.isAdmin()%></td>
					<td><a
						href="menualumno?action=eliminar&id=<%=p.getIdPersona()%>">Eliminar</a></td>
				</tr>
				<% } %>
			</table>
		</fieldset>

	</ul>
	</nav>
</body>
</html>