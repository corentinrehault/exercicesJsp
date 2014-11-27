<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 1 : Concepts fondamentaux
#	Exercice 1-6 
-->
<html> 
<head> 
<title> Exercice 1-6</title> 
</head>

<%! 
  int valeur = 7, chiffre = 2, i1, i2 ;
  float f1, f2 ;
%>  

<%
  i1 = valeur / chiffre ;
  i2 = chiffre / valeur ;
  f1 = (float) (valeur / chiffre) ; 	
  f2 = (float) (valeur / chiffre) + 0.5f ;
%>


i1 : <%=i1%> <BR>
i2 : <%=i2%> <BR>
f1 : <%=f1%> <BR>
f2 : <%=f2%> <BR>

<%
  i1 = (int) f1 ;
  i2 = (int) f2 ;
  f1 = (float) valeur / (float) chiffre ; 
  f2 = (float) valeur / (float) chiffre + 0.5f ;
%>

__________________ <BR>
i1 : <%=i1%> <BR>
i2 : <%=i2%> <BR>
f1 : <%=f1%> <BR>
f2 : <%=f2%> <BR>


<%
  i1 = (int) f1 ;
  i2 = (int) f2 ;
%> 

__________________ <BR>
f1 : <%=f1%> <BR>
f2 : <%=f2%> <BR>




</body> 
</html>
