package pw2;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class RedireccionarServlet extends HttpServlet {
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
				getServletContext().setAttribute("userLogin", personas.get(0));
				getServletContext().setAttribute("message", null);
				if (req.getParameter("site").equals("menualumno")) {
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/menualumno.jsp");
					dispatcher.forward(req, resp);		
				} else if (req.getParameter("site").equals("menudocente")) {
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/menudocente.jsp");
					dispatcher.forward(req, resp);		
				} else if (req.getParameter("site").equals("registraradmin")) {
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/registraradmin.jsp");
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
	
}
