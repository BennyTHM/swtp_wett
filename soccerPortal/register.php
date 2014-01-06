 <?php

include 'includes/connect.php';

$mysql = new Mysql();

$mysql->connect();


$name = $_POST['name'];
$firstname = $_POST['firstname'];
$email = $_POST['email'];
$city = $_POST['city'];
$username = $_POST['username'];

if (!$mysql->exist($email, $username)){
	$password = $mysql->random_pwd(6);
	//$salt = 
	$state = false;
	$isAdmin = false;
	$balance = 100;
	
	$query = 
	"insert into user (name, firstname, username, password, email, city, state, isAdmin, balance)"
	 		."values ('{$name}', '{$firstname}', '{$username}', '{$password}', '{$email}', '{$city}', '{$state}', '{$isAdmin}', '{$balance}')";
	
	$result = $mysql->mysqli->query($query);
	if ($result){
		echo "OK!";	
 		$mysql->sendEmail($name, $email, $password);
	} else {
		echo "Registrierung fehlgeschlagen: ". mysql_error();
	}
			
} else {
	echo "Username oder Email vergeben!";
}




?>
