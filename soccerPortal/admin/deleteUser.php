<?php 

include '../includes/connect.php';

$mysql = new Mysql();
$mysql->connect();

$sql = "insert into user (username) values ('gel�schterUser{$_POST['id']}')";
$sql2 = "select max(userID) as id from user";
$result1 = $mysql->mysqli->query($sql);
$result2 = $mysql->mysqli->query($sql2);
if ($result1){
	$row = $result2->fetch_assoc();
	echo "L�schen erfolgreich! Neue Nr: " . $row['id'];
} else {
 	echo "L�schen nicht erfolgreicht: " . $mysql->mysqli->error;
}
?>

