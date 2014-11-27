<%@ page import="java.util.*" %>
<%
  // Gestion des cookies
  Cookie preferenceBiblio = null;
  String preferencesLecteur = "";
%>

<!--// Afficher la page en fonction des préférences -->
<html>
<body>
<table width=700><tr><td>
<h1> Saisie des préférences du lecteur dans un seul cookie</h1>
<h3>Affichage des préférences</h3>
<%
  // Lecture de tous les cookies stockés sur l'ordinateur du lecteur
  Cookie tousLesCookies [] = request.getCookies();
  // Récupération de la valeur associé au cookie preferenceBiblio
  for (int i = 0 ; i<tousLesCookies.length ; i++) {
     if (tousLesCookies[i].getName().equals("preferenceBiblio")) {
          preferenceBiblio = tousLesCookies[i];
          preferencesLecteur = preferenceBiblio.getValue();
     }   
  }  
  out.println(affichePreferences(preferencesLecteur));
%>
<br>
Pour modifier les préférences du lecteur, cliquez <a href="saisiePreferencesLecteur.jsp">ici</a>
</td></tr></table>
</body>
</html>

<%!
  // Fonction découpage et affichage des préférences du lecteur
  public String affichePreferences(String preferencesLecteur) {
    // Préparation de la chaine HTML réponse
    String chaineHTML="<table>";
  
    // Tableau contenant l'indicatif des propriétés du cookie
    String libellePreferences[]={"Nom","Prenom","Categorie","Couleur de fond","Couleur de police"};
  
    // Découpage de la valeur du cookie en fonction d'une chaine de caractère dans un tableau
    StringTokenizer st = new StringTokenizer(preferencesLecteur,"/");
    int i=0;
    String preferences[] = new String[st.countTokens()];
  
    // Parcours du tableau et association de la valeur avec son indicatif
    while (st.hasMoreTokens())  {
      preferences[i] = st.nextToken();
      chaineHTML=chaineHTML+"<tr><td>"+libellePreferences[i]+"</td>"+"<td>"+preferences[i]+"</td></tr>";
      i++;
    }
  
    // Terminaison de la chaine HTML
    chaineHTML=chaineHTML+"</table>";
  
    // Renvoi de la chaine
    return chaineHTML;
  } 
%>