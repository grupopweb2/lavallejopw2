package pw2;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class EliminarTodoServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		resp.setContentType("text/plain");		
		final PersistenceManager pm = PMF.get().getPersistenceManager();

		final Query q = pm.newQuery(Persona.class);
		//final Query qc = pm.newQuery(Curso.class);
		try{
			//qc.deletePersistentAll();
			q.deletePersistentAll();
			resp.getWriter().println("Se han borrado personas.");
			resp.sendRedirect("/index.jsp");
		}catch(Exception e){
			System.out.println(e);
			resp.getWriter().println("No se han podido borrar datos.");
			resp.sendRedirect("/index.jsp");
		}finally{
			q.closeAll();
			pm.close();
		}				
	}
}
