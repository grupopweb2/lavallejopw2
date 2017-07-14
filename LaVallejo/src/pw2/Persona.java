package pw2;
import java.util.ArrayList;
import java.util.List;

import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.datanucleus.annotations.Unowned;


@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Persona {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key idPersona;
	
	@Persistent
	private String nombre;
	
	@Persistent
	private String apellido;
	
	@Persistent
	private String sexo;
	
	@Persistent
	private String direccion;
	
	@Persistent
	private String email;
	
	@Persistent
	private String nacimiento;
	
	@Persistent
	private String categoria;
	
	@Persistent
	private String dni;
	
	@Persistent
	private boolean activo;
	
	@Persistent
	private boolean admin;
	

	public Persona(String nombre, String apellido,String sexo, String direccion, String email, 
			String nacimiento, String categoria, String dni, boolean activo, boolean isAdmin) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.sexo = sexo;
		this.direccion = direccion;
		this.email = email;
		this.nacimiento = nacimiento;
		this.categoria = categoria;
		this.dni = dni;
		this.activo = activo;
		this.admin = isAdmin;
	}

	public String getIdPersona() {
		return KeyFactory.keyToString(idPersona);
	}

	public void setIdAlumno(String idPersona) {
		Key keyPersona = KeyFactory.stringToKey(idPersona);
		this.idPersona = KeyFactory.createKey(keyPersona,
		Persona.class.getSimpleName(), java.util.UUID.randomUUID().toString());
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	
	public String getSexo() {
		return sexo;
	}
	
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String rol) {
		this.categoria = rol;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

}