 <?php

if(isset($_POST['agb']))

{


include '../includes/connect.php';

$mysql = new Mysql();

$mysql->connect();

$name = $_POST['name'];
$firstname = $_POST['vorname'];
$email = $_POST['e-mail'];
$city = $_POST['stadt'];
$username = $_POST['username'];
$isAdmin = 0;
$balance = 100;
$set_online = true;
$set_shoutbox = true;
$set_message = true;
$image_imageID = 1;
$password = $mysql->random_pwd(6);

//TODO: join date eintragen!!

if(isset($_POST['news'])){
	$set_newsletter = 1;
}else{
	$set_newsletter = 0;
}

if (!$mysql->exist($email, $username)){

	

	$query = 
	"insert into user (username, password, email, isAdmin, balance, set_online, set_shoutbox, set_message, set_newsletter, image_imageID)"
	 		."values ('{$username}', '{$password}', '{$email}', '{$isAdmin}', '{$balance}','{$set_online}','{$set_shoutbox}','{$set_message}','{$set_newsletter}','{$image_imageID}')";
	
	echo $query;
	$result = $mysql->mysqli->query($query);
	if ($result)
		echo "Erfolgreich registriert!";	
 		sendEmail($email,"Registrierung soccerPortal", "Willkommen zum soccerPortal!\n\nSie können sich nun mit diesen Daten anmelden:\nE-Mail: ".$email."\nPasswort: ".$password."\n\nIhr soccerPortal-Team");
	} else {
		echo "Registrierung fehlgeschlagen: ". mysql_error();
	}
			
} else {
	echo "Username oder Email vergeben!";
}

} else {
	echo "Sie m&auml;ssen die AGBs akzeptieren, sonst k&ouml;nnen Sie sich nicht anmelden.";
}


?>
