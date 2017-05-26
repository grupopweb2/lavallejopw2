package pw2;

import java.io.IOException;
import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

@SuppressWarnings("serial")
public class RegistrarServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/plain");
		
		String nombre = req.getParameter("nombre");
		String apellido = req.getParameter("apellido");
		String genero = req.getParameter("genero");
		String direccion = req.getParameter("direccion");
		String email = req.getParameter("email");
		String nacimiento = req.getParameter("nacimiento");
		String categoria = req.getParameter("categoria");
		String dni = req.getParameter("dni");
		boolean admi = req.getParameter("admi")!=null? true:false;;
		System.out.println("admi: "+admi);
				 
		final PersistenceManager pm = PMF.get().getPersistenceManager();		
		
		try{
			Key key;
			Persona p = new Persona(nombre, apellido, direccion, email, categoria, dni, true, admi);
			try{
				pm.makePersistent(p);
				req.setAttribute("login", p);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
				dispatcher.forward(req, resp);
			}catch(Exception e){
				System.out.println(e);
				System.out.println("Ocurrio un error, vuelva a intentarlo.");
				resp.sendRedirect("index.html");
			}
		}catch(Exception e){
			System.out.println(e);
		}finally{
			pm.close();
		}
		
	}
}
