<!DOCTYPE html>
<html lang="fr-FR">
<head>
<meta charset="UTF-8" />
<title>Choix de date</title>
</head>
<body>
	<h1>Saisir une date</h1>
	Avec la boucle
	<i>for</i> pour les jours,
	<br> la boucle
	<i>while</i> pour les mois
	<br> et la boucle
	<i>do...while</i> pour les années.
	<br>
	<form action="valideDate2.jsp" method="post">
		<table>
			<tr>
				<td>Jour</td>
				<td>Mois</td>
				<td>Année</td>
				<td></td>
			</tr>
			<tr>
				<td><select name="jour" size="1" required="required">
						<option value="" selected="selected" disabled="disabled">Jour</option>
						<%
							for (int i = 1; i < 32; i++) {
								out.println("<option value=\"" + i + "\">" + i + "</option>");
							}
						%>
				</select></td>
				<td><select name="mois" size="1" required="required">
						<option value="" selected="selected" disabled="disabled">Mois</option>
						<%
							int mois = 1;
							while (mois < 13) {
								out.println("<option value=\"" + mois + "\">" + mois
										+ "</option>");
								mois++;
							}
						%>
				</select></td>
				<td><select name="annee" size="1" required="required">
						<option value="" selected="selected" disabled="disabled">Année</option>
						<%
							int an = 2014;
							do {
								out.println("<option value=\"" + an + "\">" + an + "</option>");
								an++;
							} while (an < 2025);
						%>
				</select></td>
				<td><input type="submit" name="Vérifier">
			</tr>
		</table>
	</form>

</body>
</html>