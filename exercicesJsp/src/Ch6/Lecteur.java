/*
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 6 : Conna�tre l'internaute
#	Exercice 6.2 
#	Fichier : Lecteur.java
#	Class : Lecteur, composant utilis� par valideEmpruntLivres.jsp
#	Package : Exercices.Ch6
*/

package Exercices.Ch6 ;

import java.io.Serializable ;
import java.util.Calendar ;
import java.text.DateFormat ;
public class Lecteur implements java.io.Serializable {

	//D�finition des propri�t�s
	private String nomLecteur ;
	private String prenomLecteur ;
	private String numero ;
        private String motDePasse ;		
	private String adresse ;	
  	private String codePostal ;		
  	private String ville ;	  
	private String dateAnniversaire ;

	// D�finition des methodes d�acc�s en �criture
	// Le nom du lecteur
	public void setNomLecteur (String valeur) {
		nomLecteur =valeur;
	}
	// Le pr�nom de l'auteur 
	public void setPrenomLecteur (String valeur) {
		prenomLecteur =valeur;
	}
	// Le numero de l'auteur 
	public void setNumero (String valeur) {
		numero = valeur;
	}
	// Le num�ro et le nom de la rue
	public void setAdresse (String valeur) {
	  adresse = valeur;
	}
	// Le code postal
  	public void setCodePostal (String valeur) {
    	  codePostal = valeur;
  	}
  	// Le nom de la ville
  	public void setVille (String valeur) {
    	  ville = valeur;
	}
	// Le mot de passe
  	public void setMotDePasse (String valeur) {
    	  motDePasse = valeur;
	}	
		
	// D�finition des methodes d�acc�s en lecture
	// Le nom du lecteur
	public String getNomLecteur () {
		return nomLecteur;
	}
	// Le pr�nom de l'auteur 
	public String getPrenomLecteur () {
		return prenomLecteur;
	}
	// Le numero de l'auteur 
	public String getNumero () {
		return numero;
	}
	// Le num�ro et le nom de la rue
	public String getAdresse () {
	  return adresse;
	}
	// Le code postal
  	public String getCodePostal () {
    	  return codePostal;
  	}
  	// Le nom de la ville
  	public String getVille () {
    	  return ville;
	}
	// Le mot de passe
	public String getMotDePasse () {
    	  return motDePasse;
	}	

	// Le code d'enregistrement
	public String getDateAnniversaire() {
		Calendar dans1An;
		dans1An = calculDateAnniversaire();
		dateAnniversaire= DateFormat.getDateInstance().format(dans1An.getTime());
		return dateAnniversaire; 
	}

	// M�thode m�tier : Calculer la date D'anniversaire
	private Calendar calculDateAnniversaire () {
		Calendar dans1an=Calendar.getInstance();
		dans1an.add(dans1an.YEAR,1);
		return dans1an;
	}
}

