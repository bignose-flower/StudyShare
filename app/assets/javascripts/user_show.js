$(document).on('turbolinks:load', function() {
  $('.Content__questions').on('click', function(){
    $('.User-Answers').addClass('hidden');
    $('.User-Questions').toggleClass('hidden');
  });
  $('.Content__answers').on('click', function(){
    $('.User-Questions').addClass('hidden');
    $('.User-Answers').toggleClass('hidden');
  });
});