/*
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 4 : Utiliser un objet Java dans un script
#	Exercice 4.1 Composant utilisé par le script valideLivre.jsp 
#	Fichier : Livre.java
#	Class : Livre
#	Package : Exercices.Ch4
*/
package Exercices.Ch4 ;

import java.io.Serializable ;
public class Livre implements java.io.Serializable {

	//4.1.a Définition des propriétés
	private String titre;
	private String categorie ;
	private String isbn ;
	private String nomAuteur ;
	private String prenomAuteur ;
	private String code ;

	// 4.1.b Définition des methodes d'accès en écriture
	// Le Titre
	public void setTitre (String valeur) {
		titre = valeur ;
	}
	// La catégorie
	public void setCategorie (String valeur) {
		categorie = valeur;
	}
	// Le numéro ISBN
	public void setIsbn (String valeur) {
		isbn =valeur;
	}
	// Le nom de l'auteur 
	public void setNomAuteur (String valeur) {
		nomAuteur =valeur;
	}
	// Le prénom de l'auteur 
	public void setPrenomAuteur (String valeur) {
		prenomAuteur =valeur;
	}
	
	// 4.1.c Définition des methodes d'accès en lecture
	//Le titre
	public String getTitre () {
		return titre;
	}
	// La catégorie
	public String getCategorie () {
		return categorie;
	}
	// Le numéro ISBN
	public String getIsbn () {
		return isbn;
	}
	// Le nom de l'auteur 
	public String getNomAuteur () {
		return nomAuteur;
	}
	// Le prénom de l'auteur 
	public String getPrenomAuteur () {
		return prenomAuteur;
	}
	// Le code d'enregistrement
	public String getCode() {
		code= calculCode ();
		return code;
	}

	// 4.1.d Calculer le code d'enregistrement
	private String calculCode () {
		String debutNom;
		String debutPrenom;
		String debutCategorie;
		int longueurIsbn;
		String finIsbn;

		debutNom=nomAuteur.substring(0,2);
		debutPrenom=prenomAuteur.substring(0,2);
		debutCategorie=categorie.substring(0,2);
		longueurIsbn=isbn.length();
		finIsbn=isbn.substring((longueurIsbn-2),longueurIsbn);
		return debutNom+debutPrenom+debutCategorie+finIsbn;

	}
}
