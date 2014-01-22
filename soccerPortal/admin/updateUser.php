<?php 

include '../includes/connect.php';

$mysql = new Mysql();
$mysql->connect();

$salt = $mysql->getSaltFrom($_POST['username'], $_POST['password']);
$sql = "update user set 
		set_online='{$_POST['set_online']}', set_shoutbox='{$_POST['set_shoutbox']}', email='{$_POST['email']}', 
		 username='{$_POST['username']}', password='{$_POST['password']}', 
		isadmin='{$_POST['isadmin']}', balance='{$_POST['balance']}', salt='{$salt}', image_imageID='{$_POST['image_imageID']}',
		set_message='{$_POST['set_message']}', set_newsletter='{$_POST['set_newsletter']}', signin_date='{$_POST['signin_date']}'
		 where userID = '{$_POST['userID']}'";
$result1 = $mysql->mysqli->query($sql);
if ($result1){
	header('Location: ./users.php');
} else {
 	echo "Update nicht erfolgreicht: " . $mysql->mysqli->error;
}
?>

