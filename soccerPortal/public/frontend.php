<?php 
 session_start();

if(isset($_SESSION["username"])){
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Soccer Portal</title>

<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link rel="SHORTCUT ICON" href="../sp.ico" type="image/x-icon">

<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="../js/shoutbox.js"></script>

</head>
<body>
	<div id="frontendHead">
		<div id="frontendNavi">
		<div id="logoSpacer"><div id="frontlogo"></div></div>
		<div id="navspace">
			<div id="navBtns">
				<a href="https://www.google.de/?gws_rd=cr&ei=qGanUpXAMcf2ygOzwYCQDA"><div id="button1" class="leftBtn"><div class="frontbtnsTxt">Nachrichten</div></div></a>
				<div id="button2" class="rightBtn"><div class="frontbtnsTxt">Wetten</div></div>
				<div id="button3" class="rightBtn"><div class="frontbtnsTxt">Home</div></div>
				<div id="button4" class="rightBtn"><div class="frontbtnsTxt">Bestenliste</div></div>
				<div id="button5" class="rightBtn"><div class="frontbtnsTxt">Profil</div></div>
				<div id="button6" class="rightBtn"><div class="frontbtnsTxt">Ligen</div></div>
				<div id="button7" class="rightBtn last"><div class="frontbtnsTxt">WM</div></div>
			</div>
			<div id="navgreen"></div>
		</div>
		<div id="score"><div id="coin"></div><div id="money"><?php echo $_SESSION["kontostand"]; ?></div><div id="toplist" class="utext">Toplist</div><div id="arrows"></div></div>
		<div id="profilspacer"><a href="http://en.wikipedia.org/wiki/Gandalf"><div id="profilPic"></div></a></div>
		<div id="username" class="utext"><?php echo $_SESSION["username"]; ?></div>
		<a href="logout.php"><div id="logoutBtn"></div></a>
	</div>
	<!-- open shoutbox -->
	<?php $bild="zuklappen.png" ?>
		<div id="shoutboxbutton">
			<img src="<?php echo "../images/site/shoutbox/" . $bild; ?>" id="shoutboxpicture" alt="shoutbox" onclick="changePic();"/>
		</div>
		<div id="shoutbox" class="ui-widget-content">
			<p>
				Hier steht dann später die shoutbox drinnen. Dort kann man chatten und so ein Mist...
			</p>
		</div>
		<!-- close shoutbox -->
</body>
</html>

<?php
}
else{
?>
	Bitte loggen Sie sich erneut ein. Einen Moment bitte Sie werden weitergeleitet...
	<meta http-equiv="refresh" content="0; URL=:../index.php" />
<?php
}