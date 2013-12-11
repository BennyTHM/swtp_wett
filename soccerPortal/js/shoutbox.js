$(document).ready(function(){	
	//slide animation
	$("#shoutboxbutton").click(function(){
		$("#shoutbox").toggle("drop");
	});
});

//Bilder austauschen
function changePic(){
	var pic=$("#shoutboxpicture").attr('src');
	if(pic.search("zuklappen.png") != -1 ){
		pic=pic.replace("zuklappen.png","aufklappen.png");
		$("#shoutboxpicture").attr('src',pic);
	}
	else{
		pic=pic.replace("aufklappen.png","zuklappen.png");
		$("#shoutboxpicture").attr('src',pic);
	}
}