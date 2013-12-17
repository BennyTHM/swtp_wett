<?php

class Mysql {

	public $link;
	public $result;
	
	function connect(){
		$link = mysql_connect('localhost', 'root', '');
		mysql_select_db('bet_system');
		return $link;
	}
	

	function exist($email, $username){
		$query = "SELECT * FROM User WHERE email='{$email}' OR  username='{$username}'";
		$result = mysql_query($query);
		if (mysql_affected_rows() == 0){
			return false;
		} else {
			return true;
		}
	}
	
	//TODO: Betreff angeben, TEXT SELBST angeben können, diese funktion muss viel flexibler werden, wenn wir die von überall benutzen können sollen.
	function sendEmail($name, $mail, $password){
		$nachricht = "Ihr Passwort ist: " . $password . 
		". Nach der Änderung Ihres aktuellen Passworts, wird Ihr Benutzerkonto aktiviert.";
		// $nachricht = wordwrap($nachricht, 70);
		mail($mail, 'Mein Betreff', $nachricht);
	}
	
	function random_pwd($length){
		// Festlegung der verfÃ¼gbaren Buchstaben, Zahlen und Sonderzeichen
		//$specialChars = array('!','@','#','$','%','&','*','(',')','_','-','+','=','[',']','<','>','?','/');
		$chars = array_merge(range('a','z'), range('A','Z'), range(0,9));
		// Einzelne Buchstaben entfernen
		//unset($chars[array_search('i',$chars)]);
		$chars = array_values($chars);
		// Array mischen
		shuffle($chars);
		// Array beschneiden
		$pwd = array_slice($chars,0,$length);
		// RÃ¼ckgabewert als String
		return implode('',$pwd);
  	}
  
  	function getSaltFrom($username, $password){
  		$gehashtes_passwort = crypt($username.$password, 'hash');
  		return $gehashtes_passwort;
  	}

}
?>
