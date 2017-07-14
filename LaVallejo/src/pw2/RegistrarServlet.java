package pw2;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class RegistrarServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		String nombre = req.getParameter("nombre");
		String apellido = req.getParameter("apellido");
		String sexo = req.getParameter("sexo");
		String direccion = req.getParameter("direccion");
		String email = req.getParameter("email");
		String nacimiento = req.getParameter("nacimiento");
		String categoria = req.getParameter("categoria");
		System.out.println("Categoria: "+categoria);
		String dni = req.getParameter("dni");
		boolean admi = req.getParameter("admi")!=null? true:false;
		
		final PersistenceManager pm = PMF.get().getPersistenceManager();
		String query = "select from " + Persona.class.getName()+" where email=='"+email+"'";
		List<Persona> personas = (List<Persona>) pm.newQuery(query).execute();
		if (personas.isEmpty()) {
			try{
				Persona p = new Persona(nombre, apellido, sexo, direccion, email, nacimiento, categoria, dni, true, admi);
				try{
					pm.makePersistent(p);
					System.out.println("se guardo correctamente");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("index");
					dispatcher.forward(req, resp);
				}catch(Exception e){
					System.out.println(e);
					System.out.println("Ocurrio un error, vuelva a intentarlo.");
					resp.sendRedirect("index");
				}
			}catch(Exception e){
				System.out.println(e);
			}finally{
				pm.close();
			}

		} else {
			resp.setContentType("text/html");
			resp.getWriter().println("<!DOCTYPE html><html><head><title>ERROR AL REGISTRAR</title></head>");
			resp.getWriter().println("<body><center><h1>Usted ya esta registrado, si se trata de un error debera "
					+ "comunicarse con el director o algun administrador para solucionar su situacion</h1><br><h3>");
			resp.getWriter().println("<a href='index'>Regresar</a></h3></center></body></html>");
		}
	}
}
