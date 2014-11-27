<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 1 : Concepts fondamentaux
#	Exercice 1-1-b 
-->
<html> 
<head> 
<title> Exercice 1-1-b</title> 
</head>

<%!
  int a = 5 ;
  int b = 7 ;
%>
<%
  b = a ;
  a = b ;
%>



a : <%=a%> <BR>
b : <%=b%> <BR>


</body> 
</html>
