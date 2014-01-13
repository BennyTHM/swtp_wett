 <?php

include 'connect.php';

$mysql = new Mysql();

$mysql->connect();


$name = $_GET['name'];
$firstname = $_GET['firstname'];
$email = $_GET['email'];
$city = $_GET['city'];
$username = $_GET['username'];

if (!$mysql->exist($email, $username)){
	$password = $mysql->random_pwd(6);
	//$salt = 
	$state = false;
	$isAdmin = false;
	$balance = 100;
	
	$query = 
	"insert into user (name, firstname, username, password, email, city, state, isAdmin, balance)"
	 		."values ('{$name}', '{$firstname}', '{$username}', '{$password}', '{$email}', '{$city}', '{$state}', '{$isAdmin}', '{$balance}')";
	
	$result = mysql_query($query);
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
