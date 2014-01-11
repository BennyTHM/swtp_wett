<?php

require_once 'email.php';

$link = mysql_connect ('localhost','root','');
					
//Datenbank auswählen.
mysql_select_db("bet_system") or die ("Datenbank nicht gefunden");
					
if ( !$link )
{
	die('Momentan ist eine Verbindung zur Datenbank nicht möglich: ' . mysql_error());
}