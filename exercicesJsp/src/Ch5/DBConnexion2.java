package Ch5;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


public class DBConnexion2 implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1032046682160891639L;
	
	private String login;
	private String password;
	private String hostName;
	private String port;
	private String databaseName;
	private Connection cnx;
	private Statement lien = null;
	/**
	 * @param login the login to set
	 */
	public void setLogin(String login) {
		this.login = login;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @param hostName the hostName to set
	 */
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	/**
	 * @param port the port to set
	 */
	public void setPort(String port) {
		this.port = port;
	}
	/**
	 * @param databaseName the databaseName to set
	 */
	public void setDatabaseName(String databaseName) {
		this.databaseName = databaseName;
	}
	/**
	 * @param cnx the cnx to set
	 */
	public void setCnx(Connection cnx) {
		this.cnx = cnx;
	}
	/**
	 * @return the cnx
	 */
	public Connection getCnx() {
		if (etablirConnexion()) {
			return cnx;
		} else {
			return null;
		}

	}
	/**
	 * @return
	 * @throws SQLException 
	 */
	private boolean etablirConnexion() {
		boolean statusConnexion = false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String urlJdbc = construireUrlJdbc();
			cnx = DriverManager.getConnection(urlJdbc);
			statusConnexion = true;
		} catch (Exception e) {
			statusConnexion = false;
			System.out.println(e);
		}
		return statusConnexion;

	}
	/**
	 * @return
	 */
	private String construireUrlJdbc() {
		String urlJdbc = "jdbc:mysql://" + hostName + ":" + port + "/" + databaseName + 
				"?user=" + login + "&password=" + password;
		return urlJdbc;
	}
	/**
	 * @return the lien
	 */
	public Statement getLien(Connection cnx) {
		if (construireStatement(cnx)){
			return lien;
		} else {
			return null;
		}
	}
	/**
	 * @param cnx
	 * @return
	 */
	private boolean construireStatement(Connection cnx) {
		boolean statusStatement = false;
		try {
			lien = cnx.createStatement();
			statusStatement = true;
		} catch (Exception e) {
			statusStatement = false;
			System.out.println(e);
		}
		return statusStatement;
	}

}