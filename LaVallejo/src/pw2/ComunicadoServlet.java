package pw2;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.TimeZone;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class ComunicadoServlet extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		
		UserService us = UserServiceFactory.getUserService();
		User user = us.getCurrentUser();
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		if(user == null){
			
			if (req.getParameter("action") == null) {
				getServletContext().setAttribute("message", null);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/menucomunicado.jsp");
				dispatcher.forward(req, resp);
				
			} else if (req.getParameter("action").equals("mostrar")) {
				String busqueda = "select from "+Comunicado.class.getName();
				List<Comunicado> result = (List<Comunicado>)pm.newQuery(busqueda).execute();
				getServletContext().setAttribute("listado", result);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/listadocomunicado.jsp");
				dispatcher.forward(req, resp);
			
			} else if (req.getParameter("action").equals("buscar")) {
				String busqueda = "select from "+Comunicado.class.getName()
						+" where "+req.getParameter("busqueda")+
						"=='"+req.getParameter("data")+"'";
				List<Comunicado> result = (List<Comunicado>)pm.newQuery(busqueda).execute();
				getServletContext().setAttribute("listado", result);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/listadocomunicado.jsp");
				dispatcher.forward(req, resp);
			
			} else {
				getServletContext().setAttribute("message", "Operacion no permitida o no reconocida");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/menucomunicado.jsp");
				dispatcher.forward(req, resp);
			}
			System.out.println("aqui varado :v");
		
		} else {
			
			String query = "select from " + Persona.class.getName()+" where email=='"+user.getEmail()+"'";
			List<Persona> personas = (List<Persona>) pm.newQuery(query).execute();
			
			if (personas.isEmpty()) {
				getServletContext().setAttribute("message", "Usted solo podra visualizar, mas no podrá interactuar en la web.");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/menucomunicado.jsp");
				dispatcher.forward(req, resp);
				
			} else {
				
				if (req.getParameter("action") == null) {
					getServletContext().setAttribute("message", null);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/menucomunicado.jsp");
					dispatcher.forward(req, resp);
					
				} else if (req.getParameter("action").equals("buscar")) {
					String busqueda = "select from "+Comunicado.class.getName()
							+" where "+req.getParameter("busqueda")+
							"=='"+req.getParameter("data")+"'";
					List<Persona> result = (List<Persona>)pm.newQuery(busqueda).execute();
					getServletContext().setAttribute("listado", result);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/listadocomunicado.jsp");
					dispatcher.forward(req, resp);
				
				} else if (req.getParameter("action").equals("eliminar") && (personas.get(0).isAdmin() || 
							personas.get(0).getCategoria().equals("docente") ||
							personas.get(0).getCategoria().equals("personal"))) {
					
					String busqueda = "select from "+Comunicado.class.getName()
							+" where idComunicado=='"+
							req.getParameter("id")+"'";
					final Query q = pm.newQuery(busqueda);
					q.deletePersistentAll();
					getServletContext().setAttribute("message", "Comunicado eliminado correctamente");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/menucomunicado.jsp");
					dispatcher.forward(req, resp);
				
				} else if (req.getParameter("action").equals("mostrar")) {
					String busqueda = "select from "+Comunicado.class.getName();
					List<Comunicado> result = (List<Comunicado>)pm.newQuery(busqueda).execute();
					getServletContext().setAttribute("listado", result);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/listadocomunicado.jsp");
					dispatcher.forward(req, resp);
				
				} else {
					getServletContext().setAttribute("message", "Operacion no permitida o no reconocida");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/menucomunicado.jsp");
					dispatcher.forward(req, resp);
				}

			} 

		}
	}
	
	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		
		UserService us = UserServiceFactory.getUserService();
		User user = us.getCurrentUser();

		if(user == null){
			getServletContext().setAttribute("message", "Usted solo podra visualizar, mas no podrá interactuar en la web.");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/menucomunicado.jsp");
			dispatcher.forward(req, resp);
			
		} else {
			PersistenceManager pm = PMF.get().getPersistenceManager();
			String query = "select from " + Persona.class.getName()+" where email=='"+user.getEmail()+"'";
			List<Persona> personas = (List<Persona>) pm.newQuery(query).execute();
			
			if (personas.isEmpty()) {
				getServletContext().setAttribute("message", "Usted solo podra visualizar, mas no podrá interactuar en la web.");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/menucomunicado.jsp");
				dispatcher.forward(req, resp);
				
			} else if (personas.get(0).isAdmin()) {
				if (req.getParameter("action") == null) {
					getServletContext().setAttribute("message", null);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/menualumno.jsp");
					dispatcher.forward(req, resp);

				} else if (req.getParameter("action").equals("registrar")) {
					
					String nombre = req.getParameter("nombre");
					String asunto = req.getParameter("asunto");
					String email = req.getParameter("email");
					Calendar date = new GregorianCalendar();
					DecimalFormat df = new DecimalFormat("00");
					int hora = date.get(Calendar.HOUR_OF_DAY);
					String midDay = (hora+24-5)%24<12?"am":"pm";
					String fecha = df.format(date.get(Calendar.DAY_OF_MONTH))+"/"+
									df.format(date.get(Calendar.MONTH)+1)+"/"+
									date.get(Calendar.YEAR)+" "+
									df.format((hora+12-5)%12)
									+":"+df.format(date.get(Calendar.MINUTE))+" "+midDay;
					String mensaje = req.getParameter("mensaje");
					
					Comunicado c = new Comunicado(nombre, asunto, email, fecha, mensaje);
					
					try {
						pm.makePersistent(c);
						System.out.println("Se publico correctamente el comunicado");
						getServletContext().setAttribute("message", "Comunicado publicado correctamente");
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/menucomunicado.jsp");
						dispatcher.forward(req, resp);
					} catch (Exception e) {
						getServletContext().setAttribute("message", "No se publico el comunicado correctamente");
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/menucomunicado.jsp");
						dispatcher.forward(req, resp);
					}
					
				}

			} else {
				getServletContext().setAttribute("message", "Operacion no permitida o no reconocida");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/menucomunicado.jsp");
				dispatcher.forward(req, resp);
			}

		}
		
	}


}
