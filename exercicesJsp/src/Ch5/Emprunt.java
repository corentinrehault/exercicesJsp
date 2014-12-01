/*
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 5 : Interroger une base de données
#	Exercices 5.5.b
#	Fichier : Emprunt.java
#	Class : Emprunt
#	Package : Exercices.Ch5
*/

package Ch5 ;

import java.io.Serializable ;
import java.util.Calendar ;
import java.util.Date;
import java.text.DateFormat ;
public class Emprunt implements java.io.Serializable {

	//Définition des propriétés
	private String numeroEmprunt ;
	private String dateEmprunt ;
	private String dateRetourEmprunt ;
	private String codeLivre ;
	private String numeroLecteur ;
	
	// Définition des méthodes d'accès en écriture
	// La date de l'emprunt
	public void setDateEmprunt (Calendar date) {
		dateEmprunt = formatDate(date);
	}
	// L'adresse
	public void setCodeLivre (String valeur) {
		codeLivre =valeur;
	}	
	// La ville
	public void setNumeroLecteur (String valeur) {
		numeroLecteur =valeur;
	}

		
	// Définition des méthodes d'accès en lecture
	// La date de l'emprunt
	public String getDateEmprunt () {
		return dateEmprunt;
	}
	// Le code du livre
	public String getCodeLivre () {
		return codeLivre;
	}
	// Le numero du lecteur 
	public String getNumeroLecteur () {
		return numeroLecteur;
	}

	// La date de retour de l'emprunt
	public String getDateRetourEmprunt() {
		Calendar dans1mois;
		dans1mois = quelleDateRetour();
		dateRetourEmprunt= formatDate(dans1mois);
		return dateRetourEmprunt; 
	}
	
	// Le numero de l'emprunt
	public String getNumeroEmprunt() {
    numeroEmprunt=quelNumEmprunt();
		return numeroEmprunt; 
	}

	// Calculer la date D'anniversaire
	private Calendar quelleDateRetour () {
		Calendar dans1mois=Calendar.getInstance();
		dans1mois.add(dans1mois.MONTH,1);
		return dans1mois;

	}
        
        private String formatDate(Calendar date) {
		String sDate= date.get(Calendar.YEAR)+"-"+(date.get((Calendar.MONTH))+1)+"-"+date.get(Calendar.DATE);
                return sDate;
        }
	
	// Calculer le numéro unique de l'emprunt
	// Le numéro unique de l'emprunt est formé par la combinaison
	// des deux premières lettres du letters, du code du livre et
	// par le nombre de miliseconde écoulées depuis le 01/01/1970 au moment de l'instanciation
	// du javaBean
	private String quelNumEmprunt () {
    String numEmprunt;
    Date thedate=new Date();
    numEmprunt=numeroLecteur.substring(0,2)+codeLivre+thedate.getTime();
		return numEmprunt;
	}	
}
