<!DOCTYPE html>
<html lang="es">
<head>
<link rel="icon" type="image/png" href="img/logo.png">
    <title>Iniciar Sesion</title>
    <meta charset="utf-8">
    
    <link type="text/css" href="css/estilologin.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/estilobasico.css">
</head>
 
<body>
<header>
	<p class='titulo'><h1>LA VALLEJO</h1></p>
  </header>
<aside>
   <ul class="navbar">
   <li><a href="matricula.jsp"><div class='barra'></div><p class='menu'>Registrarse</p></a></li>
   
	<li><a href='index.jsp'><div class='barra'></div><p class='menu'>Pagina Principal</p></a></li>
  </ul>
  </aside>
  <nav> 
 <ul class="stroke">Inicie Sesion</ul>
    <div id="registrar">
</div> 
 
    <div id="envoltura">
        <div id="contenedor">
 <p><center>Iniciar Sesion</center></p>
            <div id="cabecera" >
            </div>
 
            <div id="cuerpo">
                <form id="form-login" action="gmailSesion" method="post" autocomplete="off">
                
                    <p><label >email:</label></p>
                        <input name="email" type="text" id="usuario" placeholder="Ingresa Usuario" autofocus="" required></p>
<!-- 
                    <p><label>Contraseña:</label></p>
                        <input name="password" type="password" id="contrasenia" placeholder="Ingresa Password" required></p>
-->
                    <p id="bot"><input type="submit" id="submit" name="submit" value="Ingresar" class="boton"></p>
                </form>
            </div>

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