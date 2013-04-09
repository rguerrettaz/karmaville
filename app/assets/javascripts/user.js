$(document).ready(function() {
  var page = parseInt($(".current-page").html());
  var numPages = parseInt($(".num-pages").html());

  $("#" + page).parent().addClass("active");
  
  if (page == numPages) {
    $("#next").parent().addClass("disabled");
    $("#next").click(function(e) {
      e.preventDefault();
    });
  }
  if (page == 1) {
    $("#prev").parent().addClass("disabled");
    $("a").click(function(e) {
      e.preventDefault();
    });
  }

});
