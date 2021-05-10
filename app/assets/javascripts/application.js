// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require cocoon

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

  $(document).ready(function(){
    $('.heading-slider').bxSlider({
      mode: 'fade',
      slideWidth: 1200,
      moveSlides: 1,
      maxSlides: 1,
      speed: 800,
      auto: true,
      stopAutoOnClick: true,
      autoHover: true,
    });
  });

  $(document).ready(function(){
    $('.latest-slider').bxSlider({
      mode: 'horizontal',
      easing: 'linear',
      captions: true,
      slideWidth: 150,
      auto: true,
      stopAutoOnClick: true,
      maxSlides: 4,
      slideMargin: 60,
      pager: false,
      speed: 900,
      controls: false
    });
  });