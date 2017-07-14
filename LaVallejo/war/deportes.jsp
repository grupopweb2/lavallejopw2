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

</head>
<body>


<header>
   <h1>La Vallejo</h1>
</header>
  
<aside>
   <ul class="navbar">
	<% if (userLogin != null) { %>
	<li><div></div><p class='menu'><b>HOLA <%=userLogin.getNombre().toUpperCase()%></b></p></li>
	<% } else { %>
	<li><a href="gmailSesion?site=deportes&nivel=1"><div class='barra'></div><p class='menu'>Acceder</p></a></li>
	<% } %>
	<li><a href='index'><div class='barra'></div><p class='menu'>Pagina Principal</p></a></li>
  	<% if (userLogin != null) { %>
	<li><a href='cerrarSesion'><div class='barra'></div><p class='menu'>Cerrar Sesión</p></a></li>
	<% } %>
  </ul>
  </aside>
 <nav>
<ul class="stroke">Deportes La Vallejo </ul>
<fieldset><legend>Atletismo</legend>

  <p class="parrafo">
  <p>El atletismo es considerado el deporte organizado más antiguo del mundo, abarca numerosas disciplinas agrupadas en carreras,</p>
  <p>saltos, lanzamientos, pruebas combinadas y marcha.</p>
  <p>El atletismo es el arte de superar el rendimiento de los adversarios en velocidad o en resistencia llamado también fondo,en </p>
  <p>distancia o en mayor altura. El número de pruebas, y los tipos ya sean individuales o en grupos, ha variado con el paso  del</p>
  <p>tiempo. El atletismo es uno de los pocos deportes practicados universalmente, ya sea entre aficionados o en competiciones de</p>
  <p>todos los niveles. La simplicidad y los pocos medios necesarios para su práctica explican este éxito.</p>
  </p>
</fieldset>

<fieldset><legend>Natación</legend>
<p class="parrafo">
  <p>La natación es el movimiento y el desplazamiento a través del agua mediante el uso de las extremidades corporales y  por  lo</p>
  <p>general sin utilizar ningún instrumento o apoyo  para  avanzar, generalmente la natación se hace  para  recreación, deporte,</p>
  <p>ejercicio o supervivencia. Los seres  humanos pueden   contener la respiración bajo el agua y  realizar  natación locomotora</p>
  <p>rudimentaria, esto se puede hacer semanas después del nacimiento como una respuesta evolutiva </p>
  </p>
</fieldset>


<fieldset><legend>Judo</legend>
<p class="parrafo">
  <p>Es un arte marcial y deporte de combate de origen japonés.</p>
  <p>Los practicantes de este arte marcial son denominados «judokas»</p>
  <p>El judo es un deporte de lucha de práctica individual, con actividad directa, recíproca y agonista.  Se lleva a cabo en  un </p>
  <p>terreno delimitado y estabilizado, en el que lo único que cambia es el comportamiento de los judokas.
  <p>Con respecto a los deportes agresivos y violentos, se considera violento todo aquel deporte que en su práctica  requiere la </p>
  <p>ejecución de actos físicos  realizados con violencia, como por  ejemplo, golpear  un balón, golpear  una pelota con raqueta,</p>
  <p>entre otras; siendo esta una característica del deporte en sí. El judo podría ser considerado un deporte violento, ya que la</p>
  <p>ejecución de las diversas técnicas requiere de un esfuerzo físico importante. Se considera agresivo todo aquel  deporte  que</p>
  <p>en su práctica tiende a una voluntad de dañar al oponente. El judo no se considera un deporte  agresivo ya que la  intención</p>
  <p>no es la de dañar al contrario.<p>
  </p>
</fieldset>

<fieldset><legend>Danza</legend>
<p class="parrafo">
  <p>La danza o el baile es un arte donde se utiliza el movimiento del cuerpo usualmente con música, como una forma de expresión,</p>
  <p>de interacción social, con fines de entretenimiento, artísticos o religiosos. Es el movimiento en el espacio que se realiza </p>
  <p>con una parte o todo el cuerpo del ejecutante, con cierto compás o ritmo como expresión de sentimientos individuales, o  de </p>
  <p>símbolos de la cultura y la sociedad.</p>
  </p>
</fieldset>

<fieldset><legend>Ajedrez</legend>
<p class="parrafo">
  <p>El ajedrez es un juego, entre dos  personas, cada una de las  cuales dispone  de 16 piezas móviles  que se colocan sobre un </p>
  <p>tablero dividido en 64 escaques.1 En su versión de competición2 está considerado como un deporte.</p>

  <p>Originalmente inventado como un juego  para personas, a partir  de la creación de computadoras y  programas comerciales  de </p>
  <p>ajedrez, una partida de ajedrez puede ser jugada también por una persona contra un  programa de ajedrez o por dos programas </p>
  <p>de ajedrez entre sí.
  </p>
  </p>
</fieldset>

<fieldset><legend>Oratoria</legend>
<p class="parrafo">
Se llama oratoria al arte de hablar con elocuencia.1 En segundo lugar, es también un género literario formado por el discurso,
la arenga, la disertación, el sermón, el panegírico, entre otras varias.
Este segundo sentido más amplio se aplica a todos  los procesos literarios que  están planteados o  expresados con  la  misma 
finalidad y con propósito persuasivo. Esta  finalidad de  persuadir al destinatario  es la que diferencia la oratoria de otros
procesos comunicativos orales. Del mismo modo que la finalidad de la didáctica es enseñar y la de la poética deleitar, lo  que 
pretende la oratoria es convencer de algo.
</p>
</fieldset>
</nav>
</body>
</html>
