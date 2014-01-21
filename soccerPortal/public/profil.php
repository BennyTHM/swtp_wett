<?php

session_start();

include '../includes/connect.php';
	
$mysql = new Mysql();
$mysql->connect();

if(isset($_SESSION["username"])){

//Auslesen aus der Tabelle User
$sql = "SELECT * FROM user WHERE username = '". $_SESSION["username"] ."';";
$result=$mysql->mysqli->query($sql) or die("Anfrage 1 fehlgeschlagen: " . mysql_error());
$row = $result->fetch_array();

//Auslesen aus der tabelle userdescription
$sql2 = "SELECT * FROM userdescription WHERE User_userID = '". $_SESSION["userid"] ."';";
$result2=$mysql->mysqli->query($sql2) or die("Anfrage 2 fehlgeschlagen: " . mysql_error());
$row2 = $result2->fetch_array();

//Auslesen aus der tabelle bet_statistic
$sql3 = "SELECT * FROM bet_statistic WHERE user_userID = '". $_SESSION["userid"] ."';";
$result3=$mysql->mysqli->query($sql3) or die("Anfrage 3 fehlgeschlagen: " . mysql_error());
$row3 = $result3->fetch_array();

//Auslesen aus der Tabelle user_has_team
$sql4 = "SELECT * FROM user_has_team WHERE User_userID = '". $_SESSION["userid"] ."';";
$result4=$mysql->mysqli->query($sql4) or die("Anfrage 4 fehlgeschlagen: " . mysql_error());
?>

<div id="profilAll">
	<div id="profilDaten">
		<h1><?php echo '<img src="../images/site/profilBild.png" width="250" height="250" align="left" vspace="10" hspace="20">'; ?> </h1>
		<br>
		<h1>Profil Daten:</h1>
		<p>Username:<?php echo $row["username"]; ?></p>
		<p>Wohnort:<?php echo $row2["city"]; ?></p>
		<p>Kontostand:<?php echo $row["balance"]; ?></p>
		<p>Angemeldet seit:<?php echo $row["signin_date"]; ?></p>
	</div> <!-- close profilDaten -->
		<div id="profilDatenBesch">
			<p>&Uuml;ber mich:<?php echo "<br>" . $row2["description"]; ?></p>
		</div> <!-- close profilDatenBesch -->
	<div id="profildiv">
		<div id="profilStatWetten">
			<h1>Wett Statistik</h1>
				<table>
					<tr>
						<td>Anzahl aller get&auml;tigten Wetten:</td>
						<td><?php echo $row3["betcount"]; ?></td>
					</tr>
					<tr>
						<td>Anzahl der Gewonnenen Einzelwetten:</td>
						<td><?php echo $row3["singlebetwin"]; ?></td>
					</tr>
					<tr>
						<td>Anzahl der Gewonnenen Kombiwetten:</td>
						<td><?php echo $row3["combibetwin"]; ?></td>
					</tr>
					<tr>
						<td>Anzahl der Gewonnenen Wetten:</td>
						<td><?php echo $row3["betwin"]; ?></td>
					</tr>
					<tr>
						<td>Anzahl der Verlorenen Wetten:</td>
						<td><?php echo $row3["betloose"]; ?></td>
					</tr>
					<tr>
						<td>Prozentualer Anteil der Gewonnenen Wetten:</td>
						<td><?php $durchschnitt=$row3['betwin']*100/$row3["betcount"]; echo round($durchschnitt,1) . " %"; ?></td>
					</tr>
				</table>
		</div> <!-- close profilStatWetten -->
		<div id="profilBListe">
			<h1>Bestenlisten Platzierungen:</h1>
			<table>
				<tr>
					<td>Gesamtguthaben</td>
					<td></td>
				</tr>
				<tr>
					<td>Gewonnene Wetten:</td>
					<td></td>
				</tr>
				<tr>
					<td>Gewonnene Einzelwetten:</td>
					<td></td>
				</tr>
				<tr>
					<td>Gewonnene Kombiwetten:</td>
					<td></td>
				</tr>
			</table>
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
				<?php while($zeile = $result4->fetch_array(MYSQL_ASSOC)){ ?>
				<tr>
					<?php
						//Den Team Name aus der Datenbank lesen
						$sql5 = "SELECT title FROM team WHERE teamID = '". $zeile["team_teamID"] ."';";
						$result5=$mysql->mysqli->query($sql5) or die("Anfrage 5 fehlgeschlagen: " . mysql_error());
						$row5 = $result5->fetch_array();
					?>
							<td><?php echo $row5['title']; ?></td>
							<td><?php echo $zeile['right_wintip']; ?></td>
							<td><?php echo $zeile['false_wintip']; ?></td>
							<td><?php echo $zeile['right_drawtip']; ?></td>
							<td><?php echo $zeile['false_drawtip']; ?></td>
							<td><?php echo $zeile['right_loosetip']; ?></td>
							<td><?php echo $zeile['false_loosetip']; ?></td>
						</tr>
				<?php
				}
				?>
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