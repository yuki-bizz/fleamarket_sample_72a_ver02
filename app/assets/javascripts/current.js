/*
$(function () {
  $('.side_nav .menu .menu-list a').each(function () {
    var target = $(this).attr('href');
    if (location.href.match(target)) {
      $(this).parent().addClass('on');
    } else {
      $(this).parent().removeClass('on');
    }
  });
});
*/
$(document).ready(function () {
  if (location.pathname != "/") {
    $('.side_nav .menu .menu-list a[href^="/' + location.pathname.split("/")[1] + '"]').addClass('on');
  } else $('.side_nav .menu .menu-list a:eq(0)').addClass('on');
});