$(function() {
  $("a.fancybox").fancybox();
  
  $("#pageback").click(function(){
    history.back();
  });
  
  $(".check_boxes").click(function(){
    var checkedVals = $('.check_boxes:checkbox:checked').map(function() {
        return Number(this.value);
    }).get();
    var sum = Number(0);
    var service_detial = "";
    services = eval(gon.services);
    //根据service.id 匹配checkbox，获得服务价格
    for (var i = 0, sum = 0; i < checkedVals.length; i++){
      for( var j = 0; j < services.length; j++){
        if(services[j].id == checkedVals[i]){
          sum += Number(services[j].service_price);
          service_detial += services[j].service_name + ":" + services[j].service_price;
          service_detial +=", ";
          
        }
      }
    };

    $("#task_price").val(sum);
    $("#task_title").val(service_detial);
  });
});
