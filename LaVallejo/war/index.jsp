<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pw2.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<% UserService us = UserServiceFactory.getUserService(); %>
<% User user = us.getCurrentUser(); %>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js" lang=""> <!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel=StyleSheet href='css/estilosindex.css' type='text/css' media=screen>
<link rel=StyleSheet href='css/estilofooterindex.css' type='text/css' media=screen>
<title>I.E.P. LA VALLEJO</title>
<script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>

<style type="text/css">
body {
	color: black;
}

div {
	background: #8c1020; /* #8c0000 */
}

div.logoleft {
	float: left;
	width: 20%;
}

div.logoright {
	float: right;
	width: 80%;
}
img {
	border-radius: 3em;
	margin: 1em;
}
marquee {
	padding-top: 1em;
	color:  #000040;
	font-size: 450%;
	font-family:'Times New Roman',sans-serif; 
	
	text-shadow: 5px 5px 5px #ffffff;
	/*
	text-shadow: 3px 3px 5px #f00,
               6px 6px 5px #0f0,
               9px 9px 5px #00f;
    */
}

header {
	padding-bottom: 5px;
}
</style>

<!-- Start WOWSlider.com HEAD section -->
<!-- add to the <head> of your page -->
<link rel="Stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="Stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="Stylesheet" type="text/css" href="css/main.css" />
<script type="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		var altura = $('.menu').offset().top;
		$(window).on('scroll', function() {
			if ($(window).scrollTop() > altura) {
				$('.menu').addClass('menu-fixed');
			} else {
				$('.menu').removeClass('menu-fixed');
			}
		});
	});
</script>

<script type="text/javascript">
	function validar() {

		if (document.Logeo.usuario.value == '') {
			alert('El campo usuario es requerido');
			document.Logeo.usuario.focus();
			return false;
		} else if (document.Logeo.password.value == '') {
			alert('El campo coontraseña es requerido');
			document.Logeo.password.focus();
			return false;
		}

		return true;
	}
</script>


<style type="text/css">
body {
	color: black;
}

div {
	background: #8c1020; /* #8c0000 */
}

div.logoLeft {
	float: left;
	width: 20%;
}

div.logoRight {
	float: right;
	width: 70%;
}

div.logoRightLeft {
	float: left;
	width: 70%;
}
div.logoRightRight {
	margin-top: 5em;
	float: right;
	width: 30%;
}

img {
	border-radius: 3em;
	margin: 1em;
}
marquee {
	padding-top: 1em;
	color:  #000040;
	font-size: 100%;
	font-family:'Times New Roman',sans-serif; 
	
	text-shadow: 5px 5px 5px #ffffff;
	/*
	text-shadow: 3px 3px 5px #f00,
               6px 6px 5px #0f0,
               9px 9px 5px #00f;
    */
}
ul.stroke {
	text-align: left;
	color: #000040;
	background: #8c1020;
	font-family: Brush Script MT;
	font-size: 60px;
	letter-spacing: 0;
	font-weight: bold;
	text-shadow: -1.3px -1.3px 1.3px #ffffff, 1.3px -1.3px 1.3px #ffffff,
		-1.3px 1.3px 1.3px #ffffff, 1.3px 1.3px 1.3px #ffffff;
}

header {
	padding-bottom: 5px;
}

div.info {
	background: #aaa;
	font-family: Arial;
	font-size: 17px;
	letter-spacing: 0;
	font-weight: bold;
	text-shadow: -1.3px -1.3px 1.3px #ffffff, 1.3px -1.3px 1.3px #ffffff,
		-1.3px 1.3px 1.3px #ffffff, 1.3px 1.3px 1.3px #ffffff;
}

</style>

