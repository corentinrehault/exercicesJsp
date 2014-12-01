<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 4 : Utiliser un objet Java dans un script
#	Exercice 4.4  Valide le lecteur dont les données sont passées en paramètre
#		      La validation s'effectue à travers le composant Lecteur
#       JavaBeans : Lecteur (exercicesJSP/WEB-INF/classes/exercices/Ch4)
-->

<jsp:useBean id="lecteur" class="Ch4.Lecteur"/>
<!-- On attribue les valeurs passées en POST en initialisant le composant Lecteur -->
<jsp:setProperty name="lecteur" property="nomLecteur" param="nom"/>
<jsp:setProperty name="lecteur" property="prenomLecteur" param="prenom"/>
<jsp:setProperty name="lecteur" property="adresse" param="adresse"/>
<jsp:setProperty name="lecteur" property="ville" param="ville"/>
<jsp:setProperty name="lecteur" property="codePostal" param="codePostal"/>

<html>
<body>
<h1><font face=arial>Validation d'un lecteur</h1>
<hr>

<table>
<tr>
   <!-- Les données sont récupérées du composant puis affichées -->
   <td><font face=arial size=2>Nom : </td>
   <td><font face=arial size=2 color=green><jsp:getProperty name= "lecteur" property="nomLecteur"/></td>
</tr>
<tr>
   <td><font face=arial size=2>Prénom : </td>
   <td><font face=arial size=2 color=green><jsp:getProperty name= "lecteur" property="prenomLecteur"/></td>
</tr>
<tr>
   <td><font face=arial size=2>Adresse : </td>
   <td><font face=arial size=2 color=green><jsp:getProperty name= "lecteur" property="adresse"/></td>
</tr>
<tr>
   <td><font face=arial size=2>Ville : </td>
   <td><font face=arial size=2 color=green><jsp:getProperty name= "lecteur" property="ville"/></td>
</tr>
<tr>
   <td><font face=arial size=2>Code Postal : </td>
   <td><font face=arial size=2 color=green><jsp:getProperty name= "lecteur" property="codePostal"/></td>
</tr>
<tr>
   <td><font face=arial size=2>Numéro : </td>
   <td><font face=arial size=2 color=green><jsp:getProperty name= "lecteur" property="numero"/></td>
</tr>
<tr>
   <td><font face=arial size=2 color=red>Date d'anniversaire : </td>
   <!-- Appel de la méthode métier du JavaBean Lecteur -->
   <td><font face=arial size=2 color=red><jsp:getProperty name="lecteur" property="dateAnniversaire" /></td>
</tr>
</table>


</body>
</html>
