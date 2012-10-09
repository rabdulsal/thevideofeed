//= require jquery
//= require fancybox
//= require_tree .

$(document).ready(function() {
  $("a.fancybox").fancybox({
		'width' : 853,
    'height': 480,
		'autoDimensions' : false,
		'autoscale' : true,
		'overlayOpacity' : 0.8
  });
});
