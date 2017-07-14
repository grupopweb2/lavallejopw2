package pw2;

import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.datanucleus.annotations.Unowned;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Comunicado {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key idComunicado;
	
	@Persistent
	private String nombre;
	
	@Persistent
	private String asunto;
	
	@Persistent
	private String email;
	
	@Persistent
	private String fecha;
	
	@Persistent
	private String mensaje;
	
	public Comunicado(String nombre, String asunto,String email, String fecha, String mensaje) {
		this.nombre = nombre;
		this.asunto = asunto;
		this.email = email;
		this.fecha = fecha;
		this.mensaje = mensaje;
		
	}

	public String getIdComunicado() {
		return KeyFactory.keyToString(idComunicado);
	}

	public void setIdComunicado(String idComunicado) {
		Key keyComunicado = KeyFactory.stringToKey(idComunicado);
		this.idComunicado = KeyFactory.createKey(keyComunicado,
		Comunicado.class.getSimpleName(), java.util.UUID.randomUUID().toString());
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getAsunto() {
		return asunto;
	}

	public void setAsunto(String asunto) {
		this.asunto = asunto;
	}
	
	public String getFecha() {
		return fecha;
	}
	
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}