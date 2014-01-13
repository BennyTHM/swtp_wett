<?php

require_once 'swift/lib/swift_required.php';


function sendEmail($wohin,$betreff,$text){

$transport = Swift_SmtpTransport::newInstance('smtp.gmail.com', 465, "ssl")
  ->setUsername('wettethm')
  ->setPassword('wette123');

$mailer = Swift_Mailer::newInstance($transport);
$message = Swift_Message::newInstance($betreff)
  ->setFrom(array('wettethm@gmail.com' => 'soccerWettportal'))
  ->setTo(array($wohin => 'Kunde'))
  ->setBody($text);

	$mailer->send($message);
	echo "Nachricht versendet";

}





?>


