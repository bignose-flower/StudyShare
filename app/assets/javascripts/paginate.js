$(document).on('turbolinks:load', function() {
  $('.pagination li a').on('click', function(e){
    $('html, body').animate({ scrollTop: $('.Header')[0].scrollHeight - 50});
  })
});