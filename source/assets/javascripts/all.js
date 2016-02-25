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

    $('.services-accordion .icon').on('click', function() {
      $(this).toggleClass('icon-plus icon-minus');
      $(this).parent().next().toggleClass('is-showing');
    });

    $('.menu-trigger').on('click', function() {
      $(this).toggleClass('open');
    });
});