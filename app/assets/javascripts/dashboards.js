$(function() {
    $('.linktomouseover').hover(function() {
        $(this).addClass('hover1');
        $(this).find("p").fadeIn();
    }, function() {
        $(this).removeClass('hover1');
        $(this).find("p").fadeOut();
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
