<?php
session_start();

if(isset($_SESSION["username"])){

include '../includes/connection.php';

$sql = "SELECT * FROM privatemessage WHERE User_reseiver = '".$_SESSION["userid"]."'";

$result=mysql_query($sql) or die ("Auslesen gescheitert.");

while ($zeile = mysql_fetch_array( $result, MYSQL_ASSOC))
{
  echo "<br>";
  echo $zeile['User_reseiver'] ." ";
  ?>
	<a href="message.php"><?php echo $zeile['subject']; ?></a>
  <?php
  echo $zeile['User_sender'] . "<br>";
}
?>
<a href="angemeldet.php">angemeldet</a>
<?php
}
else{
?>
Bitte loggen Sie sich erneut ein. Einen Moment bitte Sie werden weitergeleitet...
<meta http-equiv="refresh" content="0; URL=http://localhost/swtp_w/soccerPortal/index.php" />
<?php
}