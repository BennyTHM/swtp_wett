<?php
	//Session starten.
	session_start();
	$verhalten=0;	//das Seiten verhalten steuern
	$blockiert=0;	//nicht blockiert

	$registriert=0;	//registriert
	
	include 'includes/connect.php';
	
	$mysql = new Mysql();
	$mysql->connect();
	
	
	
	//Standard ausgabe
	if(!isset($_SESSION["username"]) and !isset($_GET["page"])){
		$verhalten=0;
	}
	
	//Get Parameter auslesen
	if(isset($_GET["page"]) == "log"){
		
		//Datenbank nach dem User und seinem Passwort durchsuchen
		$sql="SELECT * FROM user WHERE email='".$_POST["e-mail"]."' AND password='".$_POST["passwort"]."';";
		$result=$mysql->mysqli->query($sql) or die ("Auslesen gescheitert");
		
		//Inhalt des Datensatzes in $row schreiben
		$row = $result->fetch_assoc();
		
		
			//Wenn der Username und das Passwort übereinstimmen
			if($row["email"]==$_POST["e-mail"] and $row["password"]==$_POST["passwort"]){
				
				
					//Tabelle blocked durchsuchen ob ein Eintrag vorhanden ist
					$sql2="SELECT * FROM blocked WHERE User_userID='".$row["userID"]."';";
					$result2=$mysql->mysqli->query($sql2) or die ("Auslesen gescheitert");
					
					//Inhalt des Datensatzes in $row2 schreiben
					$row2 = $result2->fetch_assoc();
					
					//Wenn ein Eintag in der Datenbank blocked vorhanden ist
					if(isset($row2["User_userID"])){
						$verhalten=2;
						$blockiert=1;
					}
					
					//Optimal Fall
					else{
						$_SESSION["userid"]=$row["userID"];
						$_SESSION["username"]=$row["username"];
						$_SESSION["email"]=$row["email"];
						$_SESSION["kontostand"]=$row["balance"];
						$verhalten=1;
					}
				
			}
			//Wenn der Username und das Passwort nicht übereinstimmen
			else{
				$verhalten=2;
				$registriert=1;
			}
	}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Soccer Portal</title>

<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="SHORTCUT ICON" href="sp.ico" type="image/x-icon">

<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="js/register.js"></script>

<?php
	if($verhalten==1){
?>
	<meta http-equiv="refresh" content="0; URL=public/frontend.php" />
<?php
	}
	if($verhalten==2){		
?>
	<meta http-equiv="refresh" content="0; URL=index.php" />
<?php
	}
?>
</head>
<?php
	if($verhalten==0){
?>
	<body>
		<div id="grapper">	
			<div id="sidebar">
				<div id="sidenavi">
					<div class="sideBtn first"><div id="start" class="sideBtnTxt">Startseite</div></div>
					<div class="sideBtn"><div id="about" class="sideBtnTxt">About</div></div></a>
					<div class="sideBtn"><div id="agbs" class="sideBtnTxt">AGB's</div></div>
					<div class="sideBtn"><div id="faq" class="sideBtnTxt">FAQ</div></div>
					<div class="sideBtn"><div id="impressum" class="sideBtnTxt">Impressum</div></div>
					<div class="sideBtn last"><div id="kontakt" class="sideBtnTxt">Kontakt</div></div>
				</div>
			</div> <!-- close sidebar-->
			<div id="all">
			
				<div id="header">
					<div id="logo"></div>
					<div id="headerBtn" class="registerBtn"></div>
					<div id="loginH">
						<form action="index.php?page=log" method="post">
							<input class="formfield inset" type="text" name="e-mail" value="E-Mail">
							<input class="formfield inset" type="password" name="passwort" value="Passwort">
							<input type="submit" class="loginBtn" value="">
						</form>
						<div id="pwvergessen">
							Passwort vergessen?
						</div>
					</div> <!-- close loginH -->
				</div> <!-- close header -->
				
				<div id="banner">
					<div id="bannerPICTURE">
						<div id="infoBox" class="boxText">
							<p>ore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>
						</div>
						
						<div id="bannerNavi">
							<div class="bannerBtn btnr"><div class="bBtnTxt">Super</div></div>
							<div class="bannerBtn btnl"><div class="bBtnTxt">Special</div></div>
						</div> <!-- close bannerNavi -->
						
					</div> <!-- close bannerPICTURE -->
					<div id="top" class="topic">Aktuelle Top-Wetten:</div>
				</div> <!-- close banner -->
				
				<div id="content">
					<div id="inhalt" class="competBox">
						<?php include "public/startseite.php"; ?>
					</div> <!-- close inhalt -->
					
				</div> <!-- close content -->
				
			</div> <!-- close all -->
			
		</div> <!-- close grapper -->
		<div id="registerPopup">
			<form action="public/register.php" method="post">
				<br />
				Bitte geben Sie folgende Daten an:
				<br /><br />
				Username(*): <input class="formfield inset" type="text" name="username" value="Username">
				<br />
				E-Mail(*):<input class="formfield inset" type="text" name="e-mail" value="E-Mail">
				<br />
				Vorname: <input class="formfield inset" type="text" name="vorname" value="Vorname">
				<br />
				Name: <input class="formfield inset" type="text" name="name" value="Name">
				<br />
				Stadt: <input class="formfield inset" type="text" name="stadt" value="Stadt">
				<br />
				<input type="checkbox" name="agb" id="agbs" value=""> Ich akzeptiere die Allgemeinen Geschäftsbedingungen des Soccerportal
				<br />
				<input type="checkbox" name="news" id="newsletter" value=""> Ja, ich möchte den Newsletter abonnieren
				<br />
				<input type="submit" value="Senden">
				<br />
				<br />
				(*) Pflichtfelder
			</form>
		</div>
		<div id="pwvergessenPopup">
			<form action="public/pwVergessen.php" method="post">
				<br />
				<p>Sie haben leider ihr Passwort vergessen?</p>
				<p>Geben Sie bitte folgende Daten an:</p>
				
				Username: <input class="formfield inset" type="text" name="username" value "Username">
				<br />
				E-Mail: <input class="formfield inset" type="text" name="e-mail" value "E-Mail">
				<br /><br />
				Wenn die Daten stimmen, bekommen Sie ein neues Passwort per E-Mail geschickt.
				<br/><br />
				<input type="submit" value="Senden">
				</form>
		</div>
	<?php
		}
	?>
</body>
</html>