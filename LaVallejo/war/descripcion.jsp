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
<title>Descripción de la Intitución</title>
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
			<% if (userLogin != null) { %>
			<li><a href='cerrarSesion'><div class='barra'></div>
					<p class='menu'>Cerrar Sesión</p></a></li>
			<% } %>
		</ul>
	</aside>
	<nav>
		<ul class="stroke">Nosotros Somos
		</ul>

		<fieldset>
			<legend>Descripción de la Institución</legend>

			<p class="parrafo">
				Somos un institución educativa que cuenta con 17 años de experiencia
				dedicados al rubro de la educación inicial, primaria y secundaria,
				nacimos con el objetivo de brindar la mejor educacion a nuestros
				niños y adolecentes haciendo de ellos grandes personas con una
				visión ganadora. <br> Contamos con una plana docente calificada
				que garantiza la preparación de los estudiantes, nuestro colegio <font>La
					Vallejo</font> busca que vuestros hijos sean conscientes en sus estudios
				en la busqueda de su carrera profesional sin olvidarse los valores
				que inculcamos en nuestro centro educativo. <br><br> <b>
					Buscamos en vuestros Hijos </b><br><br>
			<table>
				<tr>
					<td>1.-</td>
					<td>Desarrollar sistemas de aprendizaje de acuerdo a la
						capacidad del estudiante.</td>
				</tr>
				<tr>
					<td>2.-</td>
					<td>Potenciar el desarrollo de valores del estudiante y la
						articipacion de la familia.</td>
				</tr>
				<tr>
					<td>3.-</td>
					<td>Motivar e involuvrar al estudiante en un nuevo sistema de
						aprendizajede alta exigencia</td>
				</tr>
				<tr>
					<td>4.-</td>
					<td>Impartir una educación consistente que otorgue al
						estudiante las herramientas adecuadas para su ingreso y desarrollo
						exitoso a cualquier centro superior</td>
				</tr>
			</table>
			</p><br>
		</fieldset>
	</nav>

</body>
</html>