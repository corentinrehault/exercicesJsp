<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 2 : Communiquer avec l'internaute
#	Exercice 2.3 
-->
<html>
<body>
<h1>Validation des informations sur le lecteur</h1>
<!-- Coordonnées du lecteur -->
<h3><font face=arial>Ses coordonnées</h3>
<table>
<tr><td>Nom :</td><td><font color=green><%=request.getParameter("nomLecteur")%></td></tr>
<tr><td>Prénom :</td><td><font color=green><%=request.getParameter("prenomLecteur")%></td></tr>
</table>

<!-- Préférences du lecteur -->
<h3><font face=arial>Ses préférences</h3>
<table>
<tr><td>Catégorie :</td><td><font color=green><%=request.getParameter("categorie")%></td></tr>
<tr><td>Couleur du fond :</td><td><font color=<%=request.getParameter("couleurFond")%>><%=request.getParameter("couleurFond")%></td></tr>
<tr><td>Couleur de la police :</td><td><font color=<%=request.getParameter("couleurPolice")%>><%=request.getParameter("couleurPolice")%></td></tr>
</table>
</body>
</html>