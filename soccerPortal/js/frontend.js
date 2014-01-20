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
		$( "#frontcontent" ).load( "posteingang.php");
		document.getElementById('top').innerHTML='Posteingang:';
	});
	$("#postausgang").click(function(){
		$( "#frontcontent" ).load( "postausgang.php");
		document.getElementById('top').innerHTML='Postausgang:';
	});
	$("#verfassen").click(function(){
		$( "#frontcontent" ).load( "pm.php");
		document.getElementById('top').innerHTML='Mitteilung verfassen:';
	});
	$("#button1").click(function(){
		$( "#frontcontent" ).load( "posteingang.php");
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
	});
	$("#profilPic").click(function(){
		$( "#frontcontent" ).load( "profil.php");
	});
	$("#profilAnsicht").click(function(){
		$( "#frontcontent" ).load( "profil.php");
	});
	$("#profilBear").click(function(){
		$( "#frontcontent" ).load( "profilBear.php");
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