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
<title>Réserver un livre</title>
</head>
<body>

	<%
		Connection cnx = dbcnx.getCnx();
		Statement lien = dbcnx.getLien(cnx);
		String livre = "select * from livres where LIV_CodeLivre='"
				+ request.getParameter("codeLivre") + "'";
		ResultSet rs = lien.executeQuery(livre);
	%>
	<h1>Réserver un livre</h1>
	Vous désirez réserver le livre suivant :
	<table>
	<%
		while (rs.next()) {
			out.println("<tr><td><font face=arial size=2 color=red>Code du livre</td>  <td><font face=arial size=2>"
					+ rs.getString("LIV_CodeLivre") + "</td></tr>");
			out.println("<tr><td><font face=arial size=2 color=red>Nom de l'Auteur</td>  <td><font face=arial size=2>"
					+ rs.getString("LIV_NomAuteur") + "</td></tr>");
			out.println("<tr><td><font face=arial size=2 color=red>Prenom de l'Auteur</td>  <td><font face=arial size=2>"
					+ rs.getString("LIV_PrenomAuteur") + "</td></tr>");
			out.println("<tr><td><font face=arial size=2 color=red>Titre</td>  <td><font face=arial size=2>"
					+ rs.getString("LIV_Titre") + "</td></tr>");
			out.println("<tr><td><font face=arial size=2 color=red>Categorie</td>  <td><font face=arial size=2>"
					+ rs.getString("LIV_Categorie") + "</td></tr>");
			out.println("<tr><td><font face=arial size=2 color=red>ISBN</td>  <td><font face=arial size=2>"
					+ rs.getString("LIV_ISBN") + "</td></tr>");
			out.println("");
		}
	%>
	</table>
	<br>
	<form action="confirmationReservation2.jsp" method="post">
		<input type="hidden" name="numLecteur" value="<%=request.getParameter("numLecteur")%>"></input>
		<input type="hidden" name="codeLivre" value="<%=request.getParameter("codeLivre")%>"></input>
		<input type="submit" value="Confirmer"></input>
	</form>
</body>
</html>