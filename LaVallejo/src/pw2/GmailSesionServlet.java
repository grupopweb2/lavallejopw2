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
		resp.setContentType("text/html");

		PrintWriter out = resp.getWriter();

		UserService us = UserServiceFactory.getUserService();
		User user = us.getCurrentUser();
		
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String query = "select from " + Persona.class.getName();
		
		List<Persona> personas = (List<Persona>) pm.newQuery(query).execute();
		
		
		
		
		if(user == null){
			resp.sendRedirect(us.createLoginURL(req.getRequestURI()));
		}else{
			System.out.println("busqueda del gmail servelt");
			for(Persona p: personas) {
				if (user.getEmail().equalsIgnoreCase(p.getEmail())) {
					req.setAttribute("login", p);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
					dispatcher.forward(req, resp);
					return;
				}
			}
			System.out.println("no encontro gmail");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/prelogin.html");
			dispatcher.forward(req, resp);
			
		}
	}
}