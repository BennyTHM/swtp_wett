<?php

session_start();

include '../includes/connect.php';
	
$mysql = new Mysql();
$mysql->connect();

$verhalten=0;

if(isset($_SESSION["username"])){

//email Adresse ändern
if(isset($_GET["page"]) == "send1"){
	if(isset($_POST['email'])){
	
	}
}
//Stadt ändern
if(isset($_GET["page"]) == "send2"){
	if(isset($_POST['stadt'])){
	
	}
}
//Passwort ändern
if(isset($_GET["page"]) == "send3"){
	if(isset($_POST['npw1']) && isset($_POST['npw2'])){
		if($_POST['npw1']==$_POST['npw2']){
			$sql="SELECT * FROM user WHERE username='".$_SESSION["username"]."' AND password='".$_POST["pw3"]."';";
			$result=$mysql->mysqli->query($sql) or die ("Auslesen gescheitert");
		
			//Inhalt des Datensatzes in $row schreiben
			$row = $result->fetch_assoc();
		
			//Wenn der Username und das Passwort übereinstimmen
			if($row["username"]==$_SESSION["username"] and $row["password"]==$_POST["pw3"]){
				$sql="UPDATE user SET password = '".$_POST['npw1']."' where username = '".$_SESSION['username']."'";
				
				//NEUES Auslesen zum testen ob das passwort geändert wurde
				$sql="SELECT * FROM user WHERE username='".$_SESSION["username"]."' AND password='".$_POST["npw1"]."';";
				$result=$mysql->mysqli->query($sql) or die ("Auslesen gescheitert");
		
				//Inhalt des Datensatzes in $row schreiben
				$row = $result->fetch_assoc();
				
				if($row["username"]==$_SESSION["username"] and $row["password"]==$_POST["npw1"]){
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

$sql = "SELECT * FROM user WHERE username = '". $_SESSION["username"] ."';";
$result=$mysql->mysqli->query($sql) or die("Anfrage fehlgeschlagen: " . mysql_error());
$row = $result->fetch_array();

?>
	<div id="profilAll">
		<h1>Profil Daten &auml;ndern</h1>
		<?php
			echo 'Aktuelle Email Adresse: ' . $row["email"] . "<br>";
		?>
		<form action="profilBear.php?page=send1" method="post">
			<p>
				Neue Email eingeben: <input type="text" name="email" /><br>
				Neue Email erneut eingeben: <input type="text" name="email" /><br>
				Passwort eingeben: <input type="password" name="pw1" /><br>
				<input type="submit" name="submit1" value="best&auml;tigen" />
			</p>
		</form>
	<?php
		echo '<br>Aktuelle Stadt: ' . $row["city"] . "<br>";
	?>
		<form action="profilBear.php?page=send2" method="post">
			<p>
				Stadt &auml;ndern: <input type="text" name="stadt"/><br>
				Passwort eingeben: <input type="password" name="pw2" /><br>
				<input type="submit" name="submit2" value="best&auml;tigen" /><br>
			<p>
		</form>
	<?php
		echo '<br>Passwort  &auml;ndern: '."<br>";
	?>
		<form action="profilBear.php?page=send3" method="post">
			<p>
				Neues Passwort eingeben: <input type="password" name="npw1" /><br>
				Neues Passwort erneut eingeben: <input type="password" name="npw2" /><br>
				Altes Passwort eingeben: <input type="password" name="pw3" /><br>
				<input type="submit" name="submit3" value="best&auml;tigen" />
			</p>
		</form>
		
		<h1>Profil Einstellungen</h1>
		<form>
		
			<p>Soll angezeigt werden ob sie online sind?</p>
			<p>
				<input type="radio" name="online" id="online1" value="" <?php if($row['set_online']==1){ echo "checked";}?>>
				Ja, meinen Freundne soll angezeigt werden, dass ich online bin.
			</p>
			<p>
				<input type="radio" name="online" id="online2" value="" <?php if($row['set_online']==0){ echo "checked";}?>>
				Nein, meinen Freunden soll nicht angezeigt werden, dass ich online bin
			</p>
			
			<p>Wollen Sie die Shoutbox angezeigt bekommen?</p>
			<p>
				<input type="radio" name="shoutbox" id="shoutbox1" value="" <?php if($row['set_shoutbox']==1){ echo "checked";}?>>
				Ja, die Shoutbox soll angezeigt werden
			</p>
			<p>
				<input type="radio" name="shoutbox" id="shoutbox2" value="" <?php if($row['set_shoutbox']==0){ echo "checked";}?>>
				Nein, die Shoutbox soll nicht angezeigt werden 
			</p>
			<p>Wollen Sie per Email benachrichtigt werden, wenn Sie ein neue Nachricht im Spiel bekommen haben?</p>
			<p>
				<input type="radio" name="emailNachricht" id="emailNachricht1" value="" <?php if($row['set_message']==1){ echo "checked";}?>>
				Ja, ich m&ouml;chte benachrichtigt werden
			</p>
			<p>
				<input type="radio" name="emailNachricht" id="emailNachricht2" value="" <?php if($row['set_message']==0){ echo "checked";}?>>
				Nein, ich m&ouml;chte nicht benachrichtigt werden 
			</p>
			<p>M&ouml;chten Sie den Newsletter empfangen um aktuelle Informationen zum Spiel geschehen und neuerungen erhalten?</p>
			<p>
				<input type="radio" name="newsletter" id="newsletter1" value="" <?php if($row['set_newsletter']==1){ echo "checked";}?>>
				Ja, ich m&ouml;chte den Newsletter erhalten
			</p>
			<p>
				<input type="radio" name="newsletter" id="newsletter2" value="" <?php if($row['set_newsletter']==1){ echo "checked";}?>>
				Nein, ich m&ouml;chte den Newsletter nicht erhalten 
			</p>
			<input type="submit" name="submit4" value="speichern" />
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