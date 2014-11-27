<!-- 
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 3 : Les structures de la programmation Java
#	Exercice 3.1
-->
<html>
<body>
<%
// D�claration des variables n�cessaires
int nbrMaxJour = 31;
int nbrMaxMois = 12;
int anneeCourante = 2004;
int nbrAnnee = 10; // nombre d'ann�es affich�es dans le formulaire
int i=0; // compteur
%>

<h1>Saisir une date </h1>
Avec : <br> la boucle <i>for</i>  pour les jours,<br> la boucle <i>while</i>  pour les mois
<br> la boucle <i>do ... while</i>  pour les ann�es. <BR>
<form name=dateFor action="valideDate.jsp" method=POST>
<table>
<tr><td>Jour</td><td>Mois</td><td>Ann�e</td><td></td></tr>
<tr>
  <td>
    <select name=jour>
    <%
    for ( i=1;i<=nbrMaxJour;i++) {
      out.println("<option value=" + i + ">" + i + "</option >");
    } 
    %>
    </select>
  </td>
  <td>
    <select name=mois>
    <%
    i=1;
    while ( i<=nbrMaxMois) {
      out.println("<option value=" + i + ">" + i + "</option >");
      i++; 
    }  
    %>
    </select>
  </td>
  <td>
    <select name=annee>
    <%
    i=anneeCourante;
    do {
      out.println("<option value=" + i + ">" + i + "</option >");
      i++;
    } while (i<=(anneeCourante+nbrAnnee));    
    %>
    </select>
  </td>  
  <td><input type=submit value="V�rifiez"></td>
</table>
</form>

</body>
</html>
