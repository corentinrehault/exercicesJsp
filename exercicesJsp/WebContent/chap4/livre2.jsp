<html>
<head>
<meta charset="UTF-8" />
<title>Nouveau livre</title>
</head>
<body>
	<h1>Enregistrement d'un livre</h1>

	<form action="valideLivre2.jsp" method="post">
		<table>
			<tr>
				<td><input type="text" name="nomAuteur" value=""
					placeholder="Nom de l'auteur" size="20" maxlength="20"
					required="required"></input></td>
			</tr>
			<tr>
				<td><input type="text" name="prenomAuteur" value=""
					placeholder="Prénom de l'auteur" size="20" maxlength="20"
					required="required"></input></td>
			</tr>
			<tr>
				<td><input type="text" name="titreLivre" value=""
					placeholder="Titre du livre" size="20" maxlength="20"
					required="required"></input></td>
			</tr>
			<tr>
				<td><select name="categorie" size="1" required="required">
						<option value="" selected="selected" disabled="disabled">Catégorie</option>
						<option value="Roman">Roman</option>
						<option value="Pilosophie">Pilosophie</option>
						<option value="Science-fiction">Science-fiction</option>
						<option value="Policier">Policier</option>
						<option value="Junior">Junior</option>
				</select></td>
			</tr>
			<tr>
				<td><input type="text" name="numISBN" value=""
					placeholder="ISBN13" size="20" pattern="[0-9]{13}"
					required="required"></input></td>
			</tr>
			<tr>
				<td><input type="submit" value="Créer"></input></td>
			</tr>
		</table>
	</form>

</body>
</html>