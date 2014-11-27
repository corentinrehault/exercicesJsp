<!-- 
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 1 : Concepts fondamentaux
#	Exercice 1-7
-->
<html> 
<head> 
<title> Exercice 1-7</title> 
</head>

<%! 
  String valeur =  "7", chiffre = "2.5", resultat;
  float f ;
  int i1, i2 ;
%>  

<%
  // f est de type float, la division est possible telle quelle
  f = Integer.parseInt(valeur) / Float.parseFloat(chiffre) ;
  // la division d'un entier par un r�el donne un r�el
  // i1 et i2 sont des entiers, pour stocker le r�sulat r�el 
  // dans i1 ou i2, il faut transformer le type avec un cast.
  
  // Le cast peut �tre fait apr�s la division
  i1 = (int)(Integer.parseInt(valeur) / Float.parseFloat(chiffre))  ;
  // Le cast peut �tre fait avant la division
   i2 = Integer.parseInt(valeur) / (int) Float.parseFloat(chiffre) ; 
  resultat = chiffre + valeur ;
%>


f : <%=f%> <BR>
i1 : <%=i1%> <BR>
i2 : <%=i2%> <BR>
resultat : <%=resultat%> <BR>

</body> 
</html>
