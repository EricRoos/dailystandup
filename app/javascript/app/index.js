$(document).on("ajax:complete", ".like-button-wrapper", function handleLikeSuccess(data, status, xhr){
  $.get($(this).data('refresh-url'));
});

$(document).on("ajax:beforeSend", ".like-button-wrapper", function handleLikeSuccess(data, status, xhr){
  $(this).html("Liking...");
});
