<html>
<head>
<meta charset="UTF-8" />
<title>Valider Info lecteur</title>
</head>
<body>
	<h1>Validation des informations sur le lecteur</h1>
	<form action="validePreferencesLecteur2.jsp" method="post">
		<h2>Ses coordonn�es</h2>
		<table>
			<tr>
				<td>Nom :</td>
				<td><%=request.getParameter("nom")%></td>
			</tr>
			<tr>
				<td>Pr�nom :</td>
				<td><%=request.getParameter("prenom")%></td>
			</tr>
		</table>
		<h2>Ses pr�f�rences</h2>

		<table>
			<tr>
				<td>Cat�gorie :</td>
				<td><%=request.getParameter("categorie")%></td>
			</tr>
			<tr>
				<td>Couleur du fond :</td>
				<td><%=request.getParameter("couleurFond")%></td>
			</tr>
			<tr>
				<td>Couleur du texte :</td>
				<td><%=request.getParameter("couleurTexte")%></td>
			</tr>
		</table>
	</form>

</body>
</html>