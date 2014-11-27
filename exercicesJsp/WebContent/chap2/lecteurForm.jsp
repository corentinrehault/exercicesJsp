<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 2 : Communiquer avec l'internaute
#	Exercice 2.1 
-->
<html>
<body>
<h1>Enregistrement d'un lecteur</h1>
<form name="lecteur" action="valideLecteur.jsp" method=POST>

<table>
<tr><td>Nom :</td><td><input type=text name=nomLecteur size=20></td></tr>
<tr><td>Prénom :</td><td><input type=text name=prenomLecteur size=20></td></tr>
<tr><td>Adresse :</td><td><input type=text name=adresse size=20></td></tr>
<tr><td>Ville :</td><td><input type=text name=ville size=20></td></tr>
<tr><td>Code Postal :</td><td><input type=text name=codePostal size=20></td></tr>
</table>
<input type=submit value="Enregistrer">
</form>
</body>
</html>