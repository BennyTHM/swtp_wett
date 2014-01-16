$(document).ready(function(){	
	
	//Register Popup
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
		//Wenn das Popup ge�ffnet ist
		else{
			//Ausblenden
			$("#registerPopup").fadeOut("normal");
			open=false;
		}
	});
	
	
	//Passwort vergessen
	//open = false, da es beim Seitenaufbau geschlossen sein soll
	var open2 = false;
	
	//Das es zu anfang ausgeblendet wird
	$("#pwvergessenPopup").hide();
	
	//Bei Klick auf den Registrierenbutton
	$("#pwvergessen").click(function(){
	
		//Wenn das Popup geschlossen ist
		if(open2 == false){
			//Einblenden
			$("#pwvergessenPopup").fadeIn("normal");
			//Das macht das popup beweglich
			$("#pwvergessenPopup").draggable();
			open2=true;
		}		
		//Wenn das Popup ge�ffnet ist
		else{
			//Ausblenden
			$("#pwvergessenPopup").fadeOut("normal");
			open2=false;
		}
	});
	
	//Inhalt dynamisch nachladen
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
		document.getElementById('top').innerHTML='AGB�s:';
	});
	$("#faq").click(function(){
		$( "#inhalt" ).load( "public/faq.php");
		document.getElementById('top').innerHTML='FAQ�s:';
	});
	$("#kontakt").click(function(){
		$( "#inhalt" ).load( "public/kontakt.php");
		document.getElementById('top').innerHTML='Kontakt:';
	});
	$("#impressum").click(function(){
		$( "#inhalt" ).load( "public/impressum.php");
		document.getElementById('top').innerHTML='Impressum:';
	});
});