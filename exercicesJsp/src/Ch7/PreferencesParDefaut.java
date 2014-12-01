package Ch7;

/*
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 7 : Les servlets ou les dessous cachés de JSP
#	Fichier : PreferencesParDefaut.java
#	Class : PreferencesParDefaut
*/
import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import Ch5.DBConnexion;
import Ch5.DBLien;

import java.sql.*;

public class PreferencesParDefaut extends HttpServlet {
  //Déclarationn des variables d'instance
  String fichier; 
  String categorie, couleurFond, couleurTxt;
  String categorieParDefaut, couleurFondParDefaut, couleurTxtParDefaut;
  String [] tableCouleur = {"black", "white", "red", "yellow", "green"};
  String [] tableCategorie = {"Policier", "Roman", "Junior", "Philosophie", "Science-fiction"};

  // Créer la liste de choix avec un élément de la liste préselectionné
  private String fSelect(String [] tab, String nom, String motSelectionne) {
    String chaine ="<select name="+nom+">";
    String OK="";
    for(int i=0 ; i< tab.length ; i++) {
     if (tab[i].equalsIgnoreCase(motSelectionne))  
       OK="selected"; 
     else 
       OK=""; 
     chaine +="<option "+ OK +" value=" + tab[i] +">" + tab[i] + "</option >";
    }
    chaine = chaine + "</select>";
    return chaine;
  }

  // Enregistrer les nouvelles préférences dans le fichier Ressource.txt
  private void sauvegarder() {
    try    {
       BufferedWriter bw = new BufferedWriter(new FileWriter(fichier));   
       bw.write(categorie,  0, categorie.length());
       bw.newLine();
       bw.write(couleurFond, 0, couleurFond.length());
       bw.newLine();
       bw.write(couleurTxt, 0, couleurTxt.length());
       bw.close();
    }
    catch(Exception e)   {
      System.out.println("Erreur de destruction "+e);
    } 
  }

