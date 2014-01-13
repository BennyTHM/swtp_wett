<?php
//Auf jede Seite damit die Datenpakete weitergereicht werden
session_start();

//diese Abfrage immer machen im geschützen Bereich	
if(isset($_SESSION["username"])){
	echo "Willkommen ". $_SESSION["username"] .". Du bist angemeldet.";
?>
	<a href="logout.php">Ausloggen.</a>
	<br/>
	<a href="pm.php">Nachricht verfassen</a>
	<br />
	<a href="posteingang.php">Posteingang</a>
	<br />
	<a href="postausgang.php">Postausgang</a>
<?php
}
//Was passiert wenn nicht angemeldet
else{
	?>
		Bitte loggen Sie sich erneut ein. Einen Moment bitte Sie werden weitergeleitet...
		<meta http-equiv="refresh" content="0; URL=http://localhost/swtp_w/soccerPortal/index.php" />
	<?php
}