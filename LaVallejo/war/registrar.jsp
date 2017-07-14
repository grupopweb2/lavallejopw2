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
<meta charset="utf-8">
<title>Registrar</title>
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

	var options = {

		inicial : [ "preinicial", "inicial" ],
		primaria : [ "1ro", "2do", "3ro", "4to", "5to", "6to" ],
		secundaria : [ "1ro", "2do", "3ro", "4to", "5to" ],
		preu : [ "UNSA", "UCSM", "UAP", "UCSP" ]
	}

	$(function() {
		var fillSecondary = function() {
			var selected = $('#primary').val();
			$('#secondary').empty();
			options[selected]
					.forEach(function(element, index) {
						$('#secondary').append(
								'<option value="'+element+'">' + element
										+ '</option>');
					});
		}
		$('#primary').change(fillSecondary);
		fillSecondary();
	});
</script>
<style type="text/css">
body {
	background: white;
}

caption {
	border-style: solid outset;
	font-family: calibri;
	background: #8c0000;
	color: white;
	border-radius: .2em;
	font-size: 150%;
}

.todo {
	width: 100%;
}

table {
	border-radius: .5em;
	border-style: solid outset;
	background: #8c0000;
	color: white;
	margin-top: 3em;
	font-size: 100%;
}
</style>
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
			<li><div></div>
				<p class='menu'>
					<b>HOLA <%=userLogin.getNombre().toUpperCase()%></b>
				</p></li>
			<% } else { %>
			<li><a href="gmailSesion"><div class='barra'></div>
					<p class='menu'>Acceder</p></a></li>
			<% } %>
			<li><a href="registrar.jsp"><div class='barra'></div>
					<p class='menu'>Registrarse Nivel 1</p></a></li>
					
			<li><a href="redireccionar?site=registraradmin"><div class='barra'></div>
					<p class='menu'>Registrarse Nivel 2</p></a></li>

			<li><a href='index'><div class='barra'></div>
					<p class='menu'>Pagina Principal</p></a></li>
			<% if (userLogin != null) { %>
			<li><a href='cerrarSesion'><div class='barra'></div>
					<p class='menu'>Cerrar Sesión</p></a></li>
			<% } %>
		</ul>
	</aside>
	<nav>
		<ul class="stroke">Registrar
		</ul>
		<center>

			<fieldset>
				<legend>REGISTRO ONLINE</legend>
				<form name="formRegistro" action="registrar" method="post">
					<table class="form">

						<tr>
							<td>Nombres:</td>
							<td><input type="text" name="nombre" required></td>
						</tr>
						<tr>
							<td>Apellidos:</td>
							<td><input type="text" name="apellido" required></td>
						</tr>
						<tr>
							<td>Genero:</td>
							<td><select name="sexo" class="todo">
									<option value="M">Masculino</option>
									<option value="F">Femenino</option>
							</select></td>
						</tr>
						<tr>
							<td>Direccion:</td>
							<td><input type="text" name="direccion" required></td>
						</tr>
						<tr>
							<td>Correo electronico:</td>
							<td><input type="text" name="email"
								pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required></a>
							</td>
						</tr>
						<tr>
							<td>Nacimiento:</td>
							<td><input type="text" name="nacimiento" id="datepicker"
								required></td>
						</tr>
						<tr>
							<td>Categoria:</td>
							<td><select name="categoria" class="todo">
									<option value="particular">particular</option>
									<option value="alumno">alumno</option>
									<option value="padre">padre</option>
							</select></td>
						</tr>

						<tr>
							<td>DNI:</td>
							<td><input type="text" placeholder="12345678" name="dni"
								size="8" pattern="[0-9]{8}" maxlength="8" required></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="reset" value="Limpiar" class="mitad">
								<input type="submit" name="Siguiente" class="mitad"></td>
						</tr>
					</table>
				</form>
				<fieldset>
		</center>
	</nav>
</body>
</html>