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

$(document).ready(function(){
  var pageflip = new RocketPageFlip('.pageflip');

});

// $('#story-form').validate({
//     debug: true,
//     rules: {
//         name: "required", // should be: "user[username]"
//         description: "required",
//         files: "required"
//     },
//     messages: {
//         user_username: "Please specify your name", // should be: "user[username]"
//         user_email: { // should be: "user[email]"
//             required: "We need your email address to contact you",
//             email: "Your email address must be in the format of name@domain.com"
//         }
//     }
// });

// $(function() {
// 	var COOKIE_NAME = 'splash-page-cookie';
// 	$go = $.cookie(COOKIE_NAME);
// 	if ($go == null) {
// 		$.cookie(COOKIE_NAME, 'test', { path: 'stories_path', expires: 6 });
// 		window.location = "/"
// 	}
// 	else {
// 	}
// });

 


