// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require fancybox
//= require jquery_ujs
//= require_tree .
// Loads all Bootstrap javascripts
//= require bootstrap
//= require jquery_nested_form

$(function () {
  $("#toTop").scrollToTop(200);
	var austDay = new Date();
  //alert(austDay);
	sec = $('#defaultCountdown').attr("rel");
  if(sec > 0){
    austDay = sec * 1000 - austDay.getTime() ;
    austDay = new Date(sec * 1000);
    //alert(austDay);
	 $('#defaultCountdown').countdown({
    until: austDay, format: 'MS',
    layout: '工作中,还有 <b>{mnn}分{snn}秒</b> {desc}', 
    description: '请耐心等待'
    });
  }
});
