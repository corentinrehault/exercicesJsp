<%@ page import="javax.servlet.http.Cookie"%>

<html>
<head>
<meta charset="UTF-8" />
<title>Valider Info lecteur</title>
</head>
<body>
	<h1>Validation des préférences</h1>
	<%
		String str = request.getParameter("nom") + "/"
				+ request.getParameter("prenom") + "/"
				+ request.getParameter("categorie") + "/"
				+ request.getParameter("couleurFond") + "/"
				+ request.getParameter("couleurTexte");
		Cookie preferenceBiblio = new Cookie("preferenceBiblio", str);
		response.addCookie(preferenceBiblio);
	%>

	Les préférences du lecteur ont été validées, pour les consulter cliquez
	<a href="affichePreferencesLecteur2.jsp">ici</a>.
</body>
</html>