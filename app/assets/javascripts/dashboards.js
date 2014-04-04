$(function() {
    $('.linktomouseover').hover(function() {
        $(this).addClass('hover1')
    }, function() {
        $(this).removeClass('hover1')
    });
});

$(document).ready(function(){
  $(".form_div").hide();
  $("#add_spot").on("click", function(e){
    e.preventDefault();
    $(".form_div").toggle();
    $(".plus_sign").toggle();
  });
});
// $("a[data-remote]").on "ajax:success", (e, data, status, xhr) ->
// $(document).on 'click', '.remove', ->
// 	$(@).closest('li').fadeOut()

// $("a[data-remote]").on("ajax:success", function(e, data, status, xhr) {});
// $(function() {
// 	$('.remove').click(function(event) {
// 		console.log(this);
// 		// $.delete()
// 	// return $(this).closest('tr').fadeOut();
// 	event.preventDefault();
// 	});
// });


// $('a.remove').click (function(){
// 	$(this).closest("li").hide();
// });
