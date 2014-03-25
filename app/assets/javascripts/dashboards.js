

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

$(document).ready(function(){
	$('a.remove').click (function(e){
		e.preventDefault()

		$.ajax(this.href, {method: 'delete'});
		$(this).parents("div:first").remove()
	});


})

// $('a.remove').click (function(){
// 	$(this).closest("li").hide();
// });
