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
});