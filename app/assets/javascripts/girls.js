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
  $(".check_boxes").click(function(){
    var checkedVals = $('.check_boxes:checkbox:checked').map(function() {
        return Number(this.value);
    }).get();
    var sum = Number(0);
    services = eval(gon.services);
    //根据service.id 匹配checkbox，获得服务价格
    for (var i = 0, sum = 0; i < checkedVals.length; i++){
      for( var j = 0; j < services.length; j++){
        if(services[j].id == checkedVals[i]){
          sum += Number(services[j].service_price);
        }
      }
    };

    $("#task_price").val(sum);
  });
});