</head>
<body>
<div class="container">
	<noscript>
		<center>
			<h1>Hola. Para el correcto funcionamiento de la página se
				requieren los scripts activados</h1>
		</center>
	</noscript>
	


	<div class="container">
		<div class="logoLeft">
			<img src="img/logov.gif" width="140" height="200" align="left">
		</div>
		<div class="logoRight">
			<div class="logoRightLeft">
				
				<ul class="stroke">Institucion Educativa "La Vallejo" </ul>
			</div>
			<div class="logoRightRight info">
				<form name="formAcceder" action="gmailSesion" method="get">
					<fieldset style="border: 0.9px solid black">
						<% if (user != null) { %>
							<% if (user.getEmail().equalsIgnoreCase("rescobedo@gmail.com")) { %>
								<script type="text/javascript">
									window.location="indexadmin.jsp";
								</script>
							<% } else {%>
						<table>
							<caption><marquee>Bienvenido <%= user.getNickname() %> </marquee></caption>
							
							<tr>
								<td>Email: </td>
								<td><%= user.getEmail() %></td>
							</tr>
							
							<tr>
								<td colspan="2" align="center"><a href="cerrarSesion"> Cerrar sesión </a></td>
							</tr>
							
						</table>
							<% }%>
						<% } else { %>
							<form name="formAcceder" action="gmailSesion" method="get">
								<fieldset style="border: 0.9px solid black">
									<table border=1>
										<tr>
											<td><input class="acceder" type="submit" value="acceder"></td>
										</tr>
									</table>
								</fieldset>
							</form>
							<% } %>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	
	
	
	
	
	<div class="container">
	<header>
		<div class="container ">

			<div class="row">
				<div class="container-fluid collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav  nav-pills nav-justified primero ">
						<li><a href="menu.html">Inicio</a></li>

						<li><a href="">Colegio</a>
							<ul>
								<li><a href="descripcion.jsp">Nuestra Historia</a></li>
								
								<li><a href="vision.jsp">Mision/vision</a></li>
		
								<li><a href="organigrama.jsp">Organigrama</a></li>
							</ul></li>
						<li><a href="">Niveles</a></li>

						<li><a href="">Matriculas</a>
							<ul>
								<li><a href="">Cronograma</a></li>
								<li><a href="requisitos.jsp">Requisitos</a></li>
								<li><a href="matricula.jsp">Matricular</a></li>
							</ul></li>

						<li><a href="">Pensiones</a></li>


						<!--  
						<li><a href="">Login</a>
							<ul>
								<li><a href="registrar.html">Registrarse</a></li>
								<li><a href="login.html">login</a></li>
								
							</ul></li>
						-->
						<li><a href="">Talleres</a>
							<ul>
								<li><a href="deportes.jsp">Deportes</a></li>
								<li><a href="TallerMatricula.jsp">Matricula</a></li>
							</ul></li>

						<li><a href="contactenos.jsp">Contactenos</a></li>



						<li><a href="">Galeria</a></li>


					</ul>
				</div>

			</div>
		</div>

	</header>
	</div>
	<div class="container">
		<div class="carousel slide" id="miSlider">
			<div class="carousel-inner">
				<div class="item active">
					<img src="img/col0.jpg" width="1200" height="400" no-repeat
						alt="imagen">
				</div>
				<div class="item">
					<img src="img/col2.jpg" width="1200" height="400" no-repeat
						alt="imagen">
				</div>
				<div class="item">
					<img src="img/col3.jpg" width="1200" height="400" no-repeat
						alt="imagen">
				</div>
			</div>
			<a href="#miSlider" class="carousel-control left" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span></a> 
			<a href="#miSlider"	class="carousel-control right" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span></a>
		</div>
	</div>

  <div class="container">
<footer>
		
			<div id="masInformacion">
				<div class="menus">
					<h5>Sedes Arequipa</h5>
					<UL TYPE=square>
						<li class="square">AV. INDEPENDENCIA N°239 URB. LA VICTORIA
						<li class="square">AV.GOYENECHE 330
					</UL> 
				</div>
				<div class="menus">
					<h5>Institución</h5>
					<ul>
						<li><a href="vision.jsp">La Vallejo</a></li>
						<li><a href="contactenos.jsp">Contactenos</a></li>
						<li><a href="https://www.google.com.mx/maps/place/Av+Independencia+242,+Arequipa,+Per%C3%BA/@-16.4008852,-71.5237378,19z/data=!3m1!4b1!4m5!3m4!1s0x91424baae7cc2c27:0x28e55aa83bfd6ed5!8m2!3d-16.4008852!4d-71.5231906">Busquenos</a></li>
					</ul>
				</div>
				<div class="menus">
					<h5>Paginas Relacionadas</h5>
					<ul>
						<li><a href="organigrama.jsp" target='_blank'>ORGANIGRAMA</a></li>
						<li><a href="descripcion.jsp" target='_blank'>QUIENES SOMOS</a></li>
						<li><a href="ingresantes.jsp" target='_blank'>NUESTROS INGRESANTES</a></li>
					</ul>
				</div>
				<div class="menus">
					<h5>Instituciones Relacionadas</h5>
					<ul TYPE=square>
						<li><a href="https://www.facebook.com/pages/Academias-Y-Colegios-La-Vallejo-/108804416285394" target='_blank'>ACADEMIA LA VALLEJO</a></li>
						<li><a href="https://www.facebook.com/Academia-Militar-Policial-Los-Rangers-135640593238517/" target='_blank'>ACADEMIA MILITAR-POLICIAL LOS RANGERS</a></li>
					</ul>
				</div>
				
			</div>
			
		
	</footer>
	</div>
</div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

        <script src="js/vendor/bootstrap.min.js"></script>

        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>

        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
        <script>
            (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
            e=o.createElement(i);r=o.getElementsByTagName(i)[0];
            e.src='//www.google-analytics.com/analytics.js';
            r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
            ga('create','UA-XXXXX-X','auto');ga('send','pageview');
        </script>
</body>
</html>