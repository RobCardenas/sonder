// center text in middle of the screen

$(document).ready(function(){
  // $('.welcome').css({ 'width':'100%', 'text-align':'center' });
  var wel = $('.welcome').height();
  var h = wel/2;
  var w1 = $(window).height();
  var w = w1/2;
  var m = w - h
  $('.welcome').css("margin-top",m + "px")
});

// Initializes slider
$(document).ready(function(){
  $('.bxslider').bxSlider();
});

