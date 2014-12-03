<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>

<jsp:useBean id="dbcnx" class="Ch6.DBConnexion2"></jsp:useBean>
<jsp:setProperty property="login" name="dbcnx" value="userjsp" />
<jsp:setProperty property="password" name="dbcnx" value="userjsp" />
<jsp:setProperty property="hostName" name="dbcnx" value="localhost" />
<jsp:setProperty property="port" name="dbcnx" value="3306" />
<jsp:setProperty property="databaseName" name="dbcnx" value="livrejsp" />
<jsp:useBean id="lecteur" class="Ch6.Lecteur2" scope="session"></jsp:useBean>

<html>
<head>
<meta charset="UTF-8" />
<title>Réservation en ligne</title>
</head>
<body>
	<h1>Réservation en ligne</h1>
	<%
		String nomLecteur = request.getParameter("checkNomLecteur");
		String motDePasse = request.getParameter("checkMotDePasse");
		Connection cnx = dbcnx.getCnx();
		Statement lien = dbcnx.getLien(cnx);
		String commande = "select * from Lecteurs where LEC_NomLecteur='"
				+ nomLecteur + "' and LEC_MotDePasse='" + motDePasse + "'";
		ResultSet rs = lien.executeQuery(commande);
		if (rs.first()) {
			lecteur.setIdLecteur(rs.getString("LEC_NumLecteur"));
			lecteur.setNomLecteur(rs.getString("LEC_NomLecteur"));
			lecteur.setPrenomLecteur(rs.getString("LEC_PrenomLecteur"));
			lecteur.setAdresse(rs.getString("LEC_Adresse"));
			lecteur.setCodePostal(rs.getString("LEC_CodePostal"));
			lecteur.setVille(rs.getString("LEC_Ville"));
			lecteur.setMotDePasse(rs.getString("LEC_MotDePasse"));
	%>
	Le lecteur
	<%=lecteur.getPrenomLecteur()%>
	est reconnu.
	<br>
	<h3>Liste des ouvrages disponibles à la réservation</h3>
	<%
		String livresDispo = "select * from livres where LIV_DejaReserve=0";
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
					out.println("</tr>");
				}
		%>
	</table>
	<h3>Emprunter un livre</h3>
	<form action="valideEmpruntLivres2.jsp" method="post">
		<table>
			<tr>
				<td><input type="text" name="checkCodeLivre" value=""
					placeholder="Code du livre" size="20" maxlength="8"></input></td>
				<td><input type="submit" name="Valider"></input></td>
			</tr>
		</table>
	</form>
	<%
		} else if (lecteur.getIdLecteur() != null) {
	%>
	Le lecteur
	<%=lecteur.getPrenomLecteur()%>
	est reconnu.
	<br>
	<h3>Liste des ouvrages disponibles à la réservation</h3>
	<%
		String livresDispo = "select * from livres where LIV_DejaReserve=0";
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
					out.println("</tr>");
				}
		%>
	</table>
	<h3>Emprunter un livre</h3>
	<form action="valideEmpruntLivres2.jsp" method="post">
		<table>
			<tr>
				<td><input type="text" name="checkCodeLivre" value=""
					placeholder="Code du livre" size="20" maxlength="8"></input></td>
				<td><input type="submit" name="Valider"></input></td>
			</tr>
		</table>
	</form>
	
	<%
		} else {
	%>
	<h3>Lecteur inconnu</h3>
	Le lecteur n'est pas reconnu.
	<br> Cliquez
	<a href="loginEmprunts2.jsp">ici</a> pour tenter une nouvelle
	identification.
	<%
		}
	%>

</body>
</html>