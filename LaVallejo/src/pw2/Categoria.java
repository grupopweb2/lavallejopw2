package pw2;

import java.util.*;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

@PersistenceCapable
public class Categoria {
	@Persistent
	private boolean admi;
	@Persistent
	private String rol;
	@Persistent
	private ArrayList<String> profesor = new ArrayList<String>();
	@Persistent
	private ArrayList<String> padre = new ArrayList<String>();
	@Persistent
	private ArrayList<String> alumno = new ArrayList<String>();
	@Persistent
	private ArrayList<String> particular = new ArrayList<String>();
	@Persistent
	private HashMap<String, ArrayList<String>> roles = new HashMap<String, ArrayList<String>>();
	
	public Categoria(String rol, boolean isAdmi) {
		this.rol = rol;
		this.admi = isAdmi;
		
		padre.add("organigrama.jsp");
		roles.put("padre", padre);
		
		alumno.add("organigrama.jsp");
		roles.put("alumno", alumno);
		
		particular.add("organigrama.jsp");
		roles.put("particular", particular);
		
		profesor.add("organigrama.jsp");
		roles.put("profesor", profesor);
	}
	
	public String getRol() {
		return rol;
	}
	
	public void setRol(String rol) {
		this.rol = rol;
	}
	
	public boolean tienePermiso(String site) {
		return admi || roles.get(rol).contains("site");
	}
	
}
