<html>
<head>
<meta charset="UTF-8" />
<title>Nouveau lecteur</title>
</head>
<body>
	<h1>Enregistrement d'un lecteur</h1>
	<form action="valideLecteur2.jsp" method="post">
		<table>
			<tr>
				<td><input type="text" name="nomLecteur" value=""
					placeholder="Nom du lecteur" size="20" maxlength="20"></input></td>
			</tr>
			<tr>
				<td><input type="text" name="prenomLecteur" value=""
					placeholder="Pr�nom du lecteur" size="20" maxlength="20"></input></td>
			</tr>
			<tr>
				<td><input type="text" name="adresse" value=""
					placeholder="Adresse du lecteur" size="20" maxlength="20"></input></td>
			</tr>
			<tr>
				<td><input type="text" name="codePostal" value=""
					placeholder="Code postal" size="20" pattern=[0-9]{5}></input></td>
			</tr>
			<tr>
				<td><input type="text" name="ville" value=""
					placeholder="Ville" size="20" maxlength="20"></input></td>
			</tr>
			<tr>
				<td><input type="submit" value="Cr�er"></input></td>
			</tr>
		</table>
	</form>

</body>
</html>