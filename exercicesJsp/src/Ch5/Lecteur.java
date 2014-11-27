/*
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 5 : Interroger une base de données
#	Exercice 5.2.b  Composant utilisé par le script valideLecteur.jsp
#	Fichier : Lecteur.java
#	Class : Lecteur
#	Package : Exercices.Ch5
*/
package Exercices.Ch5 ;

import java.io.Serializable ;
import java.util.Calendar ;
import java.util.Date;
import java.text.DateFormat ;
public class Lecteur implements java.io.Serializable {

	//Définition des propriétés
	private String nomLecteur ;
	private String prenomLecteur ;
	private String adresse ;
	private String ville ;
	private String codePostal ;
	private String numero ;
	private String dateAnniversaire ;
	private String motDePasse ;

	// Définition des méthodes d'accès en écriture
	// Le nom du lecteur
	public void setNomLecteur (String valeur) {
		nomLecteur =valeur;
	}
	// Le prénom du lecteur
	public void setPrenomLecteur (String valeur) {
		prenomLecteur =valeur;
	}
	// L'adresse
	public void setAdresse (String valeur) {
		adresse =valeur;
	}	
	// La ville
	public void setVille (String valeur) {
		ville =valeur;
	}
	// Le code postal
	public void setCodePostal (String valeur) {
		codePostal =valeur;
	}	
	// Le mot de passe
	public void setMotDePasse (String valeur) {
		motDePasse =valeur;
	}		
	// Définition des méthodes d'accès en lecture
	// Le nom du lecteur
	public String getNomLecteur () {
		return nomLecteur;
	}
	// Le prénom du lecteur 
	public String getPrenomLecteur () {
		return prenomLecteur;
	}
	// Le numéro du lecteur 
	public String getNumero () {
		return calculNumLecteur();
	}
	// L'adresse
	public String getAdresse () {
		return adresse;
	}	
	// La ville
	public String getVille () {
		return ville;
	}
	// Le code postal
	public String getCodePostal () {
		return codePostal;
	}		
	// Le Mot de passe
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

	// Calculer la date D'anniversaire
	private Calendar calculDateAnniversaire () {
		Calendar dans1an=Calendar.getInstance();
		dans1an.add(dans1an.YEAR,1);
		return dans1an;

	}
	
	// Calculer le numéro unique du lecteur
	// Le numéro unique du lecteur est formé par la combinaison
	// des deux premières lettre de son prénoms suivies
	// par le nombre de miliseconde écoulées depuis le 01/01/1970 au moment de l'instanciation
	// du javaBean
	private String calculNumLecteur () {
    String numLecteur;
    Date thedate=new Date();
    numLecteur=nomLecteur.substring(0,2)+thedate.getTime();
		return numLecteur;
	}	
}
