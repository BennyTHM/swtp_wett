<?php 	

include '../includes/connect.php';

$mysql = new Mysql();
$mysql->connect();

if (isset($_POST['id'])){
	echo "userID: " . $_POST['id'];
	$sql = "select * from user where userID={$_POST['id']}";
	$result1 = $mysql->mysqli->query($sql);
	//	if ($mysql->mysqli->affected_rows == 1){
		echo $mysql->mysqli->affected_rows . "<br/>";
		$row = $result1->fetch_assoc();
		echo "<form action='updateUser.php' method='POST'>";
		echo "<input type='hidden' name='userID' value='" . $row['userID'] . "'/>";
		echo "<table id='editedUser'>";
		echo "<tr><td><b>Username: <b/></td><td><input name='username' type='text' value='". $row['username'] ."'/></td></tr>";
		echo "<tr><td><b>Passwort: <b></td><td><input name='password' type='text' value='". $row['password'] ."'/></td></tr>";
		echo "<tr><td><b>IstAdmin: <b></td><td><input name='isadmin' type='text' value='". $row['isadmin'] ."'/></td></tr>";
		echo "<tr><td><b>Guthaben: <b></td><td><input name='balance' type='text' value='". $row['balance'] ."'/></td></tr>";
		echo "<tr><td><b>Email: <b></td><td><input name='email' type='text' value='". $row['email'] ."'/></td></tr>";
		echo "<tr><td><b>Online: <b></td><td><input name='set_online' type='text' value='". $row['set_online'] ."'/></td></tr>";
		echo "<tr><td><b>Shoutbox: <b></td><td><input name='set_shoutbox' type='text' value='". $row['set_shoutbox'] ."'/></td></tr>";	
		echo "<tr><td><b>Message: <b></td><td><input name='set_message' type='text' value='". $row['set_message'] ."'/></td></tr>";
		echo "<tr><td><b>Newsletter: <b></td><td><input name='set_newsletter' type='text' value='". $row['set_newsletter'] ."'/></td></tr>";
		echo "<tr><td><b>SigninDate: <b></td><td><input name='signin_date' type='text' value='". $row['signin_date'] ."'/></td></tr>";
		echo "<tr><td><b>ImageID: <b></td><td><input name='image_imageID' type='text' value='". $row['image_imageID'] ."'/></td></tr>";
		
		echo "</table>";
		echo "<input type='submit' value='Aktualisieren'/>";	
		echo "</form>";
		
//	}
} else {
	echo "error from ajax";
}


?>

<html>
<body>


</body>

</html>