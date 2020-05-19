window.addEventListener('load', function() {
  if (navigator.serviceWorker) {
    navigator.serviceWorker.register('/service-worker.js', { scope: './' })
      .then(function(reg) {
        console.log('[Companion]', 'Service worker registered!');
        console.log(reg);
      }).catch(function(err){
        console.log('failed to register');
      });
  }
});

$(document).on("ajax:success", ".like-button-wrapper", function handleLikeSuccess(data, status, xhr){
  $.get($(this).data('refresh-url'));
});

$(document).on("ajax:beforeSend", ".like-button-wrapper", function handleLikeSuccess(data, status, xhr){
  $(this).html("Saving...")
});
