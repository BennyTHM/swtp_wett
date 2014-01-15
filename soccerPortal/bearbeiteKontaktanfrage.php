<?php

include_once "includes/connect.php";

if(isset($_POST["email"])){
	
	
	$mysql = new Mysql();
	$mysql->connect();
	
	 
	$sql = "select * from user where isadmin=1";
	$result=$mysql->mysqli->query($sql) or die ("Auslesen aus der Datenbank gescheitert.");
	
	$count = 0;
	while ($row = $result->fetch_assoc()) {
	sendEmail($row["email"],"Kontakt wegen ".$_POST["betreff"],"Anfrage von Email: ".$_POST["email"]." \n".$_POST["message"]);
	$count=$count+1;
	}
	echo "Danke, ihre Kontaktanfrage wird an die Admins weitergeleitet. \n";

	
}else{
	echo "Sie sollten nicht hier sein. Bitte kehren Sie auf die Homepage zurück.";

	}
?>