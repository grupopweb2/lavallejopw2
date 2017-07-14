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

<style>
fieldset {
	padding: 1em;
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

			<li><a href='index'><div class='barra'></div>
					<p class='menu'>Pagina Principal</p></a></li>
			<% if (userLogin != null) { %>
			<li><a href='cerrarSesion'><div class='barra'></div>
					<p class='menu'>Cerrar Sesión</p></a></li>
			<% } %>
		</ul>
	</aside>
	<nav>
		<ul class="stroke"> Niveles
		</ul>
		
		<fieldset><legend>Inicial</legend>

  <p class="parrafo">
  <p>
  	El nivel inicial es una de las fundamentales etapas de la educación,
  	ya que es donde daremos a forjar el interes propio y deseo de superación 
  	en el estudiante.
  </p>
  <p></p>
  
</fieldset>

<fieldset><legend>Primaria</legend>
<p class="parrafo">
  <p>En cada región o país la educación formal se organiza de diversas maneras de acuerdo a las necesidades </p>
  <p>y a las características particulares de la población. Sin embargo, uno de los rasgos más coincidentes es </p>
  <p>la importancia que tiene la educación primaria, elemental o básica, aquella considerada como el gran cimiento</p>
  <p>para que la persona pueda comenzar a adquirir conocimientos y a desarrollar su intelecto. Cuando hablamos de </p>
  <p>educación primaria, tal como lo dice su nombre, hacemos referencia a un tipo de educación que ha sido considerada</p>
  <p>como las más importante, la principal a partir de la cual se podrán echar las bases para educación más compleja </p>
  <p>como la secundaria o la universitaria. Sin ella, es difícil que una persona pueda adquirir los conocimientos que</p>
  <p>se imparten en los dos últimos tipos de educación.</p>
  
  </p>
</fieldset>

<fieldset><legend>Secundaria</legend>
<p class="parrafo">
  <p>La educación secundaria es uno de los pilares de la educación formal junto con sus antecesoras: la educación infantil</p>
  <p>y primaria, y la que le continúa, la educación universitaria o superior.</p>
  <p>Por tratarse como dijimos del nivel de estudios inmediato al universitario, la escuela secundaria, también conocida</p> 
  <p>como Escuela Media, tiene por objetivo la preparación de los alumnos para que puedan acceder sin problemas a la</p>
  <p>universidad, que es en definitivas la instancia que prepara y desarrolla la actividad profesional que cada cual </p>
  <p>escoja.</p>
  <p>Pero también la educación secundaria tiene la misión, más allá de si el alumno continúa o no con una carrera</p>
  <p>universitaria, de formar al adolescente en diversas cuestiones, temas, enseñarle valores, y asimismo habilidades</p> 
  <p>para que pueda desenvolverse de manera conforme en la sociedad o comunidad a la cual pertenece. Es decir, la</p> 
  <p>secundaria debe aportarle al alumno conocimientos generales y básicos que por supuesto estarán más adelantados en</p> 
  <p>función de los contenidos primarios, y claro, abarcarán otras temáticas más complejas que en la edad de primaria </p>
  <p>se hacen difíciles de asimilar.
</fieldset>



</fieldset>
		
		
	</nav>
</body>
</html>