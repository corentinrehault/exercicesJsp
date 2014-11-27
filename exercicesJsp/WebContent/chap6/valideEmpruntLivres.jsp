<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 6 : Connaître l'internaute
#	Exercice 6.2 
#       JavaBeans : DBConnexion, DBLien, Lecteur (exercicesJSP/WEB-INF/classes/exercices/Ch5) 
# 	Description : Valide la réservation d'un livre
-->

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DateFormat" %>
<!--// Connexion à la base de donnée -->
<jsp:useBean id="dbcnx" class="Exercices.Ch5.DBConnexion">
<jsp:setProperty name="dbcnx" property="login" value="jspuser"/>
<jsp:setProperty name="dbcnx" property="password" value="jspuser"/>
<jsp:setProperty name="dbcnx" property="hostname" value="localhost"/>
<jsp:setProperty name="dbcnx" property="port" value="3306"/>
<jsp:setProperty name="dbcnx" property="nomDeLaBase" value="livrejsp"/>
</jsp:useBean>
<jsp:useBean id="dblien" class="Exercices.Ch5.DBLien"/>
<%
  Connection cnx = dbcnx.getCnx();
  if (cnx == null) {
    out.println("<font color=red>Erreur : " + cnx + "</font>");
  }
  Statement lien = dblien.getLien(cnx);
  if (lien == null) {
    out.println("<font color=red>Erreur : " + lien + "</font>");
  }
%>

<%// On instancie le bean de session Lecteur %>
<jsp:useBean id="lecteur" class="Exercices.Ch6.Lecteur" scope="session"/>


<%
  // Reprise du code de l'exercice du chapitre 5
%>

<jsp:useBean id="emprunt" class="Exercices.Ch5.Emprunt">
<jsp:setProperty name= "emprunt" property="codeLivre" param="codeLivre"/>
<jsp:setProperty name= "emprunt" property="numeroLecteur" value="<%=lecteur.getNumero()%>"/>
</jsp:useBean>
<html>
<head><title>Confirmation d'un emprunt</title></head>
<body>
<h1>Confirmation d'un emprunt</h1>
<%
// On verifie si le livre existe dans la base des livres
// On récupère le code du livre
String codeLivre=emprunt.getCodeLivre();
String commande="select * from livres where LIV_CodeLivre='"+codeLivre+"'";
ResultSet rs;
rs = lien.executeQuery(commande);
if (rs.first()) {

  // On calcule la date de l'emprunt
  Calendar maintenant = Calendar.getInstance();
  emprunt.setDateEmprunt(maintenant);

  // On calcule le numero de l'emprunt
  String numEmprunt=emprunt.getNumeroEmprunt();
  // On calcul le numero de l'emprunt
  String dateDeRetour=emprunt.getDateRetourEmprunt();
  // On récupère la date de l'emprunt
  String dateEmprunt=emprunt.getDateEmprunt();
  // on récupère le numéro du lecteur
  String numeroLecteur=emprunt.getNumeroLecteur();

  // Construction de la requête d'ajout de l'emprunt
  commande="insert into emprunts values ('"+numEmprunt+"','"+dateEmprunt+"','"+dateDeRetour+"','"+codeLivre+"','"+numeroLecteur+"')";
  // Execution de la requête
  lien.executeUpdate(commande);

  // Construction de la requête de modification de la table livres
  commande="update livres set LIV_DejaReserve=1 where LIV_CodeLivre='"+codeLivre+"'";
  // Execution de la requête
  lien.executeUpdate(commande);
%>
Votre réservation est confirmée sous le numéro : <b><%=numEmprunt%></b><br>
<table>
<tr><td>Date de l'emprunt : </td><td><%=formateDate(dateEmprunt)%></td></tr>
<tr><td>Date du retour  : </td><td><font color=red><%=formateDate(dateDeRetour)%></td></tr>
</table>



<%  
  int nbrEmprunt=0;
  // gestion du nombre maximum d'emprunts
  if (session.getAttribute("nbrEmprunt")==null) {
    nbrEmprunt=0;
  } else {
    nbrEmprunt=Integer.parseInt((String)session.getAttribute("nbrEmprunt"));
  }
  nbrEmprunt++;
  session.setAttribute("nbrEmprunt",""+nbrEmprunt);

  // Affichage d'un message d'erreur en cas de quota dépassé.
  if (Integer.parseInt((String)session.getAttribute("nbrEmprunt"))<=2) {
%>
<br>
Vous pouvez réserver un nouveau livre <a href="listeLivresDispo.jsp">ici</a>
<%
  } else {
%>
<h3>Attention !!</h3>
Vous ne pouvez pas emprunter plus de 3 livres à la fois. 
<%
  }
  
  
} else {
// Le livre n'existe pas dans la base
%>
Le livre n'existe pas dans la bibliothèque, pour effectuer un emprunt cliquez <a href="listeLivresDispo.jsp">ici</a>
<%
}
%>

<%!
public String formateDate(String date) {
  String ladate [];
  Calendar unCalendrier = Calendar.getInstance();
  ladate=date.split("-");
  unCalendrier.set(Integer.parseInt(ladate[0]),Integer.parseInt(ladate[1])-1,Integer.parseInt(ladate[2]));
  return DateFormat.getDateInstance().format(unCalendrier.getTime());
}
%>