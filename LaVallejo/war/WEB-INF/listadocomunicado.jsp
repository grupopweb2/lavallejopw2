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
	List<Comunicado> listado = (List<Comunicado>)getServletContext().getAttribute("listado");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equip="Content-type" content="text/html;charset=UTF-8">
<title>Comunicados</title>
<link rel="icon" type="image/png" href="img/logo.png">
<link rel='stylesheet' href='css/estilobasico.css'>
<link rel="stylesheet" href="/css/jquery-ui.css">
<script src="/js/jquery/jquery-1.12.4.js"></script>
<script src="/js/jquery/jquery-ui.js"></script>

<style type="text/css">

fieldset.all {
	width: 90%;
	padding: 2em;
	margin-top: -7em;
	margin-right: 2em;
	margin-bottom: 5em;
}

td {
	padding: .7em;
	text-align: justify;
	background: #d0dafd;
	color: #339;
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
		<li><a href='menucomunicado'><div
					class='barra'></div>
				<p class='menu'>Menu comunicado</p></a></li>
		<li><a href='menucomunicado?action=mostrar'><div
					class='barra'></div>
				<p class='menu'>Lista comunicado</p></a></li>
		<li><a href='index'><div class='barra'></div>
				<p class='menu'>Pagina Principal</p></a></li>
		<% if (userLogin != null) { %>
		<li><a href='cerrarSesion'><div class='barra'></div>
				<p class='menu'>Cerrar Sesión</p></a></li>
		<% } %>
	</ul>
	</aside>
	<nav>
	<ul class="stroke">Menú comunicado
	</ul>

	<ul class="navbar">


		<fieldset class="all">
			<legend><%=listado.size() > 0 ? "RESULTADOS" : "SIN RESULTADOS"%></legend>
			<table>
				<% for (Comunicado p : listado) { %>
				<tr>
					<td><b>Asunto:</b> <%=p.getAsunto()%></td>
					<td><b>Fecha:</b> <%=p.getFecha()%></td>
				</tr>
				<tr>
					<td colspan="2"><b><%=p.getNombre() %></b>: <%=p.getMensaje()%></td>
				</tr>
				<tr>
					<td><b>Email:</b> <i><%=p.getEmail()%></i></i></td>
					<td>
					<% if (userLogin!=null && userLogin.isAdmin()) { %>
						<a href="menucomunicado?action=eliminar&id=<%=p.getIdComunicado()%>">Eliminar</a>
					<% } else { %>
						<b>Acciones:</b> Ninguna
					<% } %>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="background: #fff;"></td>
				</tr>
				<% } %>
			</table>
		</fieldset>

	</ul>
	</nav>
</body>
</html>