<%@ page import="java.util.Calendar"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>

<jsp:useBean id="dbcnx" class="Ch5.DBConnexion2"></jsp:useBean>
<jsp:setProperty property="login" name="dbcnx" value="userjsp" />
<jsp:setProperty property="password" name="dbcnx" value="userjsp" />
<jsp:setProperty property="hostName" name="dbcnx" value="localhost" />
<jsp:setProperty property="port" name="dbcnx" value="3306" />
<jsp:setProperty property="databaseName" name="dbcnx" value="livrejsp" />

<html>
<head>
<meta charset="UTF-8" />
<title>Réserver un livre</title>
</head>
<body>

	<jsp:useBean id="emprunt" class="Ch5.Emprunt2"></jsp:useBean>
	<jsp:setProperty property="codeLivre" name="emprunt" />
	<jsp:setProperty property="numLecteur" name="emprunt" />

	<%
		Calendar maintenant = Calendar.getInstance();
		emprunt.setDateEmprunt(maintenant);
		Connection cnx = dbcnx.getCnx();
		Statement lien = dbcnx.getLien(cnx);
		String reservation = "insert into emprunts (EMP_Numero, EMP_Date, EMP_DateRetour, EMP_CodeLivre, EMP_NumLecteur) values ('"
				+ emprunt.getNumEmprunt()
				+ "','"
				+ emprunt.getDateEmprunt()
				+ "','"
				+ emprunt.getDateRetour()
				+ "','"
				+ emprunt.getCodeLivre()
				+ "','" + emprunt.getNumLecteur() + "')";
		lien.executeUpdate(reservation);
		String livreReserve = "update livres set LIV_DejaReserve=true where LIV_CodeLivre='" + emprunt.getCodeLivre() + "'";
		lien.executeUpdate(livreReserve);
	%>

	<h1>Confirmation de votre réservation</h1>
	Votre réservation porte le numéro :
	<jsp:getProperty property="numEmprunt" name="emprunt" />
	<br> Date de la réservation :
	<jsp:getProperty property="dateEmprunt" name="emprunt" />
	<br> Date du retour :
	<jsp:getProperty property="dateRetour" name="emprunt" />
	<br>
	<br> Vous pouvez revenir à votre profil en cliquant
	<a href="gestionLecteur2.jsp">ici</a>.
</body>
</html>