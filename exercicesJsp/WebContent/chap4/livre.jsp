<!-- 
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 4 : Utiliser un objet Java dans un script
#	Exercice 4.1  Formulaire d'enregistrement d'un livre
#		      Action : Appel valideLivre.jsp
-->
<html>
<body>
<h1><font face=arial>Enregistrement d'un livre</h1>
<hr>
<form name=enregistrement action="valideLivre.jsp">
<h3><font face=arial>Le livre...</h3>
<table>
<tr>
   <td><font face=arial size=2>Titre : </td>
   <td><input type=texte name=titre size=20></td>
</tr>
<tr>
   <td><font face=arial size=2>Cat�gorie : </td>
   <td><select name=categorie>
      <option value="Policier"><font face=arial size=2>Policier</option>
      <option value="Roman"><font face=arial size=2>Roman</option>
      <option value="Junior"><font face=arial size=2>Junior</option>
      <option value="Philosophie"><font face=arial size=2>Philosophie</option>
      <option value="Science-fiction"><font face=arial size=2>Sciences-fiction</option>
   </select></td>
</tr>
<tr>
   <td><font face=arial size=2>Le num�ro ISBN : </td>
   <td><input type=texte name=numero size=20></td>
</tr>
</table>
<h3><font face=arial>L'auteur...</h3>
<table>
<tr>
   <td><font face=arial size=2>Nom : </td>
   <td><input type=texte name=nom size=20></td>
</tr>
<tr>
   <td><font face=arial size=2>Pr�nom : </td>
   <td><input type=texte name=prenom size=20></td>
</tr>
</table>
<input type=submit value=valider>
</form>

</body>
</html>
