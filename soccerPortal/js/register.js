$(document).ready(function(){	
	
	//open = false, da es beim Seitenaufbau geschlossen sein soll
	var open = false;
	
	//Das es zu anfang ausgeblendet wird
	$("#registerPopup").hide();
	
	//Bei Klick auf den Registrierenbutton
	$("#headerBtn").click(function(){
	
		//Wenn das Popup geschlossen ist
		if(open == false){
			//Einblenden
			$("#registerPopup").fadeIn("normal");
			//Das macht das popup beweglich
			$("#registerPopup").draggable();
			open=true;
		}		
		//Wenn das Popup geöffnet ist
		else{
			//Ausblenden
			$("#registerPopup").fadeOut("normal");
			open=false;
		}
	});
	
	$("#start").click(function(){
		$( "#inhalt" ).load( "public/startseite.php");
		document.getElementById('top').innerHTML='Aktuelle Top-Wetten:';
	});
	$("#about").click(function(){
		$( "#inhalt" ).load( "public/about.php");
		document.getElementById('top').innerHTML='About:';
	});
	$("#agbs").click(function(){
		$( "#inhalt" ).load( "public/agbs.php");
		document.getElementById('top').innerHTML='AGB´s:';
	});
	$("#faq").click(function(){
		$( "#inhalt" ).load( "public/faq.php");
		document.getElementById('top').innerHTML='FAQ´s:';
	});
	$("#impressum").click(function(){
		$( "#inhalt" ).load( "public/impressum.php");
		document.getElementById('top').innerHTML='Impressum:';
	});
});