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
		$("#datepicker").datepicker({dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true, yearRange: '-40:+0'});
	});
	
	var options = {
			
			inicial : ["preinicial", "inicial"],
			primaria : ["1ro","2do","3ro","4to","5to","6to"],
			secundaria : ["1ro","2do","3ro","4to","5to"],
			preu : ["UNSA", "UCSM", "UAP", "UCSP"]
	}

	$(function(){
		var fillSecondary = function(){
			var selected = $('#primary').val();
			$('#secondary').empty();
			options[selected].forEach(function(element,index){
				$('#secondary').append('<option value="'+element+'">'+element+'</option>');
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
	<p class='titulo'><h1>LA VALLEJO</h1></p>
  </header>
 <aside>
   <ul class="navbar">
   <li><a href="registrar.html"><div class='barra'></div><p class='menu'>Registrarse</p></a></li>
   
	<li><a href='index.html'><div class='barra'></div><p class='menu'>Pagina Principal</p></a></li>
  </ul>
  </aside>
   <nav>
   <ul class="stroke">Registrar </ul>
<center>

<fieldset><legend>REGISTRO ONLINE</legend>
		<form name="formRegistro" action="registro" method="post">
		<table class="form">
			
			<tr>
				<td>Nombres:</td>
				<td><input type="text" name="nombre" required></td>
			</tr>
			<tr>
				<td>Apellidos:</td>
				<td><input type="text" name="apellido"  required></td>
			</tr>
			<tr>
				<td>Género:</td>
				<td><select name="genero" class="todo">
						<option value="masculino">Masculino</option>
						<option value="femenino">Femenino</option>
				</select></td>
			</tr>
			<tr>
				<td>Dirección:</td>
				<td><input type="text" name="direccion" required></td>
			</tr>
			<tr>
				<td>Correo electrónico:</td>
					<td><input type="text"  name="email"></a>
				</td>
			</tr>
			<tr>
				<td>Nacimiento:</td>
				<td><input type="text" name="nacimiento" id="datepicker" required></td>
			</tr>
			<tr>
				<td>Categoria:</td>
				<td>
					<select name="categoria"  class="todo">
						<option value="particular">particular</option>
						<option value="alumno">alumno</option>
						<option value="padre">padre</option>
						<option value="profesor">profesor</option>
						<option value="personal">personal</option>
						<option value="director">director</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>DNI:</td>
				<td><input type="text" name="dni" required></td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input type="reset" value="Limpiar" class="mitad">
					<input type="submit" name="Siguiente" class="mitad">
				</td>
			</tr>
		</table>
	</form>
		<fieldset>
	</form>
	</center>
	 </nav>
</body>
</html>