<!-- 
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 6 : Conna�tre l'internaute
#	Exercice 6.1 
# 	Description : Saisit les donn�es d'un utilisateur pour le cookie
#	Action : Appel le script validePreferencesLecteur.jsp
# 	JavaBeans : aucun
-->
<html>
<body>
<table width=700><tr><td>
<h1><font face=arial>Informations sur l'utilisateur</h1>
<form name="preference" action="./validePreferencesLecteur.jsp" method="POST">

<!-- Saisie des coordonn�es de l'utilisateur -->
<h3><font face=arial>Ses coordonn�es</h3>
<table>
<tr>
  <td><font face=arial size=2>Nom :</td>
  <td><input type=text name="nom" value="Saisissez votre nom" size=30></td>
</tr>
<tr>
  <td><font face=arial size=2>Pr�nom :</td>
  <td><input type=text name="prenom" value="Saisissez votre pr�nom" size=30></td>
</tr>
</table>


<!-- Saisi des pr�f�rences de l'utilisateur -->
<h3><font face=arial>Ses pr�f�rences</h3>
<font face=arial size=2>Choisissez votre cat�gorie favorite :

<table>
<tr><td>
<select name=categorie>
      <option value="Policier"><font face=arial size=2>Policier</option>
      <option value="Roman"><font face=arial size=2>Roman</option>
      <option value="Junior"><font face=arial size=2>Junior</option>
      <option value="Philosophie"><font face=arial size=2>Philosophie</option>
      <option value="Science-fiction"><font face=arial size=2>Sciences-fiction</option>
</select>
</tr></td></table>
<font face=arial size=2>Choisissez la couleur de :

<table>
<tr>
  <td><font face=arial size=2>Fond :</td>
  <td><select name="couleurFond">
        <option value="black"><font face=arial size=2 color=black>noir</option>
        <option value="white"><font face=arial size=2 color=black>blanc</option>
        <option value="red"><font face=arial size=2 color=red>rouge</option>
        <option value="yellow"><font face=arial size=2 color=yellow>jaune</option>
        <option value="green"><font face=arial size=2 color=green>vert</option>
  </td>
</tr>
<tr>
  <td><font face=arial size=2>Police :</td>
  <td><select name="couleurTxt">
        <option value="black"><font face=arial size=2 color=black>noir</option>
        <option value="white"><font face=arial size=2 color=black>blanc</option>
        <option value="red"><font face=arial size=2 color=red>rouge</option>
        <option value="yellow"><font face=arial size=2 color=yellow>jaune</option>
        <option value="green"><font face=arial size=2 color=green>vert</option>
  </td>
</tr>
</table>
<input type=submit value="Valider">
</form>
</td></tr></table>
</body>
</html>
