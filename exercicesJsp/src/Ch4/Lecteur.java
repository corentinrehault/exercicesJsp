/*
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exercice Chapitre 4 : Utiliser un objet Java dans un script
#	Exercice 4.3  Composant utilis� par le script valideLecteur.jsp
#	Fichier : Lecteur.java
#	Class : Lecteur
#	Package : Exercices.Ch4
*/

package Exercices.Ch4 ;

import java.io.Serializable ;
import java.util.Calendar ;
import java.util.Date;
import java.text.DateFormat ;
public class Lecteur implements java.io.Serializable {

	//4.3.a D�finition des propri�t�s
	private String nomLecteur ;
	private String prenomLecteur ;
	private String adresse ;
	private String ville ;
	private String codePostal ;
	private String numero ;
	private String dateAnniversaire ;

	// 4.3.b D�finition des methodes d�acc�s en �criture
	// Le nom du lecteur
	public void setNomLecteur (String valeur) {
		nomLecteur =valeur;
	}
	// Le pr�nom du lecteur
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
	// 4.3.c D�finition des methodes d�acc�s en lecture
	// Le nom du lecteur
	public String getNomLecteur () {
		return nomLecteur;
	}
	// Le pr�nom du lecteur 
	public String getPrenomLecteur () {
		return prenomLecteur;
	}
	// Le numero du lecteur 
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


	// 4.3.d Le code d'enregistrement
	public String getDateAnniversaire() {
		Calendar dans1An;
		dans1An = calculDateAnniversaire();
		dateAnniversaire= DateFormat.getDateInstance().format(dans1An.getTime());
		return dateAnniversaire; 
	}

	// 4.3.d Calculer la date D'anniversaire
	private Calendar calculDateAnniversaire () {
		Calendar dans1an=Calendar.getInstance();
		dans1an.add(dans1an.YEAR,1);
		return dans1an;

	}
	
	// Calculer le numero unique du lecteur
	// Le numero unique du lecteur est form� par la combinaison
	// des deux premieres lettre de son pr�noms suivies
	// par le nombre de miliseconde �coul�es depuis le 01/01/1970 au moment de l'instanciation
	// du javaBean
	private String calculNumLecteur () {
    String numLecteur;
    Date thedate=new Date();
    numLecteur=nomLecteur.substring(0,2)+thedate.getTime();
		return numLecteur;
	}	
}
