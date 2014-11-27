<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 5 : Interroger une base de données
#	Exercice 5.3.c  Un formulaire pour s'identifier
#	Action : Appeler le script gestionLecteur.jsp

-->
<html>
<body>
<h1>Login du lecteur</h1>
<form name=loginLecteur action="gestionLecteur.jsp" method=POST>
<table>
  <tr><td>Nom du lecteur</td><td><input type=text size=20 name=nomLecteur></td></tr>
  <tr><td>Mot de passe </td><td><input type=password size=20 name=motDePasse></td></tr>
</table>
<input type=submit value="Login">
</form>
</body>
</html>