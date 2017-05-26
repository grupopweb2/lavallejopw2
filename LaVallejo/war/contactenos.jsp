<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="img/logo.png">
<link rel="stylesheet" href="css/estilobasico.css">
<meta charset="utf-8">
<title>Contactenos</title>
<style type="text/css">
	
	body {
		background: white;
	}
	caption {
		border-style: solid outset;
	
		font-family: calibri;
		background: #8c1020;
		color: white;
		border-radius: .2em;
		font-size: 200%;
	}
	.todo {
		width: 100%;
	}
	.mitad {
		width: 48.5%;
	}
	
	table {
		border-radius: .5em;
		border-style: solid outset;
		
		background: #8c1020;
		color: white;
		margin-top: 5em; 
		font-size: 100%;
		
	}
	textarea {
		width: 96%;
	}
	div {
		margin-top: 5em;
	}
	
	div.up {
		
	}
	div.left {
		float: left;
		width: 20%;
		margin-top: 0px;
	}
	div.right {
		float: right;
		width: 40%;
		margin-top: 0px;
	}
	
</style>
</head>
<body>
<header>
   <h1>La Vallejo</h1>
</header>
<aside>
   <ul class="navbar">
  
	<li><a href='index.jsp'><div class='barra'></div><p class='menu'>Pagina Principal</p></a></li>
  </ul>
  </aside>
 <nav class="nav-registrar">
 
	<div class="left">
		<form action="/contactenos" method="post">
			<table>
				<caption>Ingrese sus datos</caption>
				<tr>
					<td>Nombre:</td>
					<td><input type="text" name="nombres" required></td>
				</tr>
				<tr>
					<td>Asunto:</td>
					<td><input type="text" name="asunto" required></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input type="text" name="email" required></td>
				</tr>
				<tr>
					<td>Teléfono:</td>
					<td><input type="text" name="telefono" required></td>
				</tr>
				<tr>
					<td>Mensaje:</td>
					<td><textarea name="mensaje" rows="5" required></textarea></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="reset" value="limpiar" class="mitad"> 
						<input type="submit" value="enviar" class="mitad">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="right">
		<div class="up">
			<fieldset><legend>Ubicación</legend>
			
			 AV. INDEPENDENCIA N°239 URB. LA VICTORIA
				<p>AV.GOYENECHE 330
		</div>
		</fieldset>
		<br>
		<div class="down">
		
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3827.4698856666796!2d-71.5252970857774!3d-16.400945242532963!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x91424baae61ace83%3A0x5032642dbe65c828!2sAv+Independencia+239%2C+Arequipa!5e0!3m2!1ses!2spe!4v1494521798923" 
			width="300" height="200" frameborder="0" style="border:1 black" allowfullscreen></iframe>
		</div>
		
	</div>
	</nav>
	<footer>
		
			<div id="masInformacion">
				<div class="menus">
					<h5>Institución</h5>
					<ul>
						<li><a href="mision.jsp">La Vallejo</a></li>
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
				<div class="menus">
					<h5>Sedes Arequipa</h5>
					<UL TYPE=square>
						<li>AV. INDEPENDENCIA N°239 URB. LA VICTORIA
						<li>AV.GOYENECHE 330
					</UL> 
					</div>
			</div>
			
		
	</footer>
</body>
</html>