<%@ page import="java.util.*" %>
<%
  // Gestion des cookies
  Cookie preferenceBiblio = null;
  
  // Variables nécessaires
  String nom = "";
  String prenom = "";
  String categorie = "";
  String couleurFond = "white";
  String couleurTxt = "black";
  // Enregistrer les valeurs provenant du formulaire dans le cookie
  nom = request.getParameter("nom");
  prenom = request.getParameter("prenom");
  categorie = request.getParameter("categorie");
  couleurFond = request.getParameter("couleurFond");
  couleurTxt = request.getParameter("couleurTxt");
  preferenceBiblio = new Cookie("preferenceBiblio", nom+"/"+prenom+"/"+categorie+"/"+couleurFond+"/"+couleurTxt);
  response.addCookie(preferenceBiblio);

%>


<!--// Afficher la page en fonction des préférences -->
<html>
<body>
<table width=700><tr><td>
<h1> Saisie des préférences du lecteur dans un seul cookie</h1>
<h3>Validation des préférences</h3>
Les préférences du lecteur ont été validées, pour les consulter cliquez <a href="affichePreferencesLecteur.jsp">ici</a>
</td></tr></table>
</body>
</html>

