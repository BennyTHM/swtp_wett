<?php
session_start();

if(isset($_SESSION["username"])){

	include '../includes/connect.php';
	
	$mysql = new Mysql();
	$mysql->connect();

	// Nachrichten nur von bestimmtesn Empf�nger anzeigen lassen
	echo 'Empf&auml;nger: <input type="text" name="empfaenger"';
	echo '<br>';
	echo '<input type="submit" value="senden" />';

	//Datenbank ausw�hlen.

	if(isset($_POST['senden'])){

		$sql = "SELECT * FROM privatemessage WHERE User_sender = '".$_SESSION["userid"]."'";

		$result=$mysql->mysqli->query($sql) or die ("Auslesen gescheitert.");

	}
	else{

		$sql = "SELECT * FROM privatemessage WHERE User_sender = '".$_SESSION["userid"]."'";

		$result=$mysql->mysqli->query($sql) or die ("Auslesen gescheitert.");

	}
	?>
	<table border="1">
				<tr>
					<th></th>
					<th>An</th>
					<th>Empfangen am</th>
					<th>Betreff</th>
				</tr>
	<?php
	while ($zeile = $result->fetch_array(MYSQL_ASSOC))
	{
	?>
				<tr>
					<td><input type="checkbox" name="msg[1]" id="msg1393" value="1393"></td>
					<td> 
						<?php 
							$sqlUName = "SELECT username FROM user WHERE userID = '" . $zeile['User_reseiver'] . "'";
							$userName=$mysql->mysqli->query($sqlUName) or die ("Auslesen gescheitert.");
							$uname=$userName->fetch_array(MYSQL_ASSOC);
							echo $uname['username']; 
						?> 
					</td>
					<td> <?php echo $zeile['datetime']; ?> </td>
					<td> <a href="message.php"><?php echo $zeile['subject']; ?></a> </td>
				</tr>
	<?php
	}
	?>
	</table>
	<?php
}
else{
	?>
		Bitte loggen Sie sich erneut ein. Einen Moment bitte Sie werden weitergeleitet...
		<meta http-equiv="refresh" content="0; URL=../index.php" />
	<?php
}