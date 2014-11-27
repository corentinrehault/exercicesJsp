<%@ page import="java.util.*" %>
<%
  // Gestion des cookies
  Cookie preferenceBiblio = null;
  
  // Variables n�cessaires
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


<!--// Afficher la page en fonction des pr�f�rences -->
<html>
<body>
<table width=700><tr><td>
<h1> Saisie des pr�f�rences du lecteur dans un seul cookie</h1>
<h3>Validation des pr�f�rences</h3>
Les pr�f�rences du lecteur ont �t� valid�es, pour les consulter cliquez <a href="affichePreferencesLecteur.jsp">ici</a>
</td></tr></table>
</body>
</html>

