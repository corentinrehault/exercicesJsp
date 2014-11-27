<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 1 : Concepts fondamentaux
#	Exercice 1-4 
-->
<html> 
<head> 
<title> Exercice 1-4</title> 
</head>

<%! 
  int i = 100 / 6 ;
  int j = 100 % 6 ; 
  double x = 2.0, y = 3.0;
%>

<P>Valeurs initiales :</P>
i : <%=i%> <BR>
j : <%=j%> <BR>
x : <%=x%> <BR>
y : <%=y%> <BR>

<%
  i = 5 % 8 ;
  j = 2 * ((i / 5) + (4 * (j - 3)) % (i + j - 2)) ;
  x = (3 * i - 2 * j) / (2 * x - y) ;
  y = (i - 3 * j) / (x + 2 * y) / (i - j) ;
%> 

<P>Valeurs finales :</P>
i : <%=i%> <BR>
j : <%=j%> <BR>
x : <%=x%> <BR>
y : <%=y%> <BR>



</body> 
</html>
