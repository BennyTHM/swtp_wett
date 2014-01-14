$(document).ready(function() {
	//Dropdown
	$("#nav li:has(ul)").hover(function(){
		$(this).find("ul").slideDown();
	}, function(){
		$(this).find("ul").hide();
	});
	
	//Dynamisch nachladen
	$("#posteingang").click(function(){
		$( "#frontendmain" ).load( "posteingang.php");
	});
	$("#postausgang").click(function(){
		$( "#frontendmain" ).load( "postausgang.php");
	});
	$("#verfassen").click(function(){
		$( "#frontendmain" ).load( "pm.php");
	});
	$("#button1").click(function(){
		$( "#frontendmain" ).load( "posteingang.php");
	});
	$("#button2").click(function(){
		$( "#frontendmain" ).load( ".php");
	});
	$("#button3").click(function(){
		$( "#frontendmain" ).load( ".php");
	});
	$("#button4").click(function(){
		$( "#frontendmain" ).load( ".php");
	});
	$("#button5").click(function(){
		$( "#frontendmain" ).load( ".php");
	});
	$("#button6").click(function(){
		$( "#frontendmain" ).load( ".php");
	});
	$("#button7").click(function(){
		$( "#frontendmain" ).load( ".php");
	});
	
});