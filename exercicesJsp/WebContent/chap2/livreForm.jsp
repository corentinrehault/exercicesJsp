<!-- 
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 2 : Communiquer avec l'internaute
#	Exercice 2.2 
-->
<html>
<body>
<h1>Enregistrement d'un livre</h1>
<form name="lecteur" action="valideLivre.jsp" method=POST>

<table>
<tr><td>Nom de l'auteur :</td><td><input type=text name=nomAuteur size=20></td></tr>
<tr><td>Pr�nom de l'auteur :</td><td><input type=text name=prenomAuteur size=20></td></tr>
<tr><td>Titre :</td><td><input type=text name=titre size=20></td></tr>
<tr><td>Cat�gorie :</td><td>
  <select name=categorie>
  <option value="">S�lectionnez une cat�gorie</option>
  <option value="Roman">Roman</option>
  <option value="Philosophie">Philosophie</option>
  <option value="Science-fiction">Science Fiction</option>
  <option value="Policier">Policier</option>
  <option value="Junior">Junior</option>
  </select>
</td></tr>
<tr><td>Num�ro ISBN:</td><td><input type=text name=numeroIsbn size=20></td></tr>
</table>
<input type=submit value="Enregistrer">
</form>
</body>
</html>