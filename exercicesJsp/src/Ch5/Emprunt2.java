package Ch5;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

public class Emprunt2 implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 9176977803665013906L;

	private String numEmprunt;
	private String dateEmprunt;
	private String dateRetour;
	private String codeLivre;
	private String numLecteur;
	/**
	 * @return the dateEmprunt
	 */
	public String getDateEmprunt() {
		return dateEmprunt;
	}
	/**
	 * @param dateEmprunt the dateEmprunt to set
	 */
	public void setDateEmprunt(Calendar date) {
		dateEmprunt = formatDate(date);
	}
	/**
	 * @return the codeLivre
	 */
	public String getCodeLivre() {
		return codeLivre;
	}
	/**
	 * @param codeLivre the codeLivre to set
	 */
	public void setCodeLivre(String codeLivre) {
		this.codeLivre = codeLivre;
	}
	/**
	 * @return the numLecteur
	 */
	public String getNumLecteur() {
		return numLecteur;
	}
	/**
	 * @param numLecteur the numLecteur to set
	 */
	public void setNumLecteur(String numLecteur) {
		this.numLecteur = numLecteur;
	}
	/**
	 * @return the numEmprunt
	 */
	public String getNumEmprunt() {
		quelNumEmprunt();
		return numEmprunt;
	}
	/**
	 * 
	 */
	private void quelNumEmprunt() {
		Date maintenant = new Date();
		String nL = numLecteur.substring(0, 2);
		String cL = codeLivre.substring(0, 2);
		numEmprunt = nL + cL + String.valueOf(maintenant.getTime());
	}
	/**
	 * @return the dateRetour
	 */
	public String getDateRetour() {
		Calendar dans1mois;
		dans1mois = quelleDateRetour();
		dateRetour= formatDate(dans1mois);
		return dateRetour;
	}
	/**
	 * @return 
	 * 
	 */
	private Calendar quelleDateRetour() {
		Calendar dansUnMois = Calendar.getInstance();
		dansUnMois.add(Calendar.MONTH, 1);
		return dansUnMois;
	}

	private String formatDate(Calendar date) {
		String sDate = date.get(Calendar.YEAR) + "-" + (date.get((Calendar.MONTH)) + 1) + "-" + date.get(Calendar.DATE);
		return sDate;

	}

}