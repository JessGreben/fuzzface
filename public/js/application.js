$(document).ready(function() {

  // menu button configuration
  $("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
  });

  $(".main-buttons").siblings().hide();
  // debugger
  $(".main-buttons").on("click", function(e){
    e.preventDefault();
    if ($(this).siblings().first().is(":hidden")){
      $(this).siblings().first().slideDown("slow");
      $(this).addClass("selected-button");
    } else {
      $(this).siblings().first().slideUp();
      $(this).removeClass("selected-button");
    }
  });
});
