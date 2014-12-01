<html>
<head>
<meta charset="UTF-8" />
<title>Valider livre</title>
</head>
<body>
	<h1>Validation d'un livre</h1>
	<jsp:useBean id="livre" class="Ch4.Livre2"></jsp:useBean>
	<jsp:setProperty property="nomAuteur" name="livre" />
	<jsp:setProperty property="prenomAuteur" name="livre" />
	<jsp:setProperty property="titreLivre" name="livre" />
	<jsp:setProperty property="categorie" name="livre" />
	<jsp:setProperty property="numISBN" name="livre" />
	<table>
		<tr>
			<td>Nom de l'auteur :</td>
			<td><jsp:getProperty property="nomAuteur" name="livre" /></td>
		</tr>
		<tr>
			<td>Prénom de l'auteur :</td>
			<td><jsp:getProperty property="prenomAuteur" name="livre" /></td>
		</tr>
		<tr>
			<td>Titre du livre :</td>
			<td><jsp:getProperty property="titreLivre" name="livre" /></td>
		</tr>
		<tr>
			<td>Catégorie :</td>
			<td><jsp:getProperty property="categorie" name="livre" /></td>
		</tr>
		<tr>
			<td>ISBN :</td>
			<td><jsp:getProperty property="numISBN" name="livre" /></td>
		</tr>
		<tr>
			<td>Code d'enregistrement :</td>
			<td><jsp:getProperty property="codeLivre" name="livre" /></td>
		</tr>
	</table>

</body>
</html>