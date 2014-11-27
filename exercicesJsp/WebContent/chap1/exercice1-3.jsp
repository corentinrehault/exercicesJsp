<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 1 : Concepts fondamentaux
#	Exercice 1-3
-->
<html> 
<head> 
<title> Exercice 1-3</title> 
</head>

<%! int a = 12,  b = 24 ; %> 

<P>Valeurs initiales :</P>
a : <%=a%> <BR>
b : <%=b%> <BR>

<%
  a = a + b ;
  b = a - b ;
  a = a - b;
%> 


<P>Valeurs finales :</P>
a : <%=a%> <BR>
b : <%=b%> <BR>


</body> 
</html>
