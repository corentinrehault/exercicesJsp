<!-- 
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 5 : Interroger une base de donn�es
#	Exercices 5.4 
#       JavaBeans : DBConnexion, DBLien (exercicesJSP/WEB-INF/classes/exercices/Ch5) 
-->
<!-- La page JSP manipule des objets de type Connection et Statement -->
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<html>
<head><title>R�server un livre</title></head>
<body>
<h1>R�server un livre</h1>

<!--// DBConnexion Bean-->
<jsp:useBean id="dbcnx" class="Exercices.Ch5.DBConnexion">
<!--// Code d'initialisation //-->
<jsp:setProperty name= "dbcnx" property="login" value="jspuser"/>
<jsp:setProperty name= "dbcnx" property="password" value="jspuser"/>
<jsp:setProperty name= "dbcnx" property="hostname" value="localhost"/>
<jsp:setProperty name= "dbcnx" property="port" value="3306"/>
<jsp:setProperty name= "dbcnx" property="nomDeLaBase" value="livrejsp"/>
</jsp:useBean>

<!--// DBLien Bean -->
<jsp:useBean id="dblien" class="Exercices.Ch5.DBLien"/>

<%
  // R�cupation de la connexion
  Connection cnx = dbcnx.getCnx();
  if (cnx == null) {
    out.println("<font color=red>Connexion impossible : " + cnx + "</font><br>");
  } 

  // Cr�ation du tube de communication avec la base de donn�es
  Statement lien = dblien.getLien(cnx);
  if (lien == null) {
    out.println("<font color=red>Communication impossible : "+ lien + "</font><br>");
  } 

  // Construction de la requ�te
  String commande="select * from livres where LIV_CodeLivre='"+request.getParameter("codeLivre")+"'";

  // Ex�cution de la requ�te
  ResultSet rs;
  rs=lien.executeQuery(commande);
%>
Vous d�sirez r�server le livre suivant :

<table border=1>
<%
  while (rs.next()) {
    out.println("<tr><td><font face=arial size=2 color=red>Code du livre</td>  <td><font face=arial size=2>"+ rs.getString("LIV_CodeLivre") + "</td></tr>");
    out.println("<tr><td><font face=arial size=2 color=red>Nom de l'Auteur</td>  <td><font face=arial size=2>"+ rs.getString("LIV_NomAuteur") + "</td></tr>");
    out.println("<tr><td><font face=arial size=2 color=red>Prenom de l'Auteur</td>  <td><font face=arial size=2>"+ rs.getString("LIV_PrenomAuteur")+"</td></tr>");
    out.println("<tr><td><font face=arial size=2 color=red>Titre</td>  <td><font face=arial size=2>"+ rs.getString("LIV_Titre")+ "</td></tr>");
    out.println("<tr><td><font face=arial size=2 color=red>Categorie</td>  <td><font face=arial size=2>"+ rs.getString("LIV_Categorie") +"</td></tr>");
    out.println("<tr><td><font face=arial size=2 color=red>ISBN</td>  <td><font face=arial size=2>"+ rs.getString("LIV_ISBN") +"</td></tr>");
    out.println("");
  }
%>
</td></tr></table>
<br>
<form name=reserverUnLivre action="confirmationReservation.jsp">
<!-- 
     Formulaire de confirmation de la r�servation, 
     les param�tres numLecteur codeLivre sont pass�s 
     avec un objet HTML hidden
-->
<input type=hidden name=numLecteur value="<%=request.getParameter("numLecteur")%>">
<input type=hidden name=codeLivre value="<%=request.getParameter("codeLivre")%>">
<input type=submit value="confirmer">
</form>


