<?php
session_start();

if(isset($_SESSION["username"])){

include '../includes/connect.php';
	
$mysql = new Mysql();
$mysql->connect();

$sql = "SELECT * FROM privatemessage WHERE User_reseiver = '".$_SESSION["userid"]."'";

$result=$mysql->mysqli->query($sql) or die ("Auslesen gescheitert.");
echo "Feuer Frei";
while ($zeile = $result->fetch_array(MYSQL_ASSOC))
{
  echo "<br>";
  echo $zeile['User_reseiver'] ." ";
  ?>
	<a href="message.php"><?php echo $zeile['subject']; ?></a>
  <?php
  echo $zeile['User_sender'] . "<br>";
}
}
else{
?>
Bitte loggen Sie sich erneut ein. Einen Moment bitte Sie werden weitergeleitet...
<meta http-equiv="refresh" content="0; URL=../index.php" />
<?php
}