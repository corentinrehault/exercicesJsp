/*
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 5 : Interroger une base de données
#	 
#	Fichier : DBConnexion.java
#	Class : DBConnexion
#	Package : Exercices.Ch5
*/

package Exercices.Ch5 ;
import java.io.Serializable ;
import java.sql.*;
 
public class DBConnexion implements java.io.Serializable {
	
	//Définition des propriétés
	private String login;
	private String password ;
	private String hostname;
	private String port;
	private String nomDeLaBase;
	private Connection cnx;
	
	// Methodes d'acces en écriture
	public void setLogin (String valeur) {
		login = valeur ;
	}
	
	public void setPassword (String valeur) {
		password = valeur ;
	}
	
	public void setHostname (String valeur) {
		hostname = valeur ;
	}
		
	public void setPort (String valeur) {
		port = valeur ;
	}
	
	public void setNomDeLaBase (String valeur) {
		nomDeLaBase = valeur ;
	}	
	
	// Methodes d'acces en lecture
	public Connection getCnx() {
		if (etablirConnexion()) {
			return cnx;	
		} else {
			return null;
		}
	}	
	
	// Méthodes invisibles (métier)
	private String construireUrlJdbc() {
		String urlJdbc ;
		urlJdbc = "jdbc:mysql://"+hostname+":" + port + "/" + nomDeLaBase ;
		urlJdbc = urlJdbc + "?user=" + login + "&password=" + password ;
		return urlJdbc ;
	}
	
	private boolean etablirConnexion() {
		boolean statusConnexion = false;
		String urlJdbc ;
		try { 
			Class.forName("com.mysql.jdbc.Driver");
			urlJdbc=construireUrlJdbc();
			cnx=DriverManager.getConnection(urlJdbc);
			statusConnexion = true;
		} catch ( Exception e ) {
			statusConnexion = false;
			System.out.println(e);
		}
		return statusConnexion;
	}
	
}
