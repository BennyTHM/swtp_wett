<?php

session_start();

include '../includes/connect.php';
	
$mysql = new Mysql();
$mysql->connect();

$verhalten=0;

if(isset($_SESSION["username"])){

//email Adresse ändern
if(isset($_POST['submit1'])){
	if(isset($_POST['email1']) and isset($_POST['email2'])){
		if(strcmp($_POST['email1'],$_POST['email2'])==0){
			$sql="SELECT * FROM user WHERE userID='".$_SESSION["userid"]."';";
			$result=$mysql->mysqli->query($sql) or die ("Auslesen gescheitert");
			$row = $result->fetch_assoc();
			if(strcmp($row['password'],$_POST['pw1'])==0){
				$sql2="UPDATE user Set email = '".$_POST['email1']."' WHERE userID='".$_SESSION['userid']."';";
				$result2=$mysql->mysqli->query($sql2) or die ("Update gescheitert");
			}
			else{
				echo "Falsches Passwort bitte erneut eingeben!!!";
			}
		}
		else{
			echo "Die Email Adressen stimmen nicht überein, bitte geben sie diese erneut ein!!!";
		}
	}
	else{
			echo "Die Felder der email Adressen sind leer!!!";
	}
}
//Stadt ändern
if(isset($_POST['submit2'])){
	if(isset($_POST['stadt'])){
		$sql="SELECT * FROM user WHERE userID='".$_SESSION["userid"]."';";
		$result=$mysql->mysqli->query($sql) or die ("Auslesen gescheitert");
		$row = $result->fetch_assoc();
		if(strcmp($row['password'],$_POST['pw2'])==0){
			$sql2="UPDATE userdescription Set city = '".$_POST['stadt']."' WHERE userID='".$_SESSION['userid']."';";
			$result2=$mysql->mysqli->query($sql2) or die ("Update gescheitert");
		}
		else{
			echo "Falsches Passwort bitte erneut eingeben!!!";
		}
	}
}
//Passwort ändern
if(isset($_POST['submit3'])){
	if(isset($_POST['npw1']) and isset($_POST['npw2']) and isset($_POST['pw3'])){
		if(strcmp($_POST['npw1'],$_POST['npw2'])==0){
			$sql="SELECT * FROM user WHERE username='".$_SESSION["username"]."' AND password='".$_POST["pw3"]."';";
			$result=$mysql->mysqli->query($sql) or die ("Auslesen gescheitert");
		
			//Inhalt des Datensatzes in $row schreiben
			$row = $result->fetch_assoc();
		
			//Wenn der Username und das Passwort übereinstimmen
			if(strcmp($row["username"],$_SESSION["username"])==0 and strcmp($row["password"],$_POST["pw3"])==0){
				$sql="UPDATE user SET password = '".$_POST['npw1']."' where username = '".$_SESSION['username']."'";
				$result=$mysql->mysqli->query($sql) or die ("Update gescheitert");
				
				//NEUES Auslesen zum testen ob das passwort geändert wurde
				$sql="SELECT password FROM user WHERE userID='".$_SESSION["userid"]."' AND password='".$_POST["npw1"]."';";
				$result=$mysql->mysqli->query($sql) or die ("Auslesen gescheitert");
		
				//Inhalt des Datensatzes in $row schreiben
				$row = $result->fetch_assoc();
				
				if(strcmp($row["password"],$_POST["npw1"])==0){
					echo "Passwort erfolgreich geändert";
				}
				else{
					echo "Passwort ändern ist Fehlgeschlagen";
				}
			}
			else{
				echo 'Falsches Passwort eingegeben.';
			}
		}
		else{
			echo 'Passwörter stimmen nicht überein.';
		}
	}
}
if(isset($_POST['submit4'])){
	if(isset($_POST['vorname'])){
		$sql="SELECT * FROM user WHERE userID='".$_SESSION["userid"]."';";
		$result=$mysql->mysqli->query($sql) or die ("Auslesen gescheitert");
		$row = $result->fetch_assoc();
		if(strcmp($row['password'],$_POST['pw4'])==0){
			$sql2="UPDATE userdescription Set firstname = '".$_POST['vorname']."' WHERE User_userID='".$_SESSION['userid']."';";
			$result2=$mysql->mysqli->query($sql2) or die ("Update gescheitert");
		}
		else{
			echo "Falsches Passwort bitte erneut eingeben!!!";
		}
	}
}
if(isset($_POST['submit5'])){
	if(isset($_POST['nachname'])){
		$sql="SELECT * FROM user WHERE userID='".$_SESSION["userid"]."';";
		$result=$mysql->mysqli->query($sql) or die ("Auslesen gescheitert");
		$row = $result->fetch_assoc();
		if(strcmp($row['password'],$_POST['pw5'])==0){
			$sql2="UPDATE userdescription Set name = '".$_POST['nachname']."' WHERE User_userID='".$_SESSION['userid']."';";
			$result2=$mysql->mysqli->query($sql2) or die ("Update gescheitert");
		}
		else{
			echo "Falsches Passwort bitte erneut eingeben!!!";
		}
	}
}
if(isset($_POST['submit6'])){
	if(isset($_POST['description'])){
		$sql="SELECT * FROM user WHERE userID='".$_SESSION["userid"]."';";
		$result=$mysql->mysqli->query($sql) or die ("Auslesen gescheitert");
		$row = $result->fetch_assoc();
		if(strcmp($row['password'],$_POST['pw6'])==0){
			$sql2="UPDATE userdescription Set description = '".$_POST['description']."' WHERE User_userID='".$_SESSION['userid']."';";
			$result2=$mysql->mysqli->query($sql2) or die ("Update gescheitert");
		}
		else{
			echo "Falsches Passwort bitte erneut eingeben!!!";
		}
	}
}
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

$sql2 = "SELECT * FROM userdescription WHERE User_userID = '". $_SESSION["userid"] ."';";
$result2=$mysql->mysqli->query($sql2) or die("Anfrage fehlgeschlagen: " . mysql_error());
$row2 = $result2->fetch_array();

?>
	<div id="profilAll">
		<h1>Profil Daten &auml;ndern</h1>
		<?php
			echo 'Aktuelle Email Adresse: ' . $row["email"] . "<br>";
		?>
		<form action="profilBear.php" method="post">
			<p>
				Neue Email eingeben: <input type="text" name="email1" /><br>
				Neue Email erneut eingeben: <input type="text" name="email2" /><br>
				Passwort eingeben: <input type="password" name="pw1" /><br>
				<input type="submit" name="submit1" value="best&auml;tigen" />
			</p>
		</form>
	<?php
		echo '<br>Passwort  &auml;ndern: '."<br>";
	?>
		<form action="profilBear.php" method="post">
			<p>
				Neues Passwort eingeben: <input type="password" name="npw1" /><br>
				Neues Passwort erneut eingeben: <input type="password" name="npw2" /><br>
				Altes Passwort eingeben: <input type="password" name="pw3" /><br>
				<input type="submit" name="submit3" value="best&auml;tigen" />
			</p>
		</form>
	<?php
		echo '<br>Aktuelle Stadt: ' . $row2["city"] . "<br>";
	?>
		<form action="profilBear.php" method="post">
			<p>
				Stadt &auml;ndern: <input type="text" name="stadt"/><br>
				Passwort eingeben: <input type="password" name="pw2" /><br>
				<input type="submit" name="submit2" value="best&auml;tigen" /><br>
			<p>
		</form>
	<?php
		echo '<br>Aktueller Vorname: ' . $row2["firstname"] . "<br>";
	?>
		<form action="profilBear.php" method="post">
			<p>
				Vorname &auml;ndern: <input type="text" name="vorname"/><br>
				Passwort eingeben: <input type="password" name="pw4" /><br>
				<input type="submit" name="submit4" value="best&auml;tigen" /><br>
			<p>
		</form>
	<?php
		echo '<br>Aktueller Nachname: ' . $row2["name"] . "<br>";
	?>
		<form action="profilBear.php" method="post">
			<p>
				Nachname &auml;ndern: <input type="text" name="nachname"/><br>
				Passwort eingeben: <input type="password" name="pw5" /><br>
				<input type="submit" name="submit5" value="best&auml;tigen" /><br>
			<p>
		</form>
	<?php
		echo '<br>Aktuelle Beschreibung: <br>';
	?>
		<form action="profilBear.php" method="post">
			<p>
				Beschreibung &auml;ndern: <textarea name="description" cols="50" rows="10"><?php echo $row2["description"]; ?></textarea><br>
				Passwort eingeben: <input type="password" name="pw6" /><br>
				<input type="submit" name="submit6" value="best&auml;tigen" /><br>
			<p>
		</form>
		
		<h1>Profil Einstellungen</h1>
		<form action="profilBear.php" method="post">
		
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