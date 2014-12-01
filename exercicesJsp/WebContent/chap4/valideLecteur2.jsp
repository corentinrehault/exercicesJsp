<html>
<head>
<meta charset="UTF-8" />
<title>Valider lecteur</title>
</head>
<body>
	<h1>Validation d'un lecteur</h1>
	<jsp:useBean id="lecteur" class="Ch4.Lecteur2"></jsp:useBean>
	<jsp:setProperty property="nomLecteur" name="lecteur" />
	<jsp:setProperty property="prenomLecteur" name="lecteur" />
	<jsp:setProperty property="adresse" name="lecteur" />
	<jsp:setProperty property="codePostal" name="lecteur" />
	<jsp:setProperty property="ville" name="lecteur" />
	<table>
		<tr>
			<td>Nom :</td>
			<td><jsp:getProperty property="nomLecteur" name="lecteur" /></td>
		</tr>
		<tr>
			<td>Prénom :</td>
			<td><jsp:getProperty property="prenomLecteur" name="lecteur" /></td>
		</tr>
		<tr>
			<td>Adresse :</td>
			<td><jsp:getProperty property="adresse" name="lecteur" /></td>
		</tr>
		<tr>
			<td>CP :</td>
			<td><jsp:getProperty property="codePostal" name="lecteur" /></td>
		</tr>
		<tr>
			<td>Ville :</td>
			<td><jsp:getProperty property="ville" name="lecteur" /></td>
		</tr>
		<tr>
			<td>Numéro :</td>
			<td><jsp:getProperty property="idLecteur" name="lecteur" /></td>
		</tr>
		<tr>
			<td>Date anniversaire :</td>
			<td><jsp:getProperty property="dateAnniv" name="lecteur" /></td>
		</tr>
	</table>
</body>
</html>