<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 1 : Concepts fondamentaux
#	Exercice 1-2 
-->
<html> 
<head> 
<title> Exercice 1-2</title> 
</head>

<%! int a = 12,  b = 24, t ; %> 

<P>Valeurs initiales :</P>
a : <%=a%> <BR>
b : <%=b%> <BR>
t : <%=t%> <BR>

<% 
   t = a ; 
   a = b ; 
   b = t ;
%>


<P>Valeurs finales :</P>

a : <%=a%> <BR>
b : <%=b%> <BR>
t : <%=t%> <BR>

</body> 
</html>
