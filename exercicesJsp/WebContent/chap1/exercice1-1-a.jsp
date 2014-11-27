<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 1 : Concepts fondamentaux
#	Exercice 1-1-a
-->
<html> 
<head> 
<title> Exercice 1-1-a </title> 
</head>

<%! 
 int a = 5 ;
 int b = 7 ;
%>
<% 
 a = b ;
 b = a ;
%>


a : <%=a%> <BR>
b : <%=b%> <BR>


</body> 
</html>
