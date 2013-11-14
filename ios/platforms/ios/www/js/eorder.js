;(function($){
    $(".u-s-x").tap(function() {
        var $ul = $(".u-s-t>ul");
        if ($ul.is(":hidden")) {
            $ul.show();
        } else {
            $ul.hide();
        }
    });
    $(".u-s-t>ul>li").tap(function() {
        var $un = $(".u-s-t>span");
        var _t = $un.text();
        $un.text($(this).text());
        $(this).text(_t);
        $(".u-s-t>ul").hide();
    });
    $(".rimg").tap(function() {
        var $ok = $(this).children(".rok");
        var $s = $(".selected span");
        if ($ok.is(":hidden")) {
            $ok.show();
            var _ns = parseInt($s.text());
            $s.text(_ns+1);
        } else {
            $ok.hide();
            var _ns = parseInt($s.text());
            $s.text(_ns-1);
        }
    });
    $(".vo").tap(function() {
        if ($(this).hasClass("no")) {
            $(this).removeClass("no");
        } else {
            $(this).addClass("no");
        }
    });
    $("#menu>ul>li").tap(function() {
        $(this).addClass("cur").siblings().removeClass("cur");
    });
    $(".sp-x").tap(function() {
        var _t = parseInt($(".speople input").val());
        if (_t<=1) {

        } else {
            $(".speople input").val(_t-1);
        }
    });
    $(".sp-j").tap(function() {
        var _t = parseInt($(".speople input").val());
        if (_t>=20) {

        } else {
            $(".speople input").val(_t+1);
        }
    });
    $(".go").tap(function() {
        $(".pop").show();
    });
    $(".ok").tap(function() {
        var _p = $(".speople input").val();
        var _d = $(".sdesk").val();
        $(".people span").text(_p);
        $(".desk span").text(_d);
        $(".pop, .go, .logo").hide();
        $(".recipes, .people, .desk").show();
        $("#menu ul li").eq(1).addClass("cur").siblings().removeClass("cur");
    });
    $(".cancel").tap(function() {
        $(".pop").hide();
    });
})(Zepto)