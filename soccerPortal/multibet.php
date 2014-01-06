<?php

  session_start();
  include 'includes/connect.php';
  $mysql = new Mysql();
  $mysql->connect();
  
  $temp = count($_POST['bets']);
  echo $temp . "<br/>";
  
  if ($temp == 1){
    //--- Einzelwette ---
  	$mysql->bet($_POST['bets'][0]);
  	list ($gameID, $homeorguest) = explode("_", $_POST['bets'][0]);
  	echo "GameID: " . $gameID . ", Place: " . $homeorguest;
  } else {
    //--- Kombiwette ---
  	$mysql->multibet($_POST['bets']);
  }

?>
