<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 2 : Communiquer avec l'internaute
#	Exercice 2.2 
-->
<html>
<body>
<h1>Validation d'un livre</h1>
<table>
<tr><td>Nom de l'auteur :</td><td><font color=green><%=request.getParameter("nomAuteur")%></td></tr>
<tr><td>Prénom de l'auteur :</td><td><font color=green><%=request.getParameter("prenomAuteur")%></td></tr>
<tr><td>Titre :</td><td><font color=green><%=request.getParameter("titre")%></td></tr>
<tr><td>Catégorie :</td><td><font color=green><%=request.getParameter("categorie")%></td></tr>
<tr><td>Numéro ISBN :</td><td><font color=green><%=request.getParameter("numeroIsbn")%></td></tr>
</table>

</body>
</html>