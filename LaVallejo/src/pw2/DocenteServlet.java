package pw2;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class DocenteServlet extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		
		UserService us = UserServiceFactory.getUserService();
		User user = us.getCurrentUser();
		
		if(user == null){
			resp.setContentType("text/html");
			resp.getWriter().println("<CENTER><h1>USTED DEBE <a href='gmailSesion'>LOGEARSE</a>"
					+ " ANTES, PARA PODER ACCEDER A ESTE SITIO </h1>");
			resp.getWriter().println("<h2>(Dependiendo de su categoria y sus permisos)</h2>");
			resp.getWriter().println("<h3><a href='index'>Regresar</a></h3></CENTER>");
		}else{
			PersistenceManager pm = PMF.get().getPersistenceManager();
			String query = "select from " + Persona.class.getName()+" where email=='"+user.getEmail()+"'";
			List<Persona> personas = (List<Persona>) pm.newQuery(query).execute();
			if (personas.isEmpty()) {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/prelogin.jsp");
				dispatcher.forward(req, resp);
			} else if (personas.get(0).isAdmin()) {
				if (req.getParameter("action") == null) {
					getServletContext().setAttribute("message", null);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/menudocente.jsp");
					dispatcher.forward(req, resp);
				} else if (req.getParameter("action").equals("buscar")) {
					String busqueda = "select from "+Persona.class.getName()
							+" where categoria=='docente' && "+req.getParameter("busqueda")+
							"=='"+req.getParameter("data")+"'";
					List<Persona> result = (List<Persona>)pm.newQuery(busqueda).execute();
					getServletContext().setAttribute("listado", result);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/listadodocente.jsp");
					dispatcher.forward(req, resp);
				} else if (req.getParameter("action").equals("eliminar")) {
					String busqueda = "select from "+Persona.class.getName()
							+" where categoria=='docente' && idPersona=='"+
							req.getParameter("id")+"'";
					final Query q = pm.newQuery(busqueda);
					q.deletePersistentAll();
					getServletContext().setAttribute("message", "Docente eliminado correctamente");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/menudocente.jsp");
					dispatcher.forward(req, resp);
				} else if (req.getParameter("action").equals("mostrar")) {
					String busqueda = "select from "+Persona.class.getName()
							+" where categoria=='docente'";
					List<Persona> result = (List<Persona>)pm.newQuery(busqueda).execute();
					getServletContext().setAttribute("listado", result);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/listadodocente.jsp");
					dispatcher.forward(req, resp);
				}

			} else {
				getServletContext().setAttribute("userLogin", personas.get(0));
				resp.setContentType("text/html");
				resp.getWriter().println("<CENTER><h1>USTED NO TIENE PERMISO PARA ESTE SITIO</h1>");
				resp.getWriter().println("<h3><a href='index'>Regresar</a></h3></CENTER>");
			}

		}
	}
	
	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		
		UserService us = UserServiceFactory.getUserService();
		User user = us.getCurrentUser();

		if(user == null){
			resp.setContentType("text/html");
			resp.getWriter().println("<CENTER><h1>USTED DEBE <a href='gmailSesion'>LOGEARSE</a>"
					+ " ANTES, PARA PODER ACCEDER A ESTE SITIO </h1>");
			resp.getWriter().println("<h2>(Dependiendo de su categoria y sus permisos)</h2>");
			resp.getWriter().println("<h3><a href='index'>Regresar</a></h3></CENTER>");
		}else{
			PersistenceManager pm = PMF.get().getPersistenceManager();
			String query = "select from " + Persona.class.getName()+" where email=='"+user.getEmail()+"'";
			List<Persona> personas = (List<Persona>) pm.newQuery(query).execute();
			if (personas.isEmpty()) {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/prelogin.jsp");
				dispatcher.forward(req, resp);
			} else if (personas.get(0).isAdmin()) {
				if (req.getParameter("action") == null) {
					getServletContext().setAttribute("message", null);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/menudocente.jsp");
					dispatcher.forward(req, resp);

				} else if (req.getParameter("action").equals("registrar")) {


					String nombre = req.getParameter("nombre");
					String apellido = req.getParameter("apellido");
					String sexo = req.getParameter("sexo");
					String direccion = req.getParameter("direccion");
					String email = req.getParameter("email");
					String nacimiento = req.getParameter("nacimiento");
					String categoria = req.getParameter("categoria");
					String dni = req.getParameter("dni");
					boolean admi = req.getParameter("admi")!=null? true:false;
					
					String queryAux = "select from " + Persona.class.getName()+" where email=='"+email+"'";
					List<Persona> result = (List<Persona>) pm.newQuery(queryAux).execute();
					if (result.isEmpty()) {
						try{
							Persona p = new Persona(nombre, apellido, sexo, direccion, email, nacimiento, categoria, dni, true, admi);
							try{
								pm.makePersistent(p);
								System.out.println("se guardo correctamente");
								getServletContext().setAttribute("message", "se guardó docente correctamente");
								RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/menudocente.jsp");
								dispatcher.forward(req, resp);
							}catch(Exception e){
								getServletContext().setAttribute("message", "Ocurrio un error al enviar el formulario");
								RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/menudocente.jsp");
								dispatcher.forward(req, resp);
							}
						}catch(Exception e){
							System.out.println(e);
						}

					} else {
						getServletContext().setAttribute("message", "El docente ya se registro con anterioridad");
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/menualumno.jsp");
						dispatcher.forward(req, resp);
					}
					
					
					
				}

			} else {
				getServletContext().setAttribute("userLogin", personas.get(0));
				resp.setContentType("text/html");
				resp.getWriter().println("<CENTER><h1>USTED NO TIENE PERMISO PARA ESTE SITIO</h1>");
				resp.getWriter().println("<h3><a href='index'>Regresar</a></h3></CENTER>");
			}

		}
		
	}


}