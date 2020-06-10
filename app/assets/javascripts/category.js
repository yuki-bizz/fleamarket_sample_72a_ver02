$(function(){
  $('li.leftLists__category').hover(function(){
      $("ul.categoryTree",this).show();
  }, function(){
      $("ul.categoryTree",this).hide();
  });

  $(function(){
    $(".categoryTree--item" + "#1").hover(function(){
      console.log("hello")
        $(".subcatTree--item",this).slice(1,19).show();
    }, function(){
        $(".subcatTree--item",this).slice(1,19).hide();
    });
  });
});