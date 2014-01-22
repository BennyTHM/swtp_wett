<?php 

include '../includes/connect.php';

$mysql = new Mysql();
$mysql->connect();
$sql = "select * from user";
$result1 = $mysql->mysqli->query($sql);
?>


<html>
<head>

</head>
<body>

<?php 
echo "<p><div id='user'></div><p><br/>";
echo "<div id='userTable'>";
if ($mysql->mysqli->affected_rows > 0){
	echo "<table id='userlist' border='1'>";
	echo "<tr>";
	echo "<th>UserID</th><th>Username</th><th>Passwort</th><th>istAdmin";
	echo "</th><th>Balance</th><th>online</th><th>shoutbox</th><th>Newslettter</th><th>snDate</th><th>image</th>";
	echo "</tr>";
	while ($row = $result1->fetch_assoc()){
		echo "<tr>";
		echo "<td>". $row['userID'] . "</td>";
		echo "<td>". $row['username'] . "</td>";
		echo "<td>". $row['password'] . "</td>";
		
		echo "<td>". $row['isadmin'] . "</td>";
		echo "<td>". $row['balance'] . "</td>";
		echo "<td>". $row['set_online'] . "</td>";
		echo "<td>". $row['set_shoutbox'] . "</td>";
		echo "<td>". $row['set_newsletter'] . "</td>";
		echo "<td>". $row['signin_date'] . "</td>";
		echo "<td>". $row['image_imageID'] . "</td>";		
		echo "<td><button class='showUser' name='". $row['userID'] ."'>Ändern</button</td>";
		echo "<td><button class='deleteUser' name='". $row['userID'] ."'>Löschen</button</td>";
		echo "</tr>";
    }
    echo "</table>";
}
echo "</div>";

?>
<script type="text/javascript" src="../js/admin.js"></script>
<script type="text/javascript" src="../js/jquery-1.10.2.js"></script>
<script>
$(".showUser").click(function() {
	var userID = $(this).attr("name")
	var request = $.ajax({
		url: "../admin/showUser.php",
		type: "POST",
		data: { id : userID },
		dataType: "html"
	});
	request.done(function( msg ) {
	$( "#user" ).html( msg );
	});
	request.fail(function( jqXHR, textStatus ) {
	alert( "Request failed: " + textStatus );
	})
	$("#userTable").hide();
});

$(".deleteUser").click(function() {
	var userID = $(this).attr("name")
	var x = confirm("Wollen Sie den User mit der Nr.: n" + userID + " wirklich löschen?");
	if (x == true){
		var request = $.ajax({
			url: "../admin/deleteUser.php",
			type: "POST",
			data: { id : userID },
			dataType: "html"
		});
		request.done(function( msg ) {
		$( "#user" ).html( msg );
		});
		request.fail(function( jqXHR, textStatus ) {
		alert( "Request failed: " + textStatus );
		})
		$("#userTable").hide();
	}
});








</script>

</body>

</html>