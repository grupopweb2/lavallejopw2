package pw2;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class GmailSesionServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		
		UserService us = UserServiceFactory.getUserService();
		User user = us.getCurrentUser();
		
		if(user == null){
			resp.sendRedirect(us.createLoginURL(req.getRequestURI()));
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
}