  // Afficher la liste des livres en fonction de la requête passée en paramètre
  private String afficheListeLivres(ResultSet rs, String police) {
    String chaine="";
    if (rs == null) {
      chaine="<font color=red>Pas de r�sultat : "+rs+"</font>";
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

  // init() est appelée avant le traitement des requêtes 
  public void init(ServletConfig config) throws ServletException  {
    super.init(config);
    try    {
      // Recherche le parametre nomFichier défini dans /WEB-INF/web.xml
      fichier = config.getInitParameter("nomFichier"); 
      String mot="";
      int i = 1;
      // Si le fichier contenant les parametres a été trouvé  
      if (fichier != null) {  
         // Lire  le fichier d'initialisation  ligne par ligne  
        BufferedReader br = new BufferedReader(new FileReader(fichier));         
        while ((mot = br.readLine()) != null) {   
          System.out.println("mot : "+mot);          
          switch(i) {
             // La première ligne définie la catégorie par défaut
            case 1 : 
              categorieParDefaut = mot;
            break;
            // La deuxième ligne définie la couleur de fond par défaut
            case 2 : 
              couleurFondParDefaut =  mot;
            break;
            // La troisième ligne définie la couleur du texte par défaut
           case 3 : 
             couleurTxtParDefaut =  mot;
           break;
          } 
          i++;   
        }
        br.close();
      } 
    }
    catch(Exception e)   {
      System.out.println(e);
    }    
  }

  // destroy() est appelée lorsque le serveur est arrêté proprement (shutdown)
  public void destroy () {
    // Enregistrer les informations avant la destruction de la servlet
    sauvegarder();
    super.destroy();
}

  // doGet() est appelée lorsque la requête est passée en mode GET
  public void doGet( HttpServletRequest req, HttpServletResponse rep)throws IOException, ServletException {
   // Affiche le formulaire de saisie des préférence en fonction des données lues dans le fichier Ressources.txt  
   rep.setContentType("text/html");
   PrintWriter pw = rep.getWriter();
   pw.println("<html>");
   pw.println("<head>");
   pw.println("<title> Servlet Preferences par defaut </title>");
   pw.println("</head>");
   pw.println("<body>");
   pw.println("<table width=700><tr><td>");
   pw.println("<h1><font face=arial color="+couleurTxt+">Préférences par défaut</h1>");
   // Action : appeler la m�me servlet en passant les param�tres en POST
   pw.println("<form name=ident action=http://localhost:8080/exercicesJSP/servlet/PreferencesParDefaut method=POST>");

   // Saisie des pr�f�rences par d�faut -->
   pw.println("<h3><font face=arial>Catégorie préférée : </h3>");
   pw.println("<table>");
   pw.println("<tr><td>");
   pw.println(fSelect(tableCategorie,"categorie", categorieParDefaut));
   pw.println("</tr></td></table>");
   pw.println("<h3><font face=arial>Choisissez la couleur de :</h3>");
   pw.println("<table>");
   pw.println("<tr>");
   pw.println("  <td><font face=arial size=2>Fond :</td><td>");
   pw.println(fSelect(tableCouleur, "couleurFond", couleurFondParDefaut));
   pw.println("  </td>");
   pw.println("</tr>");
   pw.println("<tr>");
   pw.println("  <td><font face=arial size=2>Police :</td><td>");
   pw.println(fSelect(tableCouleur, "couleurTxt", couleurTxtParDefaut ));
   pw.println("  </td>");
   pw.println("</tr>");
   pw.println("</table><BR>");
   pw.println("<input type=submit value=Vérifier>");
   pw.println("</form>");
   pw.println("</td></tr></table>");
   pw.println("</body>");
   pw.println("</html>");
  }  
 

  // doPost() est appelée lorsque la requête est passée en mode POST
  public void doPost( HttpServletRequest req, HttpServletResponse rep)throws IOException, ServletException {
    // Se connecter à la base de données
    DBConnexion dbcnx = new DBConnexion();
    dbcnx.setLogin("jspuser");
    dbcnx.setPassword("jspuser");
    dbcnx.setHostname("localhost");
    dbcnx.setPort("3306");
    dbcnx.setNomDeLaBase("livrejsp");
    DBLien dblien = new DBLien();
    Connection  cnx = dbcnx.getCnx();

    rep.setContentType("text/html");
    PrintWriter pw = rep.getWriter();
    if (cnx == null) {
      pw.println("<font color=red>Erreur : " + cnx + "</font>");
    }
    Statement lien = dblien.getLien(cnx);
    if (lien == null) {
      pw.println("<font color=red>Erreur : " + lien + "</font>");
    }
    categorie = categorieParDefaut;
    couleurFond = couleurFondParDefaut; 
    couleurTxt = couleurTxtParDefaut;
	 
    // Tester si l'utilisateur vient de la page formulaire
    if (req.getParameter("categorie") != null) {
      categorie = req.getParameter("categorie");
      couleurFond = req.getParameter("couleurFond");
      couleurTxt = req.getParameter("couleurTxt");
    } 

    //<!--// Afficher la page en fonction des préférences -->
    pw.println("<html>");
    pw.println("<body bgcolor="+couleurFond+">");
    pw.println("<table width=700><tr><td>");
    pw.println("<h1><font face=arial color="+couleurTxt+">Bonjour, </h1>");
    pw.println("<h3><font face=arial color="+couleurTxt+">Les livres correspondant à votre catégorie préférée : "+categorie+" </h3>");

    // Construction de la requête pour la catégorie préférée
    String livresPerso="select * from livres where LIV_Categorie='" + categorie+ "'";
    String chaineResultat;
    ResultSet rs;
    try     {
     rs = lien.executeQuery(livresPerso);
     chaineResultat=afficheListeLivres(rs, couleurTxt);
     pw.println(chaineResultat);
    } catch ( Exception e ) {
       pw.println ("<br><font face=arial color=black><b>Erreur : <br></b></font>" + e.getMessage());  
    }
    pw.println("<h3><font face=arial color="+couleurTxt+">Les autres livres</h3>");

    // Construction de la requête pour les autres livres
    String livres="select * from livres where LIV_Categorie<>'" + categorie +"'";
    try     {
      rs = lien.executeQuery(livres);
      chaineResultat=afficheListeLivres(rs, couleurTxt);
      pw.println(chaineResultat);
    } catch ( Exception e ) {
       pw.println ("<br><font face=arial color=black><b>Erreur : <br></b></font>" + e.getMessage());  
    }
    pw.println("</td></tr></table>");
    pw.println("</body>");
    pw.println("</html>");
  }
}

