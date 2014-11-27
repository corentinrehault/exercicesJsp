<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 6 : Connaître l'internaute
#	Exercice 6.2 
#	Description : Login de l'utilisateur pour réserver des livres
# 	Action : Appel le script listeLivreDispo.jsp
# 	JavaBeans : aucun
-->
<html>
<body>
<table width=700><tr><td>
<h1><font face=arial>Réservation en ligne </h1>
<h3>Formulaire d'identification</h3>
    <font face=arial size=2> 
     Vous devez vous identifier pour effectuer une réservation en ligne<br>
    <h2><font face=arial>Formulaire d'identification</h2>
    <form name=ident action="./listeLivresDispo.jsp" method=POST>
    <table>
    <tr>
      <td><font face=arial size=2>Nom : </td><td><input type=text name=nomLecteur></td>
    </tr><tr>
      <td><font face=arial size=2>Mot de passe : </td><td><input type=password name=motDePasse></td>
    </tr>
    </table>

      <input type=submit value=Login>
    </form>
</body>
</html>
