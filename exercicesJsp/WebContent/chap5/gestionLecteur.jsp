<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 5 : Interroger une base de données
#	Exercice 5.3.a et 5.3.d
#       JavaBeans : DBConnexion, DBLien, Lecteur (exercicesJSP/WEB-INF/classes/exercices/Ch5) 
#
# Page de gestion de l'idendification du lecteur
# Cette page se décompose en plusieurs actions distinctes
#
# 1/ Connection à la base de données 
# 2/ Vérification si l'utilisateur est reconnu
#      Requête sur la table Lecteurs avec les valeurs passées en paramètre
#      Test sur les valeurs de retour
# 3/ Si l'utilisateur est reconnu -> affichage des livres disponibles à la réservation
#                                 -> affichage d'un lien pour réserver chaque livre disponible (vers reserverUnLivre.jsp)
# 4/ Si le lecteur n'est pas reconnu -> affichage d'un message d'erreur
#                                    -> Affichage du lien pour se reloger (vers login.jsp)
#                                    -> Affichage du formulaire de saisie d'un nouveau lecteur (vers valideLecteur.jsp)
-->

<!-- La page JSP manipule des objets de type Connection et Statement -->
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<html>
<head><title>Gestion du lecteur</title></head>
<body>
<h1>Gestion du lecteur</h1>
<!-- 1/ Connexion à la base de données -->

<!--// DBConnexion Bean-->
<jsp:useBean id="dbcnx" class="Ch5.DBConnexion">
<!--// Code d'initialisation //-->
<jsp:setProperty name= "dbcnx" property="login" value="userjsp"/>
<jsp:setProperty name= "dbcnx" property="password" value="userjsp"/>
<jsp:setProperty name= "dbcnx" property="hostname" value="localhost"/>
<jsp:setProperty name= "dbcnx" property="port" value="3306"/>
<jsp:setProperty name= "dbcnx" property="nomDeLaBase" value="livrejsp"/>
</jsp:useBean>

<!--// DBLien Bean -->
<jsp:useBean id="dblien" class="Ch5.DBLien"/>

<%
  // Récupation de la connexion
  Connection cnx = dbcnx.getCnx();
  if (cnx == null) {
    out.println("<font color=red>Connexion impossible : " + cnx + "</font><br>");
  } 

  // Création du tube de communication avec la base de données
  Statement lien = dblien.getLien(cnx);
  if (lien == null) {
    out.println("<font color=red>Communication impossible : "+ lien + "</font><br>");
  } 
%>


