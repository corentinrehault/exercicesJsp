<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 5 : Interroger une base de données
#	Exercice 5.3.b
#       JavaBeans : DBConnexion, DBLien, Lecteur (exercicesJSP/WEB-INF/classes/exercices/Ch5) 
-->

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>

<jsp:useBean id="lecteur" class="Ch5.Lecteur"/>
<!-- On attribue les valeurs passées en POST en initialisant le composant Lecteur -->
<jsp:setProperty name="lecteur" property="nomLecteur" param="nom"/>
<jsp:setProperty name="lecteur" property="prenomLecteur" param="prenom"/>
<jsp:setProperty name="lecteur" property="adresse" param="adresse"/>
<jsp:setProperty name="lecteur" property="ville" param="ville"/>
<jsp:setProperty name="lecteur" property="codePostal" param="codePostal"/>
<jsp:setProperty name="lecteur" property="motDePasse" param="motDePasse"/>

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
<html>
<body>
<h1><font face=arial>Validation d'un lecteur</h1>
<hr>

<table>
<tr>
   <td><font face=arial size=2>Nom : </td>
   <td><font face=arial size=2 color=green><jsp:getProperty name= "lecteur" property="nomLecteur"/></td>
</tr>
<tr>
   <td><font face=arial size=2>Prénom : </td>
   <td><font face=arial size=2 color=green><jsp:getProperty name= "lecteur" property="prenomLecteur"/></td>
</tr>
<tr>
   <td><font face=arial size=2>Adresse : </td>
   <td><font face=arial size=2 color=green><jsp:getProperty name= "lecteur" property="adresse"/></td>
</tr>
<tr>
   <td><font face=arial size=2>Ville : </td>
   <td><font face=arial size=2 color=green><jsp:getProperty name= "lecteur" property="ville"/></td>
</tr>
<tr>
   <td><font face=arial size=2>Code Postal : </td>
   <td><font face=arial size=2 color=green><jsp:getProperty name= "lecteur" property="codePostal"/></td>
</tr>
<tr>
   <td><font face=arial size=2>Numéro : </td>
   <td><font face=arial size=2 color=green><jsp:getProperty name= "lecteur" property="numero"/></td>
</tr>
<tr>
   <td><font face=arial size=2 color=red>Date d'anniversaire : </td>
   <td><font face=arial size=2 color=red><jsp:getProperty name= "lecteur" property="dateAnniversaire" /></td>
</tr>
</table>

<%
  String insertLecteur="insert into Lecteurs values ('"+lecteur.getNumero()+"','"+lecteur.getNomLecteur()+"','"+lecteur.getPrenomLecteur()+"','"+lecteur.getAdresse()+"','"+lecteur.getVille()+"','"+lecteur.getCodePostal()+"','"+lecteur.getMotDePasse()+"')";
  lien.executeUpdate(insertLecteur);
%>
<font face=arial size=2>Vous êtes enregistré dans la base de la bibliothèque,<br>
vous avez maintenant la possibilité de réserver des livres ou vous <a href="login.jsp">identifiant ici</A>.
</body>
</html>
