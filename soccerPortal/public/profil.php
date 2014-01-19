<?php

session_start();

include '../includes/connect.php';
	
$mysql = new Mysql();
$mysql->connect();

if(isset($_SESSION["username"])){

$sql = "SELECT * FROM user WHERE username = '". $_SESSION["username"] ."';";
$result=$mysql->mysqli->query($sql) or die("Anfrage fehlgeschlagen: " . mysql_error());
$row = $result->fetch_array();
?>

<div id="profilAll">
	<div id="profilDaten">
		<h1><?php echo '<img src="../images/site/profilBild.png" width="250" height="250" align="left" vspace="10" hspace="20">'; ?> </h1>
		<br>
		<h1>Profil Daten:</h1>
		<p>Username:<?php echo $row["username"]; ?></p>
		<p>Wohnort:<?php echo $row["city"]; ?></p>
		<p>Kontostand:<?php echo $row["balance"]; ?></p>
		<p>Angemeldet seit:</p>
	</div> <!-- close profilDaten -->
	<div id="profildiv">
		<div id="profilStatWetten">
			<h1>Wett Statistik</h1>
			<p>Anzahl aller get&auml;tigten Wetten:</p>
			<p>Anzahl der Gewonnenen Einzelwetten:</p>
			<p>Anzahl der Gewonnenen Kombiwetten:</p>
			<p>Anzahl der Gewonnenen Wetten:</p>
			<p>Anzahl der Verlorenen Wetten:</p>
			<p>Prozentualer Anteil der Gewonnenen Wetten:</p>
		</div> <!-- close profilStatWetten -->
		<div id="profilBListe">
			<h1>Bestenlisten Platzierungen:</h1>
			<p>Gesamtguthaben:</p>
			<p>Gewonnene Wetten:</p>
			<p>Gewonnene Einzelwetten:</p>
			<p>Gewonnene Kombiwetten:</p>
		</div> <!-- close profilBListe -->
	</div> <!-- close profildiv -->
	<div id="profilStatTeamWetten">
		<h1>Mannschafts Statistik:</h1>
			<table border="1">
				<tr>
					<th>Mannschaft</th>
					<th>Richtig auf Sieg gewettet</th>
					<th>Falsch auf Sieg gewettet</th>
					<th>Richtig auf Unentschieden gewettet</th>
					<th>Falsch auf Unentschieden gewettet</th>
					<th>Richtig auf Niederlage gewettet</th>
					<th>Falsch auf Niederlage gewettet</th>
				</tr>
				<tr>
					<td>Deutschland</td>
					<td>5</td>
					<td>1</td>
					<td>2</td>
					<td>0</td>
					<td>1</td>
					<td>4</td>
				</tr>
				<tr>
					<td>Brasilien</td>
					<td>2</td>
					<td>6</td>
					<td>3</td>
					<td>3</td>
					<td>0</td>
					<td>0</td>
				</tr>
				<tr>
					<td>Argentinien</td>
					<td>3</td>
					<td>3</td>
					<td>3</td>
					<td>2</td>
					<td>7</td>
					<td>1</td>
				</tr>
		</table>
	</div> <!-- close profilStatTeamWetten -->
</div> <!-- close profilAll -->
<?php
}
else{
?>
	Bitte loggen Sie sich erneut ein. Einen Moment bitte Sie werden weitergeleitet...
	<meta http-equiv="refresh" content="0; URL=../index.php" />
<?php
}