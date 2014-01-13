<?php
session_start();

if(isset($_SESSION["username"])){

$verhalten=0;

include '../includes/connection.php';

if(!isset($_GET["page"])){
	$verhalten=0;
}

if(isset($_GET["page"]) == "send"){
	$verhalten=1;
	$empfaenger=$_POST['empfaenger'];
	$sqlEmpf = "SELECT UserID FROM user WHERE username = '". $empfaenger ."';";
	$result=mysql_query($sqlEmpf) or die("Anfrage fehlgeschlagen: " . mysql_error());
	$row = mysql_fetch_array($result);
	
	//if(isset($row["userID"])){
		$empfaenger=$row['UserID'];
		$subjekt=$_POST['subjekt'];
		$message=$_POST['nachricht'];

		$sql = "INSERT INTO privatemessage(subject,message,User_reseiver,User_sender) 
				VALUES('".$subjekt."', '".$message."', '".$empfaenger."', '".$_SESSION["userid"]."');";

		$erg=mysql_query($sql) or die("Anfrage fehlgeschlagen: " . mysql_error());

		if($erg == true){
			echo 'Nachricht wurde erfolgreich gesendet!';
		}
		else{
			echo 'Nachricht wurde nicht erfolgreich gesendet!';
		}
	//}
	//else{
	//	echo 'Der User ist in der Datenbank nicht vorhanden!';
	//}
}

if($verhalten==0){
?>

<form action="pm.php?page=send" method="post">
	<p>Empfänger: <input type="text" name="empfaenger" /></p>
	<p>Betreff: <input type="text" name="subjekt"/></p>
	<p>Nachricht: <textarea name="nachricht" cols="50" rows="10"></textarea></p>
	<p><input type="submit" value="senden" /></p>
</form>
<br />
<a href="posteingang.php">Posteingang</a>
<br />
<a href="postausgang.php">Postausgang</a>

<?php
}
if($verhalten==1){
?>
	<a href="posteingang.php">Posteingang</a>
<?php
}
}
else{
?>
	Bitte loggen Sie sich erneut ein. Einen Moment bitte Sie werden weitergeleitet...
	<meta http-equiv="refresh" content="0; URL=../index.php" />
<?php
}
