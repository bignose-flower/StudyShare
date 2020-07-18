$(document).on('turbolinks:load', function() {
  $('.Menu_bar').on('click', function(){
    $('.Menu_bar').toggleClass('menu_open');
    $('.Menu').toggleClass('hidden');
  })
});