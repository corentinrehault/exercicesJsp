<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 3 : Les structures de la programmation Java
#	Exercice 3.2 
-->
<%
// Déclaration des variables nécessaires
int jour=0; // Le jour transmis en POST
int mois=0; // Le mois transmis en POST
int annee=0; // L'année transmise en POST
int nbrjours=0; // Prends la valeur 28,29,30 ou 31 en fonction du mois
String erreur=null; // Contient l'erreur le cas échéant

// On récupère les données du formulaire
// Attention, il faut transformer les paramètres récupérés (String) en entier
jour=Integer.parseInt(request.getParameter("jour"));
mois=Integer.parseInt(request.getParameter("mois"));
annee=Integer.parseInt(request.getParameter("annee"));

// On teste si le nombre de jours correspond au mois

   switch(mois)   {
     case 1 : case 3 :		// Pour les mois à 31 jours 
     case 5 : case 7 : 
     case 8 : case 10 :	
     case 12 : 
            // Pas de test, le jour est forcément dans la plage 
            break ;
     case 4 : case 6 :		// Pour les mois à 30 jours
     case 9 : case 11 :
            if (jour>30)
              erreur="Le mois numéro "+mois+" ne peut compter "+jour+" jours!";
            break ;
     case 2 :  				// Pour le cas particulier du mois de février
          if (annee % 4 == 0 && annee % 100 != 0 || annee % 400 == 0) {
            if (jour>29)
              erreur="Le mois de février contient 28 ou 29 jours !"; 
          } else {
            if (jour>28)
              erreur="L'année "+annee+" n'est pas bissextile !";
          }
          break ;
     default :				// En cas d'erreur de frappe
              out.println("Impossible, cette date n'existe pas ") ;
   }
%>
<html>
<body>
<h1>Validation de la date</h1>
Voici la date saisie : <%=jour%>/<%=mois%>/<%=annee%><br>
<% 
  if (erreur!=null)
    out.println("La date saisie n'est pas valide pour la raison suivante : <font color=red>"+erreur+"</font>");
  else
    out.println("La date saisie <font color=green>est valide </font>");
%>
</body>
</html>
