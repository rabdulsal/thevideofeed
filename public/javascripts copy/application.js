$(document).ready(function() {
	$.scrollingParallax('/images/mt_rushmore.png', {
			bgWidth : '125%',
			bgHeight : '125%',
			enableHorizontal : true,
			staticSpeed : .3,
			staticSpeedX : .3,
	});


$('div.parallax-div_1').scrollingParallax({
    bgWidth : '1000%',
		bgHeight : '1000%',
		enableHorizontal : true,
		staticSpeed : .7,
		loopIt : false,
});
});