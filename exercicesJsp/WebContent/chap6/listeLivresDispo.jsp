<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 6 : Connaître l'internaute
#	Exercice 6.2
#       JavaBeans : DBConnexion, DBLien (exercicesJSP/WEB-INF/classes/exercices/Ch5) 
-->

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DateFormat" %>

<!--// Connexion à la base de donnée -->
<jsp:useBean id="dbcnx" class="Ch5.DBConnexion">
<jsp:setProperty name="dbcnx" property="login" value="userjsp"/>
<jsp:setProperty name="dbcnx" property="password" value="userjsp"/>
<jsp:setProperty name="dbcnx" property="hostname" value="localhost"/>
<jsp:setProperty name="dbcnx" property="port" value="3306"/>
<jsp:setProperty name="dbcnx" property="nomDeLaBase" value="livrejsp"/>
</jsp:useBean>
<jsp:useBean id="dblien" class="Ch5.DBLien"/>
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
<jsp:useBean id="lecteur" class="Ch6.Lecteur" scope="session"/>
<%
  // Variable de test
  int empruntPossible=0;
%>

<html>
<body>
<table width=700><tr><td>
<h1><font face=arial>Réservation en ligne</h1>

<%
  // Tester les valeurs passées en paramètre depuis loginEmprunts.jsp
  // Enregistrement du lecteur
  if (request.getParameter("nomLecteur")!=null) {
  
    // Récupérer les paramètres d'identification
    String nomLecteur = request.getParameter("nomLecteur");
    String motDePasse = request.getParameter("motDePasse");
    // Rechercher un lecteur portant le nom et ayant le même mot de passe 
    // que ceux passés en paramètre 
    String nomBD ="select * from lecteurs where LEC_NomLecteur='"+nomLecteur+"' and LEC_MotDePasse='"+motDePasse+"'";
    ResultSet rs;
    rs = lien.executeQuery(nomBD);  
    // Si le lecteur existe dans la base de données
    if (rs.first()) {
        // enregistrer toutes les informations dans l'objet lecteur 
      lecteur.setNumero(rs.getString("LEC_NumLecteur"));
      lecteur.setNomLecteur(rs.getString("LEC_NomLecteur"));
      lecteur.setPrenomLecteur(rs.getString("LEC_PrenomLecteur"));
      lecteur.setAdresse(rs.getString("LEC_Adresse"));
      lecteur.setCodePostal(rs.getString("LEC_CodePostal"));
      lecteur.setVille(rs.getString("LEC_Ville"));
      lecteur.setMotDePasse(rs.getString("LEC_MotDePasse"));
      out.println(afficheFormulaireEmprunt(cnx,lien));
    } else {
    // Le lecteur n'est pas reconnu de la base de données
%>
    <font size=2>Lecteur inconnu, veuillez saisir à nouveau votre nom et votre mot de passe <a href="loginEmprunts.jsp">ici</a>.
<%
    }
    // Request.getParameter est vide mais le lecteur peut provenir de la page de confirmation d'un emprunt
   } else if (lecteur.getNumero()!=null) {
      out.println(afficheFormulaireEmprunt(cnx,lien));
   // Le lecteur n'est pas connu et ne vient pas de la page d'identification
   } else {
%>
<font size=2>Vous devez vous <a href="loginEmprunts.jsp">identifier</a> pour pouvoir emprunter
<%    
  }
%>

<%!
  // Fonction d'affichage du formulaire d'emprunt
  public String afficheFormulaireEmprunt(Connection cnx, Statement lien) {
      // Construction de la requete
      // ATTENTION, on n'affiche que les livres disponibles à la réservation
      String liste="select * from livres where LIV_DejaReserve=0";
      String chaineResultat=null;
      ResultSet rs=null;
      try {
        rs = lien.executeQuery(liste);
      } catch (Exception e) {}
      chaineResultat="<h3><font face=arial>Livres disponibles : </h3>";
      chaineResultat=chaineResultat+afficheListeLivres(rs, "black");
      chaineResultat=chaineResultat+"<h3><font face=arial>Formulaire de réservation </h3>";
      chaineResultat=chaineResultat+"<form name=empruntLivre action=valideEmpruntLivres.jsp method=POST>";
      chaineResultat=chaineResultat+"<table>";
      chaineResultat=chaineResultat+"<tr><td>Code du livre</td><td><input type=text name=codeLivre></td></tr>";
      chaineResultat=chaineResultat+"</table>";
      chaineResultat=chaineResultat+"<input type=submit value=Réserver>";       
      return chaineResultat;
  }
%>

<%!
  // Fonction d'affichage des livres selon la requête transmise 
  public String afficheListeLivres(ResultSet rs, String police) {
    String chaine="";
    if (rs == null) {
      chaine="<font color=red>Pas de résultat : "+rs+"</font>";
    } else {
      try {
         chaine="<table width=700 border=1>";
         chaine=chaine+"<tr>";
         chaine=chaine+"  <td><font face=arial size=2 color=red>CodeLivre </td>";
         chaine=chaine+"  <td><font face=arial size=2 color=red>NomAuteur </td>";
         chaine=chaine+"  <td><font face=arial size=2 color=red>PrenomAuteur </td> ";
         chaine=chaine+"  <td><font face=arial size=2 color=red>Titre</td>";
         chaine=chaine+"  <td><font face=arial size=2 color=red>Categorie </td>";
         chaine=chaine+"  <td><font face=arial size=2 color=red>ISBN</td>";
         chaine=chaine+"</tr>";
         while (rs.next()) {
           chaine=chaine+"<tr>";
           chaine=chaine+"  <td><font face=arial size=2 color=" + police + ">" + rs.getString("LIV_CodeLivre") + "</td>";
           chaine=chaine+"  <td><font face=arial size=2 color=" + police + ">" + rs.getString("LIV_NomAuteur") + "</td>";
           chaine=chaine+"  <td><font face=arial size=2 color=" + police + ">" + rs.getString("LIV_PrenomAuteur") + "</td>";
           chaine=chaine+"  <td><font face=arial size=2 color=" + police + ">" + rs.getString("LIV_Titre") + "</td>";
           chaine=chaine+"  <td><font face=arial size=2 color=" + police + ">" + rs.getString("LIV_Categorie") + "</td>";
           chaine=chaine+"  <td><font face=arial size=2 color=" + police + ">" + rs.getString("LIV_ISBN") + "</td>";
           chaine=chaine+"</tr>";
  	 }
         chaine=chaine+"</table>";
      } catch (Exception e) {
      chaine = e.getMessage();
     }
    }
    return chaine;
  } 
%>

