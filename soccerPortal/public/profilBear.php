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

	echo 'Aktuelle Email Adresse: ' . $row["email"] . "<br>";
?>
	<form action="profilBear.php?page=send1" method="post">
		<p>
			Neue Email eingeben: <input type="text" name="email" /><br>
			Neue Email erneut eingeben: <input type="text" name="email" /><br>
			Passwort eingeben: <input type="password" name="pw1" /><br>
			<input type="submit" name="submit1" value="bestätigen" />
		</p>
	</form>
<?php
	echo '<br>Aktuelle Stadt: ' . $row["city"] . "<br>";
?>
	<form action="profilBear.php?page=send2" method="post">
		<p>
			Stadt ändern: <input type="text" name="stadt"/><br>
			Passwort eingeben: <input type="password" name="pw2" /><br>
			<input type="submit" name="submit2" value="bestätigen" /><br>
		<p>
	</form>
<?php
	echo '<br>Passwort ändern: '."<br>";
?>
	<form action="profilBear.php?page=send3" method="post">
		<p>
			Neues Passwort eingeben: <input type="password" name="npw1" /><br>
			Neues Passwort erneut eingeben: <input type="password" name="npw2" /><br>
			Altes Passwort eingeben: <input type="password" name="pw3" /><br>
			<input type="submit" name="submit3" value="bestätigen" />
		</p>
	</form>
	
<?php
}
else{
?>
	Bitte loggen Sie sich erneut ein. Einen Moment bitte Sie werden weitergeleitet...
	<meta http-equiv="refresh" content="0; URL=../index.php" />
<?php
}