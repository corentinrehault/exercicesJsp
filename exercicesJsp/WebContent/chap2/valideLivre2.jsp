<html>
<head>
<meta charset="UTF-8" />
<title>Valider livre</title>
</head>
<body>
	<h1>Validation d'un livre</h1>
	<table>
		<tr>
			<td>Nom de l'auteur :</td>
			<td><%=request.getParameter("auteurNom")%></td>
		</tr>
		<tr>
			<td>Pr�nom de l'auteur :</td>
			<td><%=request.getParameter("auteurPrenom")%></td>
		</tr>
		<tr>
			<td>Titre du livre :</td>
			<td><%=request.getParameter("titreLivre")%></td>
		</tr>
		<tr>
			<td>Cat�gorie :</td>
			<td><%=request.getParameter("categorie")%></td>
		</tr>
		<tr>
			<td>ISBN :</td>
			<td><%=request.getParameter("numISBN")%></td>
		</tr>
	</table>

</body>
</html>