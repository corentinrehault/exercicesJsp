<%@ page import="java.util.Calendar"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>

<jsp:useBean id="dbcnx" class="Ch6.DBConnexion2"></jsp:useBean>
<jsp:setProperty property="login" name="dbcnx" value="userjsp" />
<jsp:setProperty property="password" name="dbcnx" value="userjsp" />
<jsp:setProperty property="hostName" name="dbcnx" value="localhost" />
<jsp:setProperty property="port" name="dbcnx" value="3306" />
<jsp:setProperty property="databaseName" name="dbcnx" value="livrejsp" />
<jsp:useBean id="lecteur" class="Ch6.Lecteur2" scope="session"></jsp:useBean>
<jsp:useBean id="emprunt" class="Ch6.Emprunt2"></jsp:useBean>

<html>
<head>
<meta charset="UTF-8" />
<title>Confirmation d'emprunt</title>
</head>
<body>

	<%
		Connection cnx = dbcnx.getCnx();
		Statement lien = dbcnx.getLien(cnx);
		String codeLivre = request.getParameter("checkCodeLivre");
		String test = "select * from livres where LIV_CodeLivre='"
				+ codeLivre + "'";
		ResultSet rs = lien.executeQuery(test);
		if (rs.first()) {
			String numeroLecteur = lecteur.getIdLecteur();
			Calendar maintenant = Calendar.getInstance();
			emprunt.setCodeLivre(codeLivre);
			emprunt.setNumLecteur(numeroLecteur);
			emprunt.setDateEmprunt(maintenant);
			String reservation = "insert into emprunts (EMP_Numero, EMP_Date, EMP_DateRetour, EMP_CodeLivre, EMP_NumLecteur) values ('"
					+ emprunt.getNumEmprunt()
					+ "','"
					+ emprunt.getDateEmprunt()
					+ "','"
					+ emprunt.getDateRetour()
					+ "','"
					+ emprunt.getCodeLivre()
					+ "','"
					+ emprunt.getNumLecteur() + "')";
			lien.executeUpdate(reservation);
			String livreReserve = "update livres set LIV_DejaReserve=1 where LIV_CodeLivre='"
					+ emprunt.getCodeLivre() + "'";
			lien.executeUpdate(livreReserve);
	%>

	<h1>Confirmation d'un emprunt</h1>
	Votre réservation porte le numéro :
	<jsp:getProperty property="numEmprunt" name="emprunt" />
	<br> Date de la réservation :
	<jsp:getProperty property="dateEmprunt" name="emprunt" />
	<br> Date du retour :
	<jsp:getProperty property="dateRetour" name="emprunt" />
	<br>
	<br>
	<%
		int nbrEmprunt = 0;
			if (session.getAttribute("nbrEmprunt") == null) {
				nbrEmprunt = 0;
			} else {
				nbrEmprunt = Integer.parseInt((String) session
						.getAttribute("nbrEmprunt"));
			}
			nbrEmprunt++;
			session.setAttribute("nbrEmprunt", "" + nbrEmprunt);

			if (Integer.parseInt((String) session
					.getAttribute("nbrEmprunt")) <= 2) {
	%>
	Vous pouvez réserver un nouveau livre
	<a href="listeLivresDispo2.jsp">ici</a>.
	<%
		} else {
	%>
	<h3>Attention</h3>
	Nombre maximum d'emprunts atteint.
	<%
		}
		} else {
	%>
	<h3>Livre inconnu</h3>
	Ce code ne correspond à aucun livre existant.
	<br> Vous pouvez tenter une nouvelle réservation
	<a href="listeLivresDispo2.jsp">ici</a>.
	<%
		}
	%>
</body>
</html>