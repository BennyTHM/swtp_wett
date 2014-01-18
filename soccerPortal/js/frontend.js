$(document).ready(function() {
	//Dropdown
	$("#nav li:has(ul)").hover(function(){
		$(this).find("ul").slideDown();
	}, function(){
		$(this).find("ul").hide();
	});
	
	//Dynamisch nachladen
	//Nachrichten
	$("#posteingang").click(function(){
		$( "#inhalt" ).load( "posteingang.php");
		document.getElementById('top').innerHTML='Posteingang:';
	});
	$("#postausgang").click(function(){
		$( "#inhalt" ).load( "postausgang.php");
		document.getElementById('top').innerHTML='Postausgang:';
	});
	$("#verfassen").click(function(){
		$( "#inhalt" ).load( "pm.php");
		document.getElementById('top').innerHTML='Mitteilung verfassen:';
	});
	$("#button1").click(function(){
		$( "#inhalt" ).load( "posteingang.php");
		document.getElementById('top').innerHTML='Posteingang:';
	});
	//Wetten
	$("#button2").click(function(){
		$( "#inhalt" ).load( ".php");
		document.getElementById('top').innerHTML='Wette:';
	});
	//Home
	$("#button3").click(function(){
		$( "#inhalt" ).load( "aktuelleSpiele.php");
		document.getElementById('top').innerHTML='Aktuelle Top-Wetten:';
	});
	//Bestenliste
	$("#button4").click(function(){
		$( "#inhalt" ).load( ".php");
		document.getElementById('top').innerHTML='Bestenliste:';
	});
	//Profil
	$("#button5").click(function(){
		$( "#frontcontent" ).load( "profil.php");
		document.getElementById('top').innerHTML='Profil:';
	});
	$("#profilPic").click(function(){
		$( "#frontcontent" ).load( "profil.php");
		document.getElementById('top').innerHTML='Profil:';
	});
	$("#profilAnsicht").click(function(){
		$( "#frontcontent" ).load( "profil.php");
		document.getElementById('top').innerHTML='Profil:';
	});
	$("#profilBear").click(function(){
		$( "#frontcontent" ).load( "profilBear.php");
		document.getElementById('top').innerHTML='Profil bearbeiten:';
	});
	//tabellen der Ligen
	$("#button6").click(function(){
		$( "#inhalt" ).load( ".php");
		document.getElementById('top').innerHTML='Ligen:';
	});
	//WM
	$("#button7").click(function(){
		$( "#inhalt" ).load( ".php");
		document.getElementById('top').innerHTML='WM:';
	});
	
});