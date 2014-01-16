<?php

session_start();

include '../includes/connect.php';
	
$mysql = new Mysql();
$mysql->connect();

if(isset($_SESSION["username"])){

$sql = "SELECT * FROM user WHERE username = '". $_SESSION["username"] ."';";
$result=$mysql->mysqli->query($sql) or die("Anfrage fehlgeschlagen: " . mysql_error());
$row = $result->fetch_array();

echo '<img src="../images/site/profilBild.png" <br> <br>';
echo 'Bestenlisten Platzierung: ' . 'Muss noch hinzugefuegt werden <br>';
echo 'User: ' . $row["username"] . "<br>";
echo 'Stadt: ' . $row["city"] . "<br>";
echo 'Kontostand: '. $row["balance"] . "<br>";
}
else{
?>
	Bitte loggen Sie sich erneut ein. Einen Moment bitte Sie werden weitergeleitet...
	<meta http-equiv="refresh" content="0; URL=../index.php" />
<?php
}