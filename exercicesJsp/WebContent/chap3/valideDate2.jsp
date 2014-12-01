<!DOCTYPE html>
<%-- <%@page import="java.text.DateFormatSymbols"%> --%>
<%-- <%@page import="java.text.spi.DateFormatProvider"%> --%>
<%-- <%@page import="com.sun.org.apache.xerces.internal.impl.dv.xs.MonthDayDV"%> --%>
<%-- <%@page import="sun.util.resources.CalendarData_fr"%> --%>
<%-- <%@page import="java.util.Calendar"%> --%>
<%-- <%@page import="java.text.DateFormat"%> --%>
<%-- <%@page import="java.util.Date"%> --%>
<%-- <%@page import="com.sun.org.apache.xerces.internal.impl.dv.xs.MonthDV"%> --%>
<html lang="fr-FR">
<head>
<meta charset="UTF-8" />
<title>Valide la date</title>
</head>
<body>

	<%
		int jour = Integer.valueOf(request.getParameter("jour"));
		int mois = Integer.valueOf(request.getParameter("mois"));
		int annee = Integer.valueOf(request.getParameter("annee"));
	%>
	<h1>Validation de la date</h1>
	Voici la date saisie :
	<%=jour%>/<%=mois%>/<%=annee%>
	<br> La date saisie
	<%
		switch (mois) {
		case 4:
		case 6:
		case 9:
		case 11:
			if (jour == 31) {
				out.print("n'est pas valide. ");
	%><%=mois%>
	<%
		out.print(" est un mois de 30 jours.");
			}
			break;
		case 2:
			if (annee % 4 == 0 && (annee % 100 != 0 || annee % 400 != 0)) {
				if (jour >= 30) {
					out.print("n'est pas valide. Février ne peut compter plus de 29 jours.");
					break;
				}
			} else if (jour >= 28) {
				out.print("n'est pas valide. Février ne peut compter plus de 28 jours.");
				break;
			} else {
				out.print("est <font color=green>valide</font> !");
				break;
			}
		default:
			out.print("est <font color=green>valide</font> !");
			break;
		}
	%>


</body>
</html>