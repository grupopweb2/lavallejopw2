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
public class IndexServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		
		// recogiendo el usuario logeado
		UserService us = UserServiceFactory.getUserService();
		User user = us.getCurrentUser();
		/////////////////////////////////
		
		if(user == null){
			resp.sendRedirect("index.html");
		}else{  //buscar y comprobar si el usuario esta registrado en la app

			// exraccion de la lista de personas registrados:
			PersistenceManager pm = PMF.get().getPersistenceManager();
			String query = "select from " + Persona.class.getName();
			List<Persona> personas = (List<Persona>) pm.newQuery(query).execute();
			//////
			System.out.println("busqueda correcta index servlet");
			for(Persona p: personas) {
				if (user.getEmail().equalsIgnoreCase(p.getEmail())) {
					req.setAttribute("alumnologgin", p);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
					dispatcher.forward(req, resp);
					return;
				}
			}
			System.out.println("no encontro index");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.html");
			dispatcher.forward(req, resp);


		}
	}
}