package pw2;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
// 3
import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// 6
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
// 3
@SuppressWarnings("serial")
public class IndexServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		
		UserService us = UserServiceFactory.getUserService();
		User user = us.getCurrentUser();
		
		if(user == null){
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/index.html");
			dispatcher.forward(req, resp);
		}else{ 

			PersistenceManager pm = PMF.get().getPersistenceManager();
			String query = "select from " + Persona.class.getName()+" where email=='"+user.getEmail()+"'";
			List<Persona> personas = (List<Persona>) pm.newQuery(query).execute();
			if (personas.isEmpty()) {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/prelogin.jsp");
				dispatcher.forward(req, resp);
			} else {
				getServletContext().setAttribute("userLogin", personas.get(0));
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/index.jsp");
				dispatcher.forward(req, resp);
			}
		}
	}
	
	public void init() throws ServletException {
		final PersistenceManager pm = PMF.get().getPersistenceManager();
		String query = "select from " + Persona.class.getName()+" where email=='rescobedo@episunsa.edu.pe'";
		List<Persona> search = (List<Persona>) pm.newQuery(query).execute();
		if (search.isEmpty()) {
			Persona p = new Persona("Richart", "Escobedo", "M", "LA EPIS", "rescobedo@episunsa.edu.pe", "01/01/1990", "particular", "12398745", true, true);
			pm.makePersistent(p);
		}
		
		query = "select from " + Persona.class.getName()+" where email=='walthersantosqch@gmail.com'";
		search = (List<Persona>) pm.newQuery(query).execute();
		if (search.isEmpty()) {
			Persona p = new Persona("Walther", "Santos", "M", "LA EPIS", "walthersantosqch@gmail.com", "01/01/1990", "particular", "96382147", true, true);
			pm.makePersistent(p);
		}
		
		query = "select from " + Persona.class.getName()+" where email=='richarteq@gmail.com'";
		search = (List<Persona>) pm.newQuery(query).execute();
		if (search.isEmpty()) {
			Persona p = new Persona("Richart", "Escobedo", "M", "LA EPIS", "richarteq@gmail.com", "01/01/1990", "particular", "12398745", true, true);
			pm.makePersistent(p);
		}
		
		query = "select from " + Persona.class.getName()+" where email=='sagitario2095@gmail.com'";
		search = (List<Persona>) pm.newQuery(query).execute();
		if (search.isEmpty()) {
			Persona p = new Persona("Sindy", "Aucahuaqui", "F", "LA EPIS", "sagitario2095@gmail.com", "01/01/1990", "particular", "85239674", true, true);
			pm.makePersistent(p);
		}
		
		query = "select from " + Persona.class.getName()+" where email=='angelapuma18@gmail.com'";
		search = (List<Persona>) pm.newQuery(query).execute();
		if (search.isEmpty()) {
			Persona p = new Persona("Angela", "Puma", "F", "LA EPIS", "angelapuma18@gmail.com", "01/01/1990", "particular", "12398745", true, true);
			pm.makePersistent(p);
		}
		
	}
}