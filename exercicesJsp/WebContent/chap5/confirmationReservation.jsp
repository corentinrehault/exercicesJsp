<!-- 
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 5 : Interroger une base de donn�es
#	Exercice 5.5
#       JavaBeans : DBConnexion, DBLien (exercicesJSP/WEB-INF/classes/exercices/Ch5) 
-->

<!-- La page JSP manipule des objets de type Connection et Statement -->
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.DateFormat" %>

<html>
<head><title>Confirmation d'une r�servation</title></head>
<body>
<h1>Confirmation de votre r�servation</h1>

<!-- // 1/ Connection � la base de donn�es -->
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


<!--// Emprunt Bean , Affectation des valeurs pass�es en param�tre -->

<jsp:useBean id="reservation" class="Exercices.Ch5.Emprunt">
<jsp:setProperty name= "reservation" property="codeLivre" param="codeLivre"/>
<jsp:setProperty name= "reservation" property="numeroLecteur" param="numLecteur"/>
</jsp:useBean>
<%
  // On calcule la date de la r�servation
  Calendar maintenant = Calendar.getInstance();
  reservation.setDateEmprunt(maintenant);

  // On calcule le numero de l'emprunt
  String numEmprunt=reservation.getNumeroEmprunt();
  // On calcule le numero de l'emprunt
  String dateDeRetour=reservation.getDateRetourEmprunt();
  // On r�cup�re la date de l'emprunt
  String dateEmprunt=reservation.getDateEmprunt();
  // On r�cup�re le code du livre
  String codeLivre=reservation.getCodeLivre();
  // on r�cup�re le numero du lecteur
  String numeroLecteur=reservation.getNumeroLecteur();

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

  // Construction de la requete d'ajout de l'emprunt
  String commande="insert into emprunts values ('"+numEmprunt+"','"+dateEmprunt+"','"+dateDeRetour+"','"+codeLivre+"','"+numeroLecteur+"')";
  // Execution de la requete
  lien.executeUpdate(commande);

  // Construction de la requete de modification de la table livres
  commande="update livres set LIV_DejaReserve=1 where LIV_CodeLivre='"+codeLivre+"'";
  // Execution de la requete
 lien.executeUpdate(commande);
%>

Votre r�servation est confirm�e sous le numero : <b><%=numEmprunt%></b><br>
<table>
<tr><td>Date de la r�servation : </td><td><%=formateDate(dateEmprunt)%></td></tr>
<tr><td>Date du retour  : </td><td><font color=red><%=formateDate(dateDeRetour)%></td></tr>
</table>
<br>
Vous pouvez revenir � la liste des livres disponible � la r�servation en cliquant <a href="gestionLecteur.jsp">ici</a>

<%!
  public String formateDate(String date) {
    String ladate [];
    Calendar unCalendrier = Calendar.getInstance();
    ladate=date.split("-");
    unCalendrier.set(Integer.parseInt(ladate[0]),Integer.parseInt(ladate[1])-1,Integer.parseInt(ladate[2]));
    return DateFormat.getDateInstance().format(unCalendrier.getTime()); 
  }
%>

