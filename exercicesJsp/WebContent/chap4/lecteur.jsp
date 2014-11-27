<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 4 : Utiliser un objet Java dans un script
#	Exercice 4.3  Formulaire d'enregistrement d'un lecteur
#		      Action : Appel valideLecteur.jsp
-->


<html>
<body>
<h1><font face=arial>Enregistrement d'un lecteur</h1>
<hr>
<form name=enregistrement action="valideLecteur.jsp" method=POST>

<table>
<tr>
   <td><font face=arial size=2>Nom : </td>
   <td><input type=texte name=nom size=20></td>
</tr>
<tr>
   <td><font face=arial size=2>Prénom : </td>
   <td><input type=texte name=prenom size=20></td>
</tr>
<tr>
   <td><font face=arial size=2>Adresse : </td>
   <td><input type=texte name=adresse size=20></td>
</tr>
<tr>
   <td><font face=arial size=2>Code Postal : </td>
   <td><input type=texte name=codePostal size=20></td>
</tr>
<tr>
   <td><font face=arial size=2>Ville : </td>
   <td><input type=texte name=ville size=20></td>
</tr>

</table>
<input type=submit value=valider>
</form>

</body>
</html>
