$(function(){
  $(".leftLists li").hover(function(){
      $("ul:not(:animated)", this).slideDown();
  }, function(){
      $("ul.categoryTree",this).slideUp();
  });

  $(function(){
    $(".categoryTree--item").siblings("#1").hover(function(){
      $("ul:not(:animated)",this).slice(1,19).slideDown();
    }, function(){
      $("ul.subcatTree",this).slice(1,19).slideUp();
    });
  });
});