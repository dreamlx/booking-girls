$(function() {      
  //Enable swiping...
  $("#girl-show").swipe( {
    //Generic swipe handler for all directions
    swipe:function(event, direction, distance, duration, fingerCount) {
      url = document.URL;
      id = url.match(/\d+$/);
      $("#girl-show").fadeOut();
      //alert(id);
      if(direction == 'left'){ location.href = '/girls/' + id + '/nextpage' }
      if(direction == 'right'){ location.href = '/girls/' + id + '/prepage' }
      //window.history.back(); // return last page
      
    },
    //Default is 75px, set to 0 for demo so any distance triggers swipe
     threshold:0
  });
});
