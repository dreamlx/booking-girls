$(function() {
  //Enable swiping...
  $("#girl-show").swipe( {
    //Generic swipe handler for all directions
    swipe:function(event, direction, distance, duration, fingerCount) {
      url = document.URL;
      //id = url.match(/\d+$/);
      current_id  = $("#girl-show").attr("data-current-id");
      next_id     = $("#girl-show").attr("data-next-id");
      pre_id      = $("#girl-show").attr("data-pre-id");
      //alert(current_id);
      if(direction == 'left'  && current_id != pre_id){ location.href = '/girls/' + pre_id }
      if(direction == 'right' && current_id != next_id){ location.href = '/girls/' + next_id }
      //window.history.back(); // return last page
      
    },
    //Default is 75px, set to 0 for demo so any distance triggers swipe
     threshold:0
  });
});


$(document).ready(function() {
        $('a.fancybox').fancybox();
    });