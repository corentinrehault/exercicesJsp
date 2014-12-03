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
<title>Valider lecteur</title>
</head>
<body>
	<h3>Connexion avec la base de données</h3>
	connexion vers la base :
	<br>
	<%
		Connection cnx = dbcnx.getCnx();
		if (cnx == null) {
			out.println("<font color=red>Connexion impossible : " + cnx
					+ "</font>");
		} else {
			out.println("<font color=green>Connexion établie : " + cnx
					+ "</font>");
		}
	%>
	<br>
	<br> création d'un tube de communication :
	<br>
	<%
		Statement lien = dbcnx.getLien(cnx);
	if (lien == null) {
		out.println("<font color=red>Communication impossible : " + lien
				+ "</font>");
	} else {
		out.println("<font color=green>Communication établie : " + lien
				+ "</font>");
	}
		%>
	<h1>Validation d'un lecteur</h1>
	<jsp:useBean id="lecteur" class="Ch5.Lecteur2"></jsp:useBean>
	<jsp:setProperty property="nomLecteur" name="lecteur" />
	<jsp:setProperty property="prenomLecteur" name="lecteur" />
	<jsp:setProperty property="adresse" name="lecteur" />
	<jsp:setProperty property="codePostal" name="lecteur" />
	<jsp:setProperty property="ville" name="lecteur" />
	<jsp:setProperty property="motDePasse" name="lecteur" />
	<table>
		<tr>
			<td>Nom :</td>
			<td><jsp:getProperty property="nomLecteur" name="lecteur" /></td>
		</tr>
		<tr>
			<td>Prénom :</td>
			<td><jsp:getProperty property="prenomLecteur" name="lecteur" /></td>
		</tr>
		<tr>
			<td>Adresse :</td>
			<td><jsp:getProperty property="adresse" name="lecteur" /></td>
		</tr>
		<tr>
			<td>CP :</td>
			<td><jsp:getProperty property="codePostal" name="lecteur" /></td>
		</tr>
		<tr>
			<td>Ville :</td>
			<td><jsp:getProperty property="ville" name="lecteur" /></td>
		</tr>
		<tr>
			<td>Numéro :</td>
			<td><jsp:getProperty property="idLecteur" name="lecteur" /></td>
		</tr>
		<tr>
			<td>Date anniversaire :</td>
			<td><jsp:getProperty property="dateAnniv" name="lecteur" /></td>
		</tr>
	</table>

	<%
String commande = "insert into lecteurs (LEC_NumLecteur,LEC_NomLecteur,LEC_PrenomLecteur,LEC_Adresse,LEC_Ville,LEC_CodePostal,LEC_MotDePasse) values ('" + lecteur.getIdLecteur() + "','" + lecteur.getNomLecteur() + "','" + lecteur.getPrenomLecteur() + "','" + lecteur.getAdresse() + "','" + lecteur.getVille() + "','" + lecteur.getCodePostal() + "','" + lecteur.getMotDePasse() + "')";
lien.executeUpdate(commande);%>

Vous êtes enregistré dans la base.<br>
Vous pouvez maintenant réserver des livres en vous identifiant <a href=login2.jsp>ici</a>.
</body>
</html>