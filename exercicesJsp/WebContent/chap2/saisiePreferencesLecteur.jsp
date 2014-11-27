<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 2 : Communiquer avec l'internaute
#	Exercice 2.3
-->
<html>
<body>
<table width=700><tr><td>
<h1><font face=arial>Informations sur le lecteur</h1>
<form name="preference" action="./validePreferencesLecteur.jsp" method="POST">

<!-- Saisi des coordonnées de l'utilisateur -->
<h3><font face=arial>Ses coordonnées</h3>
<table>
<tr>
  <td><font face=arial size=2>Nom :</td>
  <td><input type=text name="nomLecteur" value="Saisissez votre nom" size=30></td>
</tr>
<tr>
  <td><font face=arial size=2>Prénom :</td>
  <td><input type=text name="prenomLecteur" value="Saisissez votre prénom" size=30></td>
</tr>
</table>


<!-- Saisie des préférences de l'utilisateur -->
<h3><font face=arial>Ses préférences</h3>
<font face=arial size=2>Choisissez votre catégorie favorite :

<table>
<tr><td>
<!-- Une liste pour la catégorie -->
<select name=categorie>
      <option value=""><font face=arial size=2>Choisissez une catégorie</option>
      <option value="Policier"><font face=arial size=2>Policier</option>
      <option value="Roman"><font face=arial size=2>Roman</option>
      <option value="Junior"><font face=arial size=2>Junior</option>
      <option value="Philosophie"><font face=arial size=2>Philosophie</option>
      <option value="SciencesFiction"><font face=arial size=2>Science-fiction</option>
</select>
</tr></td></table>
<font face=arial size=2>Choisissez la couleur :

<table>
<tr>
  <td><font face=arial size=2>du fond :</td>
<!-- Une liste pour la couleur de fond -->
  <td><select name="couleurFond">
        <option value="black"><font face=arial size=2 color=black>noir</option>
        <option value="white"><font face=arial size=2 color=black>blanc</option>
        <option value="red"><font face=arial size=2 color=red>rouge</option>
        <option value="yellow"><font face=arial size=2 color=yellow>jaune</option>
        <option value="green"><font face=arial size=2 color=green>vert</option>
  </td>
</tr>
<tr>
  <td><font face=arial size=2>de la police :</td>
<!-- Une liste pour la couleur du texte -->
  <td><select name="couleurPolice">
        <option value="black"><font face=arial size=2 color=black>noir</option>
        <option value="white"><font face=arial size=2 color=black>blanc</option>
        <option value="red"><font face=arial size=2 color=red>rouge</option>
        <option value="yellow"><font face=arial size=2 color=yellow>jaune</option>
        <option value="green"><font face=arial size=2 color=green>vert</option>
  </td>
</tr>
</table>
<input type=submit value="ok">
</form>
</td></tr></table>
</body>
</html>
