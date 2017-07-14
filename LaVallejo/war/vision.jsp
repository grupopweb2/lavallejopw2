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
<meta http-equip="Content-type" content="text/html;charset=UTF-8">
<title>Visión</title>
<link rel="icon" type="image/png" href="img/logo.png">
<link rel='stylesheet' href='css/estilobasico.css'>
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
			<li><a href="gmailSesion"><div
						class='barra'></div>
					<p class='menu'>Acceder</p></a></li>
			<% } %>
			<li><a href="descripcion.jsp"><div class='barra'></div>
					<p class='menu'>Nosotros Somos</p></a></li>
			<li><a href="organigrama.jsp"><div class='barra'></div>
					<p class='menu'>Organigrama</p></a></li>
			<li><a href="vision.jsp"><div class='barra'></div>
					<p class='menu'>Nuestra Visión</p></a></li>
			<li><a href='index'><div class='barra'></div>
					<p class='menu'>Página Principal</p></a></li>
			<%
				if (userLogin != null) {
			%>
			<li><a href='cerrarSesion'><div class='barra'></div>
					<p class='menu'>Cerrar Sesión</p></a></li>
			<%
				}
			%>
		</ul>
	</aside>

	<nav>
		<ul class="stroke">Nuestra Visión ,Misión y Valores
		</ul>
		<fieldset>
			<legend>Nuestra Misión</legend>

			<p class="parrafo">Somos una institución educativa que contamos
				con niveles académicos inicial, primaria, y secundaria , además con
				una plana docente altamente calificada que garantiza la preparación
				de los estudiantes, para acceder a una educación superior y que
				logren ser excelentes profesionales, personas y esten capacitados
				para enfrentar la vida.</p>

		</fieldset>
		<br>
		<fieldset>
			<legend>Nuestra Visión</legend>

			<p class="parrafo">Seremos reconocidos a nivel Arequipa, como la
				primera elección de las familias que garantice la formación
				académica, la madurez emocional y la educación en valores necesarios
				para el futuro de sus hijos en un mundo tecnológico y global</p>

		</fieldset>
		<br>
		<fieldset>
			<legend>Valores</legend>
			<p class="parrafo">Consideramos irrenunciables nuestros valores
				éticos y profesionales que guiando en todo momento nuestra labor,
				nos identifican como una institución educativa seria y coherente
				caracterizada por:
			<table>
				<tr>
					<td>1.-</td>
					<td>Respeto</td>
				</tr>
				<tr>
					<td>2.-</td>
					<td>Responsabilidad</td>
				</tr>
				<tr>
					<td>3.-</td>
					<td>Compromiso</td>
				</tr>
				<tr>
					<td>4.-</td>
					<td>Trato familiar y cordial</td>
				</tr>
				<tr>
					<td>5.-</td>
					<td>Trabajo en equipo</td>
				</tr>
				<tr>
					<td>6.-</td>
					<td>Dedicación y esfuerzo</td>
				</tr>
			</table>
			</p>

		</fieldset>
	</nav>
</body>
</html>