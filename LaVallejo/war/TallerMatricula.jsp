<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="img/logo.png">
<link rel="stylesheet" href="css/estilobasico.css">
<title>titulo</title>

</head>

<header>
	<h1>La Vallejo</h1>
</header>
<aside>
	<ul class="navbar">


		<li><a href='index.jsp'><div class='barra'></div>
				<p class='menu'>Pagina Principal</p></a></li>
	</ul>
</aside>
<nav>
	<ul class="stroke">Talleres La Vallejo
	</ul>
	<body background="/img/fondo.png">

		<form action="" method="post">
			<!-- <img src="/img/fondo.png" alt="" width="890" height="800" />  -->
			<h1>Ficha de Matricula para el Taller</h1>
			<p>
				<label for="nombre">Nombre: </label> <input type="text"
					name="nombre" id="nombre"> <br /> <label for="apellido">Apellido:
				</label> <input type="text" name="apellido" id="apellido"> <br /> <label
					for="email">Email: </label> <input type="text" name="email"
					id="email"> <br /> <label type="grado">Grado: </label> <input
					type="text" name="grado" id="grado"><br> <input
					type="radio" name="sexo" id="varon" value="Var�n"> <label
					for="varon">Var�n:</label> <br /> <br /> <input type="radio"
					name="sexo" id="mujer" value="Mujer"> <label for="mujer">Mujer:
				</label> <br /> <br /> <label fot="Talleres">Talleres: </label> <select
					name="deportes">
					<option>Atletismo</option>
					<option>Natacion</option>
					<option>Judo</option>
					<option>Danza</option>
					<option>Ajedrez</option>
					<option>Oratoria</option>
					<br>
					<br>
					<br>
					<input type="submit" value="Matricular">
			</p>
		</form>
</nav>
</body>
</html>