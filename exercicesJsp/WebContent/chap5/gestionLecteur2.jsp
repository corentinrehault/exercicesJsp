<%@page import="java.sql.ResultSet"%>
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
<title>Gestion lecteur</title>
</head>
<body>
	<h1>Gestion du lecteur</h1>
	<%
		Connection cnx = dbcnx.getCnx();
		Statement lien = dbcnx.getLien(cnx);
		String commande = "select LEC_NumLecteur, LEC_PrenomLecteur from Lecteurs where LEC_NomLecteur='"
				+ request.getParameter("checkNomLecteur")
				+ "' and LEC_MotDePasse='"
				+ request.getParameter("checkMotDePasse") + "'";
		ResultSet rs = lien.executeQuery(commande);
		if (rs.first()) {
			String prenom = rs.getString("LEC_PrenomLecteur");
			String numLecteur = rs.getString("LEC_NumLecteur");
	%>
	Le lecteur
	<%=prenom%>
	est reconnu.
	<br>
	<h3>Liste des ouvrages disponibles à la réservation</h3>
	<!-- 	liste ouvrages -->
	<%
		String livresDispo = "select * from livres where LIV_DejaReserve='false'";
			ResultSet ld = lien.executeQuery(livresDispo);
	%>
	<table>
		<tr>
			<td>Code Livre</td>
			<td>Nom Auteur</td>
			<td>Prénom Auteur</td>
			<td>Titre</td>
			<td>Catégorie</td>
			<td>ISBN</td>
		</tr>
		<%
			while (ld.next()) {
					out.println("<tr>");
					out.println("<td>" + ld.getString("LIV_CodeLivre")
							+ "</td>");
					out.println("<td>" + ld.getString("LIV_NomAuteur")
							+ "</td>");
					out.println("<td>" + ld.getString("LIV_PrenomAuteur")
							+ "</td>");
					out.println("<td>" + ld.getString("LIV_Titre") + "</td>");
					out.println("<td>" + ld.getString("LIV_Categorie")
							+ "</td>");
					out.println("<td>" + ld.getString("LIV_ISBN") + "</td>");
					out.println("<td><a href=\"reserverUnLivre2.jsp?codeLivre="
							+ ld.getString("LIV_CodeLivre") + "&numLecteur="
							+ numLecteur + "\">Reserver</a></td>");
					out.println("</tr>");
				}
		%>
	</table>
	<h3>liste de vos réservations</h3>
	<!-- 	liste réservation -->
	<%
		String livresReserv = "select * from livres, emprunts where LIV_DejaReserve=true and LIV_CodeLivre=EMP_CodeLivre and EMP_NumLecteur='"
					+ numLecteur + "'";
			ResultSet lr = lien.executeQuery(livresReserv);
	%>
	<table>
		<tr>
			<td>Code Livre</td>
			<td>Nom Auteur</td>
			<td>Prénom Auteur</td>
			<td>Titre</td>
			<td>Catégorie</td>
			<td>ISBN</td>
		</tr>
		<%
			while (lr.next()) {
					out.println("<tr>");
					out.println("<td>" + lr.getString("LIV_CodeLivre")
							+ "</td>");
					out.println("<td>" + lr.getString("LIV_NomAuteur")
							+ "</td>");
					out.println("<td>" + lr.getString("LIV_PrenomAuteur")
							+ "</td>");
					out.println("<td>" + lr.getString("LIV_Titre") + "</td>");
					out.println("<td>" + lr.getString("LIV_Categorie")
							+ "</td>");
					out.println("<td>" + lr.getString("LIV_ISBN") + "</td>");
				}
		%>
	</table>
	<%
		} else {
	%>
	<h3>Lecteur inconnu</h3>
	Le lecteur n'est pas reconnu.
	<br> Cliquez
	<a href="login2.jsp">ici</a> pour tenter une nouvelle identification.
	<h3>Enregistrement d'un lecteur</h3>
	<form action="valideLecteur2.jsp" method="post">
		<table>
			<tr>
				<td><input type="text" name="nomLecteur" value=""
					placeholder="Nom du lecteur" size="20" maxlength="20"
					required="required"></input></td>
			</tr>
			<tr>
				<td><input type="text" name="prenomLecteur" value=""
					placeholder="Prénom du lecteur" size="20" maxlength="20"
					required="required"></input></td>
			</tr>
			<tr>
				<td><input type="text" name="adresse" value=""
					placeholder="Adresse du lecteur" size="20" maxlength="20"
					required="required"></input></td>
			</tr>
			<tr>
				<td><input type="text" name="codePostal" value=""
					placeholder="Code postal" size="20" pattern=[0-9]{5}
					required="required"></input></td>
			</tr>
			<tr>
				<td><input type="text" name="ville" value=""
					placeholder="Ville" size="20" maxlength="20" required="required"></input></td>
			</tr>
			<tr>
				<td><input type="password" name="motDePasse" value=""
					placeholder="Mot de passe" size="20" maxlength="20"
					required="required"></input></td>
			<tr>
				<td><input type="submit" value="Créer"></input></td>
			</tr>
		</table>
	</form>
	<%
		}
	%>
</body>
</html>