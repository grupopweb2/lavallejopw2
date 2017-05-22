package pw2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class CerrarSesionServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		UserService us = UserServiceFactory.getUserService();
		User user = us.getCurrentUser();
		us.createLogoutURL(req.getRequestURI());
		resp.sendRedirect("index.html");
	}
}
