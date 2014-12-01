<html>
<head>
<meta charset="UTF-8" />
<title>Valider lecteur</title>
</head>
<body>
	<h1>Validation d'un lecteur</h1>
	<table>
		<tr>
			<td>Nom :</td>
			<td><%=request.getParameter("nom")%></td>
		</tr>
		<tr>
			<td>Prénom :</td>
			<td><%=request.getParameter("prenom")%></td>
		</tr>
		<tr>
			<td>Adresse :</td>
			<td><%=request.getParameter("adresse")%></td>
		</tr>
		<tr>
			<td>Ville :</td>
			<td><%=request.getParameter("ville")%></td>
		</tr>
		<tr>
			<td>CP :</td>
			<td><%=request.getParameter("cpostal")%></td>
		</tr>
	</table>
</body>
</html>