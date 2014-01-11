<?php

require_once 'email.php';

class Mysql {

        public $link;
        public $result;
        public $mysqli;
        public $userID;
        
        function connect(){
                $this->mysqli = new mysqli("localhost","root","","bet_system");
                return $this->link;
        }
        
        //Schreibt die Spielliste fürs Wetten in HTML
        function gamelist(){
        	$result1 = $this->mysqli->query("
        	SELECT gameID, 
        	(SELECT title
				FROM Team
				WHERE teamID = Game.Team_home
			) as home, 
			(SELECT title
				FROM Team
				WHERE teamID = Game.Team_guest
			) as guest,
			Team_home, Team_guest, quote_home, quote_guest, quote_draw
			FROM Game");
        	if ($this->mysqli->affected_rows > 0){
        		while ($row = $result1->fetch_assoc()){
        			$home = $row['home'];
        			$guest = $row['guest'];
        			echo "<input name='gameID' type='hidden' value='{$row['gameID']}'/>";
        			echo "<input name='quote_home' type='hidden' value='{$row['quote_home']}'/>";
        			echo "<input name='quote_guest' type='hidden' value='{$row['quote_guest']}'/>";
        			echo "<input name='quote_draw' type='hidden' value='{$row['quote_draw']}'/>";
        			echo $row['home'] . " vs " . $row['guest'];
        			echo "<select id='". $row['gameID'] ."' name='selectedTeam'>";
        			echo "<option value='home'>".$row['home']."</option>";
        			echo "<option value='guest'>".$row['guest']."</option>";
        			echo "<option value='equal'>Unentschieden</option>";
        			echo "</select>";
        			//echo "<button type='button' onclick='myFunction(". json_encode($row['gameID']). "," . json_encode($row['quote_home']) . ", " . json_encode($row['quote_guest']) . ", " . json_encode($row['quote_draw']) . ", " . json_encode($row['home']) . "," . json_encode($row['guest']) .  "')'>wette</button>";
        			echo "<button type='button' onclick='myFunction(" . json_encode($row['gameID']) . ", " . json_encode($row['quote_home']) . ", "  . json_encode($row['quote_guest']) .", " . json_encode($row['quote_draw']) .", " . json_encode($row['home']) .", " . json_encode($row['guest']) .")'>wetten</button>";
        			echo "<br/>";
        		}

        		
        	}
        }
        
		function bet($var){
			list ($gameID, $homeguestequal) = explode("_", $var);
			$quote; $tipp;
			switch($homeguestequal){
				case "home": $quote = "quote_home"; $tipp = 1; break;
				case "quest": $quote = "quote_guest"; $tipp = 2; break;
				case "equal": $quote = "quote_draw"; $tipp = 0; break;
			}
			/* Ausgabe zur Kontrolle */
			echo "homequestequal: " . $homeguestequal . "<br/>";
			echo "quote: " . $quote . "<br/>";
			echo "tipp: " . $tipp . "<br/>";
			/* --------------------- */
			
			$sql = "select ". $quote ." from game where gameID = {$gameID}";
			$result = $this-> mysqli->query($sql);
			
			/* Ausgabe zur Kontrolle */
			echo "selectzeilen:" . $this->mysqli->affected_rows . "<br/>";
			/* --------------------- */
        	if (!$result)
        		echo $this->mysqli>error . "<br/>";
        	
        	$row = $result->fetch_assoc();
        	$quote = $row[$quote];
        	
        	/* Ausgabe zur Kontrolle */
        	echo "Die Quote beträgt: " . $quote . "<br/>";
        	/* --------------------- */
        	
			$sql = "insert into bet(betID, User_userID, Game_gameID, tipp, bet_amount, quote) values (11, 4, {$gameID}, {$tipp}, 1, {$quote}) ";
			$result = $this-> mysqli->query($sql);
			if (!$result)
        		echo $this->mysqli->error . " (insert)<br/>";
        	
		}
		
		function multibet($var){
			$quote; $tipp;
			$userID = 4;	// userID muss automatisiert werden!
			$temp = count($var);
			$sql = "select count(*) as summe from combibet";	
			$result = $this->mysqli->query($sql);
			$row = $result->fetch_assoc();
			$combibetID = $row['summe'];
			$combibetID = $combibetID + 1;
			$sql = "insert into combibet(combibetID, User_userID) values ({$combibetID}, {$userID})";
			$result = $this-> mysqli->query($sql);
			if (!$result){
        		echo $this->mysqli->error . " (insert CombiBet)<br/>";
			} else {
				echo "Insert CombiBet erfolgreich!<br/>";
			}
			
			$sql = "select max(combibetID) as combibetID from combibet";
			$result = $this-> mysqli->query($sql);
			$row = $result->fetch_assoc();
			$combibetID = $row['combibetID'];
			echo "combitbetID: " . $combibetID;
			
			
			
			for ($i = 0; $i < $temp; $i++ ){
				list ($gameID, $homeguestequal) = explode("_", $var[$i]);
				switch($homeguestequal){
					case "home": $quote = "quote_home"; $tipp = 1; break;
					case "quest": $quote = "quote_guest"; $tipp = 2; break;
					case "equal": $quote = "quote_draw"; $tipp = 0; break;
				}
				$sql = "select ". $quote ." from game where gameID = {$gameID}";
				$result = $this-> mysqli->query($sql);
				$row = $result->fetch_assoc();
        		$quote = $row[$quote];
				$sql = "insert into partbet(Combibet_combibetID, Game_gameID, tipp, bet_amount, quote) values ({$combibetID}, {$gameID}, {$tipp}, {$temp}, {$quote})";
				$result = $this-> mysqli->query($sql);
				if (!$result){
	        		echo $this->mysqli->error . " (insert Partbet)<br/>";
				} else {
					echo "Insert Partbet erfolgreich!";
				}
			}
		}
		
        function exist($email, $username){
                $this->result =  $this->mysqli->query("SELECT * FROM User WHERE email='{$email}' OR username='{$username}'");
                if ($this->mysqli->affected_rows == 0){
                        return false;
                } else {
                        return true;
                }
        }
        
        function random_pwd($length){
                // Festlegung der verfÃƒÂ¼gbaren Buchstaben, Zahlen und Sonderzeichen
                //$specialChars = array('!','@','#','$','%','&','*','(',')','_','-','+','=','[',']','<','>','?','/');
                $chars = array_merge(range('a','z'), range('A','Z'), range(0,9));
                // Einzelne Buchstaben entfernen
                //unset($chars[array_search('i',$chars)]);
                $chars = array_values($chars);
                // Array mischen
                shuffle($chars);
                // Array beschneiden
                $pwd = array_slice($chars,0,$length);
                // RÃƒÂ¼ckgabewert als String
                return implode('',$pwd);
          }
  
          function getSaltFrom($username, $password){
                  $gehashtes_passwort = crypt($username.$password, 'hash');
                  return $gehashtes_passwort;
          }

}
?>
