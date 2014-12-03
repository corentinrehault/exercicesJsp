<%@page import="java.util.StringTokenizer"%>

<html>
<head>
<meta charset="UTF-8" />
<title>Afficher Info lecteur</title>
</head>
<body>

	<%
		Cookie cook[] = request.getCookies();
		if (cook != null) {
			for (int i = 0; i < cook.length; i++) {
				if (cook[i].getName().equals("preferenceBiblio")) {
					Cookie preferenceBiblio = cook[i];
					String ligne = preferenceBiblio.getValue();
					StringTokenizer st = new StringTokenizer(ligne, "/");
					int j = 0;
					String preferences[] = new String[st.countTokens()];
					while (st.hasMoreTokens()) {
						preferences[j] = st.nextToken();
						j++;
					}
	%>

	<h1>Afficher des informations sur le lecteur</h1>
	<h2>Ses coordonnées</h2>
	<table>
		<tr>
			<td>Nom :</td>
			<td><%=preferences[0]%></td>
		</tr>
		<tr>
			<td>Prénom :</td>
			<td><%=preferences[1]%></td>
		</tr>
	</table>
	<h2>Ses préférences</h2>

	<table>
		<tr>
			<td>Catégorie :</td>
			<td><%=preferences[2]%></td>
		</tr>
		<tr>
			<td>Couleur du fond :</td>
			<td><%=preferences[3]%></td>
		</tr>
		<tr>
			<td>Couleur du texte :</td>
			<td><%=preferences[4]%></td>
		</tr>
	</table>
	<%
		}
			}
		} else {
	%>
	<h1>Vous devez accepter les cookies</h1>
	<%
		}
	%>
</body>
</html>