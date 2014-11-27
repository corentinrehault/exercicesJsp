<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exercices Chapitre 1 : Concepts fondamentaux
#	Exercice 1-5
-->
<html> 
<head> 
<title> Exercice 1-5-a et 1-5-b</title> 
</head>

<%! 
  int n = 10, p = 7, r = 8, s = 7, t = 21;
  float x = 2.0f ;
%>  

<P>a. : </P>
x + n % p : <%= x + n % p %>  <BR>
x + n / p : <%= x + n / p %>   <BR>
(x + n) / p : <%=(x + n) / p%>  <BR>
5. * n : <%=5. * n%>  <BR>
(n + 1) / n : <%=(n + 1) / n%>  <BR>
(n + 1.0) / n : <%=(n + 1.0) / n%>  <BR>
r + s / t : <%=r + s / t%>  <BR>


<P>b. : </P>
r + t / s : <%=r + t / s %> <BR>
( r + t ) / s : <%=( r + t ) / s %> <BR>
r + t % s : <%= r + t % s%> <BR>
(r + t) % s : <%= (r + t) % s%> <BR>
r + s / r + s : <%= r + s / r + s%> <BR>
(r + s) / ( r + s) : <%= (r + s) / ( r + s)%> <BR>
r + s % t : <%= r + s % t%> <BR>

</body> 
</html>
