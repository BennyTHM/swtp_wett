<?php

session_start();

include '../includes/connect.php';
	
$mysql = new Mysql();
$mysql->connect();

$verhalten=0;

if(isset($_SESSION["username"])){

//Profil Einstellungen ändern
if(isset($_POST['submit7'])){
	$sql = "SELECT * FROM user WHERE userID = '". $_SESSION["userid"] ."';";
	$result=$mysql->mysqli->query($sql) or die("Anfrage fehlgeschlagen: " . mysql_error());
	$row = $result->fetch_array();
	if(isset($_POST['online'])){
		switch($_POST['online']){
			case "onlineJa":if($row['set_online']==0){
								$sql2="UPDATE user SET set_online = 1 where userID = '".$_SESSION['userid']."'";
								$result2=$mysql->mysqli->query($sql2) or die("Update fehlgeschlagen: " . mysql_error());
							}
							break;
			case "onlineNein":if($row['set_online']==1){
								$sql2="UPDATE user SET set_online = 0 where userID = '".$_SESSION['userid']."'";
								$result2=$mysql->mysqli->query($sql2) or die("Update fehlgeschlagen: " . mysql_error());
							}
							break;
		}
	}
	if(isset($_POST['shoutbox'])){
		switch($_POST['shoutbox']){
			case "shoutboxJa":if($row['set_shoutbox']==0){
								$sql2="UPDATE user SET set_shoutbox = 1 where userID = '".$_SESSION['userid']."'";
								$result2=$mysql->mysqli->query($sql2) or die("Update fehlgeschlagen: " . mysql_error());
							}
							break;
			case "shoutboxNein":if($row['set_shoutbox']==1){
								$sql2="UPDATE user SET set_shoutbox = 0 where userID = '".$_SESSION['userid']."'";
								$result2=$mysql->mysqli->query($sql2) or die("Update fehlgeschlagen: " . mysql_error());
							}
							break;
		}
	}
	if(isset($_POST['emailNachricht'])){
		switch($_POST['emailNachricht']){
			case "emailNachrichtJa":if($row['set_message']==0){
								$sql2="UPDATE user SET set_message = 1 where userID = '".$_SESSION['userid']."'";
								$result2=$mysql->mysqli->query($sql2) or die("Update fehlgeschlagen: " . mysql_error());
							}
							break;
			case "emailNachrichtNein":if($row['set_message']==1){
								$sql2="UPDATE user SET set_message = 0 where userID = '".$_SESSION['userid']."'";
								$result2=$mysql->mysqli->query($sql2) or die("Update fehlgeschlagen: " . mysql_error());
							}
							break;
		}
	}
	if(isset($_POST['newsletter'])){
		switch($_POST['newsletter']){
			case "newsletterJa":if($row['set_newsletter']==0){
								$sql2="UPDATE user SET set_newsletter = 1 where userID = '".$_SESSION['userid']."'";
								$result2=$mysql->mysqli->query($sql2) or die("Update fehlgeschlagen: " . mysql_error());
							}
							break;
			case "newsletterNein":if($row['set_newsletter']==1){
								$sql2="UPDATE user SET set_newsletter = 0 where userID = '".$_SESSION['userid']."'";
								$result2=$mysql->mysqli->query($sql2) or die("Update fehlgeschlagen: " . mysql_error());
							}
							break;
		}
	}
}

$sql = "SELECT * FROM user WHERE username = '". $_SESSION["username"] ."';";
$result=$mysql->mysqli->query($sql) or die("Anfrage fehlgeschlagen: " . mysql_error());
$row = $result->fetch_array();

?>

<div id="profilAll">

		<h1>Profil Einstellungen</h1>
		<form action="profilEinst.php" method="post">
		
			<p>Soll angezeigt werden ob sie online sind?</p>
			<p>
				<input type="radio" name="online" id="online1" value="onlineJa" <?php if($row['set_online']==1){ echo "checked";}?>>
				Ja, meinen Freundne soll angezeigt werden, dass ich online bin.
			</p>
			<p>
				<input type="radio" name="online" id="online2" value="onlineNein" <?php if($row['set_online']==0){ echo "checked";}?>>
				Nein, meinen Freunden soll nicht angezeigt werden, dass ich online bin
			</p>
			
			<p>Wollen Sie die Shoutbox angezeigt bekommen?</p>
			<p>
				<input type="radio" name="shoutbox" id="shoutbox1" value="shoutboxJa" <?php if($row['set_shoutbox']==1){ echo "checked";}?>>
				Ja, die Shoutbox soll angezeigt werden
			</p>
			<p>
				<input type="radio" name="shoutbox" id="shoutbox2" value="shoutboxNein" <?php if($row['set_shoutbox']==0){ echo "checked";}?>>
				Nein, die Shoutbox soll nicht angezeigt werden 
			</p>
			<p>Wollen Sie per Email benachrichtigt werden, wenn Sie ein neue Nachricht im Spiel bekommen haben?</p>
			<p>
				<input type="radio" name="emailNachricht" id="emailNachricht1" value="emailNachrichtJa" <?php if($row['set_message']==1){ echo "checked";}?>>
				Ja, ich m&ouml;chte benachrichtigt werden
			</p>
			<p>
				<input type="radio" name="emailNachricht" id="emailNachricht2" value="emailNachrichtNein" <?php if($row['set_message']==0){ echo "checked";}?>>
				Nein, ich m&ouml;chte nicht benachrichtigt werden 
			</p>
			<p>M&ouml;chten Sie den Newsletter empfangen um aktuelle Informationen zum Spiel geschehen und neuerungen erhalten?</p>
			<p>
				<input type="radio" name="newsletter" id="newsletter1" value="newsletterJa" <?php if($row['set_newsletter']==1){ echo "checked";}?>>
				Ja, ich m&ouml;chte den Newsletter erhalten
			</p>
			<p>
				<input type="radio" name="newsletter" id="newsletter2" value="newsletterNein" <?php if($row['set_newsletter']==0){ echo "checked";}?>>
				Nein, ich m&ouml;chte den Newsletter nicht erhalten 
			</p>
			<input type="submit" name="submit7" value="speichern" />
		</form>
		
	</div> <!-- close profilAll -->
<?php
}
else{
?>
	Bitte loggen Sie sich erneut ein. Einen Moment bitte Sie werden weitergeleitet...
	<meta http-equiv="refresh" content="0; URL=../index.php" />
<?php
}