<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 2 : Communiquer avec l'internaute
#	Exercice 2.1
-->
<html>
<body>
<h1>Validation d'un lecteur</h1>
<table>
<tr><td>Nom :</td><td><font color=green><%=request.getParameter("nomLecteur")%></td></tr>
<tr><td>Prénom :</td><td><font color=green><%=request.getParameter("prenomLecteur")%></td></tr>
<tr><td>Adresse :</td><td><font color=green><%=request.getParameter("adresse")%></td></tr>
<tr><td>Ville :</td><td><font color=green><%=request.getParameter("ville")%></td></tr>
<tr><td>Code Postal :</td><td><font color=green><%=request.getParameter("codePostal")%></td></tr>
</table>

</body>
</html>