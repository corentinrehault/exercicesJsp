<!-- 
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 2 : Communiquer avec l'internaute
#	Exercice 2.3 
-->
<html>
<body>
<h1>Validation des informations sur le lecteur</h1>
<!-- Coordonn�es du lecteur -->
<h3><font face=arial>Ses coordonn�es</h3>
<table>
<tr><td>Nom :</td><td><font color=green><%=request.getParameter("nomLecteur")%></td></tr>
<tr><td>Pr�nom :</td><td><font color=green><%=request.getParameter("prenomLecteur")%></td></tr>
</table>

<!-- Pr�f�rences du lecteur -->
<h3><font face=arial>Ses pr�f�rences</h3>
<table>
<tr><td>Cat�gorie :</td><td><font color=green><%=request.getParameter("categorie")%></td></tr>
<tr><td>Couleur du fond :</td><td><font color=<%=request.getParameter("couleurFond")%>><%=request.getParameter("couleurFond")%></td></tr>
<tr><td>Couleur de la police :</td><td><font color=<%=request.getParameter("couleurPolice")%>><%=request.getParameter("couleurPolice")%></td></tr>
</table>
</body>
</html>