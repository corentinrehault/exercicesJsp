package Ch4;

import java.io.Serializable;
import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;

public class Lecteur2 implements Serializable {

	private String nomLecteur;
	private String prenomLecteur;
	private String adresse;
	private int codePostal;
	private String ville;
	private String idLecteur;
	private String dateAnniv;
	/**
	 * @return the nomLecteur
	 */
	public String getNomLecteur() {
		return nomLecteur;
	}
	/**
	 * @param nomLecteur the nomLecteur to set
	 */
	public void setNomLecteur(String nomLecteur) {
		this.nomLecteur = nomLecteur;
	}
	/**
	 * @return the prenomLecteur
	 */
	public String getPrenomLecteur() {
		return prenomLecteur;
	}
	/**
	 * @param prenomLecteur the prenomLecteur to set
	 */
	public void setPrenomLecteur(String prenomLecteur) {
		this.prenomLecteur = prenomLecteur;
	}
	/**
	 * @return the adresse
	 */
	public String getAdresse() {
		return adresse;
	}
	/**
	 * @param adresse the adresse to set
	 */
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	/**
	 * @return the codePostal
	 */
	public int getCodePostal() {
		return codePostal;
	}
	/**
	 * @param codePostal the codePostal to set
	 */
	public void setCodePostal(int codePostal) {
		this.codePostal = codePostal;
	}
	/**
	 * @return the ville
	 */
	public String getVille() {
		return ville;
	}
	/**
	 * @param ville the ville to set
	 */
	public void setVille(String ville) {
		this.ville = ville;
	}
	/**
	 * @return the idLecteur
	 */
	public String getIdLecteur() {
		creeIdLecteur();
		return idLecteur;
	}
	/**
	 * 
	 */
	private void creeIdLecteur() {
		Date maintenant = new Date();
		String nL = nomLecteur.substring(0, 2);
		idLecteur = nL + String.valueOf(maintenant.getTime());
	}
	/**
	 * @return the dateAnniv
	 */
	public String getDateAnniv() {
		Calendar dansUnAn = calculDateAnniv();
		dateAnniv = DateFormat.getDateInstance().format(dansUnAn.getTime());
		return dateAnniv;
	}
	/**
	 * 
	 */
	private Calendar calculDateAnniv() {
		Calendar dansUnAn = Calendar.getInstance();
		dansUnAn.add(dansUnAn.YEAR, 1);
		return dansUnAn;
	}

}