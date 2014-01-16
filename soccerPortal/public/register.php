 <?php

include 'includes/connect.php';

$mysql = new Mysql();

$mysql->connect();

$name = $_POST['name'];
$firstname = $_POST['vorname'];
$email = $_POST['e-mail'];
$city = $_POST['stadt'];
$username = $_POST['username'];


if (!$mysql->exist($email, $username)){
	$password = $mysql->random_pwd(6);
	
	

	$isAdmin = false;
	$balance = 100;
	$query = 
	"insert into user (name, firstname, username, password, email, city, isAdmin, balance)"
	 		."values ('{$name}', '{$firstname}', '{$username}', '{$password}', '{$email}', '{$city}', '{$isAdmin}', '{$balance}')";
	
	$result = $mysql->mysqli->query($query);
	if ($result){
		echo "Erfolgreich registriert!";	
		//TODO: hier anpassung nötig für die neue email funktion!
 		sendEmail($email,"Registrierung soccerPortal", "Willkommen zum soccerPortal! Sie können sich nun mit diesem Passwort anmelden: ".$password);
	} else {
		echo "Registrierung fehlgeschlagen: ". mysql_error();
	}
			
} else {
	echo "Username oder Email vergeben!";
}




?>
