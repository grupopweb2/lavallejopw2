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
		System.out.println("aqui wex");
		userLogin = null;
	}
	String message = (String)getServletContext().getAttribute("message");
	if (message == null) message = "";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equip="Content-type" content="text/html;charset=UTF-8">
<title>Menu de comunicados</title>
<link rel="icon" type="image/png" href="img/logo.png">
<link rel='stylesheet' href='css/estilobasico.css'>
<link rel="stylesheet" href="/css/jquery-ui.css">
<script src="/js/jquery/jquery-1.12.4.js"></script>
<script src="/js/jquery/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'dd/mm/yy',
			changeMonth : true,
			changeYear : true,
			yearRange : '-40:+0'
		});
	});
</script>
<style type="text/css">
	input {
		border-radius: 5%;
		background: #dfdfff;
		padding: 1px;
		font-weight: 800;
	}
	textarea {
		border-radius: 5%;
		background: #dfdfff;
		padding: 1px;
		font-weight: 800;
		width: 100%;
	}
	select {
		width: 100%;
		background: #dfdfff;
	}
	.mitad {
		width: 45%;
	}
	fieldset.form {
		width: 13em; 
		padding: 2em;
		margin-top: -7em; 
		margin-left: 2em;
		margin-right: 2em; 
	}
	fieldset.search {
		width: 13em; 
		padding: 2em; 
		margin-top: -7em;
		margin-right:2em;
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
		<li><div></div><p class='menu'><b>HOLA <%=userLogin.getNombre().toUpperCase()%></b></p></li>
		<% } else { %>
		<li><a href="gmailSesion"><div class='barra'></div><p class='menu'>Acceder</p></a></li>
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
		<li><a href='cerrarSesion'><div class='barra'></div><p class='menu'>Cerrar Sesion</p></a></li>
		<% } %>
	</ul>
	</aside>
<nav>
  <ul class="stroke">Menú comunicado
  </ul><%=message.toUpperCase()%>

	<ul class="navbar"> 
		
	
	<fieldset class="search">
	<legend>BUSQUEDA</legend>
	<form name="formBusqueda" action="/menucomunicado" method="get">
		<input type="hidden" name="action" value="buscar">
		Buscar por:
		<Select name="busqueda">
			<option value="nombre">NOMBRE</option>
			<option value="asunto">ASUNTO</option>
			<option value="fecha">FECHA</option>
			<option value="email">EMAIL</option>
		</Select><br>
	<br>
		<input type="text" name="data" required><br>
		<br>
		<input type="submit" value="buscar"> 
		&nbsp; &nbsp; &nbsp; 
		<a href="menucomunicado?action=mostrar">mostrar todos</a>
	</form>
	</fieldset>
	
	<fieldset class="form">
		<legend>CREAR NUEVO COMUNICADO</legend>
		
		<% if (userLogin == null) { %>
			<i>Esta función esta desabilitada por no poseer los permisos necesarios</i>
		<%} else { %>		
				<form name="formCrearComunicado" action="menucomunicado" method="post">
					<input type="hidden" name="action" value="registrar">
					<table class="form">

						<tr>
							<td>Nombre:</td>
							<td><input type="text" name="nombre" value="<%= userLogin.getNombre() %>" readonly required></td>
						</tr>
						<tr>
							<td>Email:</td>
							<td><input type="text" name="email" value="<%= userLogin.getEmail() %>" readonly required></td>
						</tr>
						<tr>
							<td>Asunto:</td>
							<td><input type="text" name="asunto" required></td>
						</tr>
						<tr>
							<td>Mensaje:</td>
							<td><textarea type="textarea" rows="5" name="mensaje" required></textarea></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="reset" value="Limpiar" class="mitad">
								<input type="submit" value="Registrar" class="mitad"></td>
						</tr>
					</table>
				</form>
		<% } %>
	</fieldset>
	
	
	
	</ul>
	</nav>
</body>
</html>