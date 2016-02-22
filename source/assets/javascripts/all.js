//= require jquery/dist/jquery
//= require jrespond/jRespond
//= require responders
//= require navigation

$(document).ready(function() {
    $('.tabs a').on('click', function() {
      if (!$(this).hasClass('active')) {
        $('.tabs a').toggleClass('active');
        $('.tab-content div').toggleClass('active');
      }
    });
});