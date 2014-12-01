<html>
<head>
<meta charset="UTF-8" />
<title>Information lecteur</title>
</head>
<body>
	<h1>Informations sur le lecteur</h1>
	<form action="validePreferencesLecteur2.jsp" method="post">
		<h2>Ses coordonnées</h2>
		<table>
			<tr>
				<!-- 				<td>Nom :</td> -->
				<td><input type="text" name="nom" value=""
					placeholder="Saisissez votre nom" size="25" maxlength="20"
					required="required"></input></td>
			</tr>
			<tr>
				<!-- 				<td>Prénom :</td> -->
				<td><input type="text" name="prenom" value=""
					placeholder="Saisissez votre prénom" size="25" maxlength="20"
					required="required"></input></td>
			</tr>
		</table>
		<h2>Ses préférences</h2>
		Choisissez votre catégorie favorie :<br> <select name="categorie"
			size="1" required="required">
			<option value="" selected="selected" disabled="disabled">Choisisez
				une catégorie</option>
			<option value="Roman">Roman</option>
			<option value="Pilosophie">Pilosophie</option>
			<option value="Science-fiction">Science-fiction</option>
			<option value="Policier">Policier</option>
			<option value="Junior">Junior</option>
		</select><br> Choisissez la couleur :
		<table>
			<tr>
				<td>du fond :</td>
				<td><select name="couleurFond" size="1" required="required">
						<option value="fBlanc" selected="selected">Blanc</option>
						<option value="fNoir">Noir</option>
						<option value="fRouge">Rouge</option>
						<option value="fVert">Vert</option>
						<option value="fJaune">Jaune</option>
				</select></td>
			</tr>
			<tr>
				<td>du texte :</td>
				<td><select name="couleurTexte" size="1" required="required">
						<option value="tNoir" selected="selected">Noir</option>
						<option value="tBlanc">Blanc</option>
						<option value="tRouge">Rouge</option>
						<option value="tVert">Vert</option>
						<option value="tJaune">Jaune</option>
				</select></td>
			</tr>
			<tr>
				<td><input type="submit" value="OK"></input></td>
		</table>
	</form>

</body>
</html>