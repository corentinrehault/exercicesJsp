package Ch6;

import java.io.Serializable;
import java.text.DateFormat;
import java.util.Calendar;

public class Lecteur2 implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3585126805533330830L;

	private String nomLecteur;
	private String prenomLecteur;
	private String adresse;
	private String codePostal;
	private String ville;
	private String idLecteur;
	private String dateAnniv;
	private String motDePasse;
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
	public String getCodePostal() {
		return codePostal;
	}
	/**
	 * @param codePostal the codePostal to set
	 */
	public void setCodePostal(String codePostal) {
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
		return idLecteur;
	}
	/**
	 * @param idLecteur
	 */
	public void setIdLecteur(String idLecteur) {
		this.idLecteur = idLecteur;
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
		dansUnAn.add(Calendar.YEAR, 1);
		return dansUnAn;
	}
	/**
	 * @return the motDePasse
	 */
	public String getMotDePasse() {
		return motDePasse;
	}
	/**
	 * @param motDePasse the motDePasse to set
	 */
	public void setMotDePasse(String motDePasse) {
		this.motDePasse = motDePasse;
	}

}