<% // 2/ Vérification du lecteur
  // Construction de la requete
  String commande="select LEC_NumLecteur from lecteurs where LEC_NomLecteur='"+request.getParameter("nomLecteur")+"' and LEC_MotDePasse='"+request.getParameter("motDePasse")+"'";

  // Exécution de la requete
  ResultSet rs;
  rs=lien.executeQuery(commande);

  // 3/ Si l'utilisateur est reconnu on affiche les livres disponibles à la réservation
  if (rs.first()) {
    String numLecteur=rs.getString("LEC_NumLecteur");
%>
Le lecteur n° <%=numLecteur%> est reconnu
<h3>Voici la liste des ouvrages disponibles à la réservation</h3>

<%
    String commande2="select * from livres where LIV_DejaReserve=0";
    ResultSet rs2;
    rs2=lien.executeQuery(commande2);
%>
<table width=700 border=1>
<tr>
  <td><font face=arial size=2 color=red>CodeLivre</td>
  <td><font face=arial size=2 color=red>NomAuteur</td>
  <td><font face=arial size=2 color=red>PrenomAuteur</td>
  <td><font face=arial size=2 color=red>Titre</td>
  <td><font face=arial size=2 color=red>Categorie</td>
  <td><font face=arial size=2 color=red>ISBN</td>
  <td><font face=arial size=2 color=blue></td>
</tr>
<%
    while (rs2.next()) {
      out.println("<tr>");
      out.println("  <td><font face=arial size=2>"+ rs2.getString("LIV_CodeLivre") + "</td>");
      out.println("  <td><font face=arial size=2>"+ rs2.getString("LIV_NomAuteur") + "</td>");
      out.println("  <td><font face=arial size=2>"+ rs2.getString("LIV_PrenomAuteur")+"</td>");
      out.println("  <td><font face=arial size=2>"+ rs2.getString("LIV_Titre")+ "</td>");
      out.println("  <td><font face=arial size=2>"+ rs2.getString("LIV_Categorie") +"</td>");
      out.println("  <td><font face=arial size=2>"+ rs2.getString("LIV_ISBN") +"</td>");
      out.println("  <td><font face=arial size=2><a href=\"reserverUnLivre.jsp?codeLivre="+rs2.getString("LIV_CodeLivre")+"&numLecteur="+numLecteur+"\">Réserver</a></td>");
      out.println("</tr>");
    }
%>
</td></tr></table>
<h3>Voici la liste de vos reservations</h3>

<%
    String commande3="select * from livres,emprunts where LIV_DejaReserve=1 and LIV_CodeLivre=EMP_CodeLivre and EMP_NumLecteur='"+numLecteur+"'";
    ResultSet rs3;
    rs3=lien.executeQuery(commande3);
%>
<table width=700 border=1>
<tr>
  <td><font face=arial size=2 color=red>CodeLivre</td>
  <td><font face=arial size=2 color=red>NomAuteur</td>
  <td><font face=arial size=2 color=red>PrenomAuteur</td>
  <td><font face=arial size=2 color=red>Titre</td>
  <td><font face=arial size=2 color=red>Categorie</td>
  <td><font face=arial size=2 color=red>ISBN</td>
</tr>
<%
    while (rs3.next()) {
      out.println("<tr>");
      out.println("  <td><font face=arial size=2>"+ rs3.getString("LIV_CodeLivre") + "</td>");
      out.println("  <td><font face=arial size=2>"+ rs3.getString("LIV_NomAuteur") + "</td>");
      out.println("  <td><font face=arial size=2>"+ rs3.getString("LIV_PrenomAuteur")+"</td>");
      out.println("  <td><font face=arial size=2>"+ rs3.getString("LIV_Titre")+ "</td>");
      out.println("  <td><font face=arial size=2>"+ rs3.getString("LIV_Categorie") +"</td>");
      out.println("  <td><font face=arial size=2>"+ rs3.getString("LIV_ISBN") +"</td>");
      out.println("</tr>");
    }
%>
</td></tr></table>
<% // 4/ Si le lecteur n'est pas reconnu, on propose un lien pour s'identifier, ou un formulaire pour s'enregistrer
   } else  {
%>
Le lecteur n'est pas reconnu<br>
Cliquez <a href="login.jsp">ici</a> pour tenter une nouvelle identification<br>
<br>
<h3>Enregistrement d'un lecteur</h3>
Si vous êtes un nouveau lecteur, veuillez vous enregistrer en remplissant le formulaire ci-dessous :<br>

<form name=enregistrement action="validelecteur.jsp" method=POST>
<table>
<tr>
   <td><font face=arial size=2>Nom : </td>
   <td><input type=texte name=nom size=20></td>
</tr>
<tr>
   <td><font face=arial size=2>Prénom : </td>

   <td><input type=texte name=prenom size=20></td>
</tr>
<tr>
   <td><font face=arial size=2>Mot de passe : </td>
   <td><input type=password name=motDePasse size=20></td>
</tr>
<tr>
   <td><font face=arial size=2>Adresse : </td>
   <td><input type=texte name=adresse size=20></td>
</tr>
<tr>
   <td><font face=arial size=2>Code Postal : </td>
   <td><input type=texte name=codePostal size=20></td>
</tr>
<tr>
   <td><font face=arial size=2>Ville : </td>
   <td><input type=texte name=ville size=20></td>
</tr>

</table>
<input type=submit value=valider>
</form>
<%
  }
%>
