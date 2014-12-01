/*
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 6 : Connaître l'internaute
#	Exercice 6.2 
#	Fichier : Lecteur.java
#	Class : Lecteur, composant utilisé par valideEmpruntLivres.jsp
#	Package : Exercices.Ch6
*/

package Ch6 ;

import java.io.Serializable ;
import java.util.Calendar ;
import java.text.DateFormat ;
public class Lecteur implements Serializable {

	//Définition des propriétés
	private String nomLecteur ;
	private String prenomLecteur ;
	private String numero ;
        private String motDePasse ;		
	private String adresse ;	
  	private String codePostal ;		
  	private String ville ;	  
	private String dateAnniversaire ;

	// Définition des méthodes d'accès en écriture
	// Le nom du lecteur
	public void setNomLecteur (String valeur) {
		nomLecteur =valeur;
	}
	// Le prénom de l'auteur 
	public void setPrenomLecteur (String valeur) {
		prenomLecteur =valeur;
	}
	// Le numéro de l'auteur 
	public void setNumero (String valeur) {
		numero = valeur;
	}
	// Le numéro et le nom de la rue
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
		
	// Définition des methodes d'accès en lecture
	// Le nom du lecteur
	public String getNomLecteur () {
		return nomLecteur;
	}
	// Le prénom de l'auteur 
	public String getPrenomLecteur () {
		return prenomLecteur;
	}
	// Le numéro de l'auteur 
	public String getNumero () {
		return numero;
	}
	// Le numéro et le nom de la rue
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

	// Méthode métier : Calculer la date D'anniversaire
	private Calendar calculDateAnniversaire () {
		Calendar dans1an=Calendar.getInstance();
		dans1an.add(dans1an.YEAR,1);
		return dans1an;
	}
}

