<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 3 : Les structures de la programmation Java
#	
-->
<%!
  // définition de la fonction fSelect()
  public String fSelect(String [] liste, String nom) {
    String chaine ="<select name="+nom+">";
    int i = 0; 
    while ( i<liste.length) {
      chaine +="<option value=" + liste[i] + ">" + liste[i] + "</option >";
      i++; 
    } 
    chaine = chaine + "</select>";
    return chaine;
   }
%> 

<html>
<body>
<%
// Déclaration des variables nécessaires
String jours []= {"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"};
String mois []= {"1","2","3","4","5","6","7","8","9","10","11","12"};
String annees []= {"2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014"};
%>

<h1>Formulaire de saisie d'une date</h1>

<form name=dateWhile action="valideDateFonction.jsp" method=POST>
<table>
<tr><td>Jour</td><td>Mois</td><td>Année</td><td></td></tr>
<tr>
  <!-- Appel de la fonction fselect() -->
  <td><%=fSelect(jours,"jour")%></td>
  <td><%=fSelect(mois,"mois")%></td>
  <td><%=fSelect(annees,"annee")%></td> 
  <td><input type=submit value="Vérifiez"></td>
</table>
</form>

</body>
</html>
