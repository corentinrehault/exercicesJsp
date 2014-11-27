<%@ page import="java.util.*" %>
<%
  // Gestion des cookies
  Cookie preferenceBiblio = null;
  String preferencesLecteur = "";
%>

<!--// Afficher la page en fonction des pr�f�rences -->
<html>
<body>
<table width=700><tr><td>
<h1> Saisie des pr�f�rences du lecteur dans un seul cookie</h1>
<h3>Affichage des pr�f�rences</h3>
<%
  // Lecture de tous les cookies stock�s sur l'ordinateur du lecteur
  Cookie tousLesCookies [] = request.getCookies();
  // R�cup�ration de la valeur associ� au cookie preferenceBiblio
  for (int i = 0 ; i<tousLesCookies.length ; i++) {
     if (tousLesCookies[i].getName().equals("preferenceBiblio")) {
          preferenceBiblio = tousLesCookies[i];
          preferencesLecteur = preferenceBiblio.getValue();
     }   
  }  
  out.println(affichePreferences(preferencesLecteur));
%>
<br>
Pour modifier les pr�f�rences du lecteur, cliquez <a href="saisiePreferencesLecteur.jsp">ici</a>
</td></tr></table>
</body>
</html>

<%!
  // Fonction d�coupage et affichage des pr�f�rences du lecteur
  public String affichePreferences(String preferencesLecteur) {
    // Pr�paration de la chaine HTML r�ponse
    String chaineHTML="<table>";
  
    // Tableau contenant l'indicatif des propri�t�s du cookie
    String libellePreferences[]={"Nom","Prenom","Categorie","Couleur de fond","Couleur de police"};
  
    // D�coupage de la valeur du cookie en fonction d'une chaine de caract�re dans un tableau
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