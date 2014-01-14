<?php
session_start();

if(isset($_SESSION["username"])){

	include '../includes/connect.php';
	
	$mysql = new Mysql();
	$mysql->connect();

	// Nachrichten nur von bestimmtesn Empfänger anzeigen lassen
	echo 'Empfänger: <input type="text" name="empfaenger"';
	echo '<br>';
	echo '<input type="submit" value="senden" />';

	//Datenbank auswählen.

	if(isset($_POST['senden'])){

		$sql = "SELECT * FROM privatemessage WHERE User_sender = '".$_SESSION["userid"]."'";

		$result=$mysql->mysqli->query($sql) or die ("Auslesen gescheitert.");

	}
	else{

		$sql = "SELECT * FROM privatemessage WHERE User_sender = '".$_SESSION["userid"]."'";

		$result=$mysql->mysqli->query($sql) or die ("Auslesen gescheitert.");

	}

	while ($zeile = $result->fetch_array(MYSQL_ASSOC))
	{
		echo "<br>";
		echo $zeile['User_reseiver'] ." ";
		?>
			<a href="message.php"><?php echo $zeile['subject']; ?></a>
		<?php
		echo $zeile['User_sender'] . "<br>";
	}
}
else{
	?>
		Bitte loggen Sie sich erneut ein. Einen Moment bitte Sie werden weitergeleitet...
		<meta http-equiv="refresh" content="0; URL=../index.php" />
	<?php
}