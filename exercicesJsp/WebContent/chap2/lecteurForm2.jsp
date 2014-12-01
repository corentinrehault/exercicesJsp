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
				<!-- 				<td>Nom :</td> -->
				<td><input type="text" name="nom" value=""
					placeholder="Nom du lecteur" size="20" maxlength="20"></input></td>
			</tr>
			<tr>
				<!-- 				<td>Prénom :</td> -->
				<td><input type="text" name="prenom" value=""
					placeholder="Prénom du lecteur" size="20" maxlength="20"></input></td>
			</tr>
			<tr>
				<!-- 				<td>Adresse :</td> -->
				<td><input type="text" name="adresse" value=""
					placeholder="Adresse du lecteur" size="20" maxlength="20"></input></td>
			</tr>
			<tr>
				<!-- 				<td>Ville :</td> -->
				<td><input type="text" name="ville" value=""
					placeholder="Ville" size="20" maxlength="20"></input></td>
			</tr>
			<tr>
				<!-- 				<td>CP :</td> -->
				<td><input type="text" name="cpostal" value=""
					placeholder="Code postal" size="20" pattern=[0-9]{5}></input></td>
			</tr>
			<tr>
				<td><input type="submit" value="Créer"></input></td>
			</tr>
		</table>
	</form>

</body>
</html>