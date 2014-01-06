<?php
session_start();
include 'includes/connect.php';
include 'testphp.php';


$mysql = new Mysql();
$mysql->connect();


$_SESSION['mysql'] = $mysql;


	?>

<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<script src="/js/jquery-1.10.2.js"></script>
</head>
<body>
<script>


</script>
<script>
			var gameandteam;
			
			function myFunction(gameID, quote_home, quote_guest, quote_draw, home, guest)
			{				
				if ($("p[id^='"+gameID+"_']").length < 1){
				var e = document.getElementById(gameID); 
				var teamvalue = e.options[e.selectedIndex].value;
				var teamtext = e.options[e.selectedIndex].text;
				gameandteam = gameID+"_"+teamvalue;
				$("#inputs").append("<p id='"+gameandteam+"'>"+home+" vs. "+guest+" haben sie auf "+teamtext+" getippt. "+gameandteam+"</p>");	
				$("#"+gameandteam).append("<button class='removebutton'>remove</button>");	
				$("#"+gameandteam).append("<input type='hidden' name='bets[]' value='"+gameandteam+"'/>");
	
				} else {
					alert("Spiel schon vorhanden");
				}
				$("#liste").append(", " + $("p[id^='"+gameID+"_']").length);

				$( ".removebutton" ).click(function() {
					var $parent = $(this).parent()
					$parent.remove();
					
			  });	
				
			}
		</script>
		



<?php
$mysql->gamelist();
?>

<form id="list" method="post" action="multibet.php">
<div id="inputs"></div>
<button type="button" id="wetten">Wetten</button>
</form>
<div id="liste"></div>
<script>
			$("#wetten").click(function(){
				var l = $("#inputs").find("p").length;
				if (l < 1){
					alert("Mindestens eine Wette");
				}
				if (l === 3 || l === 5){
					alert("Multiwette");
					$("#list").submit();
				}

				if (l == 1){
					alert("Einzelwette");
					$("#list").submit();
				}
				if (l === 2 || l === 4 || l > 5){
					alert("Erlaubte Anzahl: 1, 3 und 5");
				}
				});
				
</script>

</body>

</html>
