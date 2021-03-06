<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="img/logo.png">
<link rel="stylesheet" href="css/estilobasico.css">
<meta charset="utf-8">
<title>Registro de cuentas</title>
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
		width: 99%;
	}
	.mitad {
		width: 47%;
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
   
	<li><a href='index.jsp'><div class='barra'></div><p class='menu'>Pagina Principal</p></a></li>
  </ul>
  </aside>
  <nav>
  <ul class="stroke">Bienvenido a registro</ul>
	<center>
	<form name="formMatricula" action="registro" method="get">
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
				<td>Género:</td>
				<td><select name="genero" class="todo">
						<option value="masculino">Masculino</option>
						<option value="femenino">Femenino</option>
				</select></td>
			</tr>
			<tr>
				<td>Nacimiento:</td>
				<td><input type="text" name="nacimiento" id="datepicker" required></td>
			</tr>
			
			<tr>
				<td>Nivel/grado:</td>
				<td><select name="nivel" id="primary" class="mitad">
						<option value="inicial">inicial</option>
						<option value="primaria">primaria</option>
						<option value="secundaria">secundaria</option>
						<option value="preu">pre-u</option>
				</select>
				<select name="grado" id="secondary" class="mitad">
					</select>
				</td>
			</tr>
			<tr>
				<td>DNI:</td>
				<td><input type="text" name="dni" required></td>
			</tr>
			<tr>
				<td>Grupo sanguíneo:</td>
				<td>
					<select name="grupoSanguineo" class="mitad">
						<option value"o">O</option>
						<option value="a">A</option>
						<option value="b">B</option>
						<option value="ab">AB</option>
					</select> 
					<select name="factorRH" class="mitad">
						<option value="frh">factor RH</option>
						<option value="+">+</option>
						<option value="-">-</option>
					</select>
				</td>

			</tr>
			<tr>
				<td colspan="2" align="center">LUGAR DE ORIGEN<td>
			</tr>
			<tr>
				<td>Nacionalidad:</td>
				<td><input type="text" name="nacionalidad" required></td>
			</tr>
			<tr>
				<td>Departamento:</td>
				<td><input type="text" name="departamento" required></td>
			</tr>
			<tr>
				<td colspan="2" align="center">RADICA EN<td>
			</tr>
			<tr>
				<td>Provincia:</td>
				<td><input type="text" name="provincia" required></td>
			</tr>
			<tr>
				<td>Distrito:</td>
				<td><input type="text" name="distrito" required></td>
			</tr>
			<tr>
				<td>Dirección:</td>
				<td><input type="text" name="direccion" required></td>
			</tr>
			<tr>
				<td colspan="2" align="center">DATOS ADICIONALES<td>
			</tr>
			<tr>
				<td>Correo electrónico:</td>
					<td><input type="text" name="email"></a>
				</td>
			</tr>
			<tr>
				<td>Celular:</td>
					<td><input type="text" name="celular">
				</td>
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
	</center>
	<!--@Persistent private String nombres;
	@Persistent private String apellidos;
	@Persistent private String genero;
	@Persistent private String nacimiento;
	@Persistent private String email;
	@Persistent private String nivel;
	@Persistent private String grado;
	@Persistent private String dni;
	@Persistent private String grupoSanguineo;
	@Persistent private String origNacionalidad;
	@Persistent private String origDepartamento;
	@Persistent private String provincia;
	@Persistent private String distrito;
	@Persistent private String direccion;
	@Persistent private String celular; -->
 </nav>
</body>
</html>