<!-- 
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 4 : Utiliser un objet Java dans un script
#	Exercice 4.4  Valide le lecteur dont les donn�es sont pass�es en param�tre
#		      La validation s'effectue � travers le composant Lecteur
#       JavaBeans : Lecteur (exercicesJSP/WEB-INF/classes/exercices/Ch4)
-->

<jsp:useBean id="lecteur" class="Ch4.Lecteur"/>
<!-- On attribue les valeurs pass�es en POST en initialisant le composant Lecteur -->
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
   <!-- Les donn�es sont r�cup�r�es du composant puis affich�es -->
   <td><font face=arial size=2>Nom : </td>
   <td><font face=arial size=2 color=green><jsp:getProperty name= "lecteur" property="nomLecteur"/></td>
</tr>
<tr>
   <td><font face=arial size=2>Pr�nom : </td>
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
   <td><font face=arial size=2>Num�ro : </td>
   <td><font face=arial size=2 color=green><jsp:getProperty name= "lecteur" property="numero"/></td>
</tr>
<tr>
   <td><font face=arial size=2 color=red>Date d'anniversaire : </td>
   <!-- Appel de la m�thode m�tier du JavaBean Lecteur -->
   <td><font face=arial size=2 color=red><jsp:getProperty name="lecteur" property="dateAnniversaire" /></td>
</tr>
</table>


</body>
</html>
