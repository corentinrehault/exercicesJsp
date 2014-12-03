package Ch5;

import java.io.Serializable;

public class Livre2 implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1073757746313889571L;
	
	private String titreLivre;
	private String prenomAuteur;
	private String nomAuteur;
	private String categorie;
	private long numISBN;
	private String codeLivre;
	boolean dejaReserve;
	/**
	 * @return the titreLivre
	 */
	public String getTitreLivre() {
		return titreLivre;
	}
	/**
	 * @param titreLivre the titreLivre to set
	 */
	public void setTitreLivre(String titreLivre) {
		this.titreLivre = titreLivre;
	}
	/**
	 * @return the prenomAuteur
	 */
	public String getPrenomAuteur() {
		return prenomAuteur;
	}
	/**
	 * @param prenomAuteur the prenomAuteur to set
	 */
	public void setPrenomAuteur(String prenomAuteur) {
		this.prenomAuteur = prenomAuteur;
	}
	/**
	 * @return the nomAuteur
	 */
	public String getNomAuteur() {
		return nomAuteur;
	}
	/**
	 * @param nomAuteur the nomAuteur to set
	 */
	public void setNomAuteur(String nomAuteur) {
		this.nomAuteur = nomAuteur;
	}
	/**
	 * @return the categorie
	 */
	public String getCategorie() {
		return categorie;
	}
	/**
	 * @param categorie the categorie to set
	 */
	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}
	/**
	 * @return the numISBN
	 */
	public long getNumISBN() {
		return numISBN;
	}
	/**
	 * @param numISBN the numISBN to set
	 */
	public void setNumISBN(long numISBN) {
		this.numISBN = numISBN;
	}
	/**
	 * @return the codeLivre
	 */
	public String getCodeLivre() {
		createCodeLivre();
		return codeLivre;
	}
	/**
	 * 
	 */
	private void createCodeLivre() {
		String nA = nomAuteur.substring(0, 2);
		String pA = prenomAuteur.substring(0, 2);
		String cL = categorie.substring(0, 2);
		String iS = String.valueOf(numISBN).substring(11, 13);
		codeLivre = nA + pA + cL + iS;	
	}
	/**
	 * @return the dejaReserve
	 */
	public boolean isDejaReserve() {
		return dejaReserve;
	}
	/**
	 * @param dejaReserve the dejaReserve to set
	 */
	public void setDejaReserve(boolean dejaReserve) {
		this.dejaReserve = dejaReserve;
	}
	
}