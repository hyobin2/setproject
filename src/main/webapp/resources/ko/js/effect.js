
function scrollCheckImg(_scrTop){
    checkObject('.wave', _scrTop , 200);
    checkObject('.pattern', _scrTop , 200);
    checkObject('.section_area .wrapper .main_tit', _scrTop , 100);
    checkObject('.now_area .section_inner .slide_area', _scrTop , 250);
    checkObject('.infra_area ul li', _scrTop , 100);
    checkObject('.infra_area ul li .text', _scrTop , 100);   
}
    
function checkObject(_obj, _scrTop, _gap){
    $(_obj).each(function (i, t) {
        var selfHeight = $(this).offset().top - _gap;
        var checkHeight =  selfHeight - (window.innerHeight / 2) ;
        if (_scrTop > checkHeight && checkHeight > 0) {
            if (!$(this).hasClass('on')) {
                $(this).addClass('on');
            }
        }else{
            if ($(this).hasClass('on')) {
                /*if(_obj == '.circle'){
                 $(this).removeClass('on');
                 }*/
            }
        }
    });
}

function scrollMaskImg(_scrTop){

    $('.pattern.up').each(function (i, t) {
        var scrTop = _scrTop / 20 * -1;
            TweenMax.to($(this).find('img'), 0.4, {y:scrTop, force3D:true});
    });
    $('.pattern.dowm').each(function (i, t) {

        var scrTop = _scrTop / 10 * 1;
        TweenMax.to($(this).find('img'), 0.2, {y:scrTop, force3D:true});
    });
}

function parallaxMotion( _scroll,_min, _max,_$scope,_callback){
    if(_$scope.length==0){return;}

    var maxscroll = document.body.clientHeight-window.innerHeight;

    _min=(_min>maxscroll-100?maxscroll-100:_min);

    var per = (_scroll-_min)/((_max>maxscroll?maxscroll:_max)-_min);
    per = (per < 0)?0:(per>1)?1:per;

    if (_callback) {
        _callback(per);
    }

}

function scrollMotion(_scroll,_min,_$scope,_callback){
    if(_scroll>=_min) {
        if (_callback && _$scope[0].is_play==undefined ) {
            _callback();

            _$scope[0].is_play=true;
        }

    }
}

$(function(){
    if($('body').hasClass('main')){
        var w = 2000;var is_slide=true
            $('.curve1').css("marginLeft",-w);
            $('.curve2').addClass('active').css("marginLeft",0);
            $('.curve3').css("marginLeft",w);

        var $scoll = $('#contents');
        var scrollTime = 0.5;
        var scrollDistance = 120;
        var scrTop = $scoll.scrollTop();

        /*  $window.on("mousewheel DOMMouseScroll", function(event) {

            event.preventDefault();

            var delta = event.originalEvent.wheelDelta / 120 || -event.originalEvent.detail / 3;
            scrTop = scrTop - parseInt(delta * scrollDistance);
            scrTop = Math.max(0, Math.min($scoll[0].scrollHeight, scrTop));

            TweenMax.to($scoll, scrollTime, {y: -scrTop, ease: Power1.easeOut, overwrite: 5});
        });*/

        $(window).scroll(function(e) {

            var scrTop = $(window).scrollTop();
            scrollCheckImg(scrTop);
            scrollMaskImg(scrTop);
    
            var min_wave1_offt = $('#wave1').offset().top;
            var min_wave1 = min_wave1_offt - window.innerHeight;
            var max_wave1 = min_wave1+(window.innerHeight/2);
    
            parallaxMotion(scrTop, min_wave1, max_wave1, $('#wave1'), function (per) {
                if ($('#wave1').hasClass('on')) {
                    TweenMax.to($('#wave1 g'), 0.5, {x: per * 70 , ease: Quad.easeOut});
                }
            });
    
            var min_wave2_offt = $('#wave2').offset().top;
            var min_wave2 = min_wave2_offt - window.innerHeight;
            var max_wave2 = min_wave2+(window.innerHeight/2);
    
            parallaxMotion(scrTop, min_wave2, max_wave2, $('#wave2'), function (per) {
                if ($('#wave2').hasClass('on')) {
                    TweenMax.to( $('#wave2 g'), 0.6, {x: per *80,ease: Quad.easeOut});
                }
    
            });
    
            var min_wave3_offt = $('#wave3').offset().top;
            var min_wave3 = min_wave3_offt - window.innerHeight;
            var max_wave3 = min_wave3+(window.innerHeight/2);
    
            parallaxMotion(scrTop, min_wave3, max_wave3, $('#wave3'), function (per) {
                if ($('#wave3').hasClass('on')) {
                    TweenMax.to($('#wave3 g'), 0.5, {x: per * 60, ease: Quad.easeOut});
                }
            });
    
            var min_wave4_offt = $('#wave4').offset().top;
            var min_wave4 = min_wave4_offt -window.innerHeight;
            var max_wave4 = min_wave4+(window.innerHeight/2);
    
            parallaxMotion(scrTop, min_wave4, max_wave4, $('#wave4'), function (per) {
                if ($('#wave4').hasClass('on')) {
                    TweenMax.to($('#wave4 g'), 0.7, {x: per * 85+20 , ease: Quad.easeOut});
                }
            });
    
            var min_bg_offt = $('.seciton_others').offset().top;
            var min_bg = min_bg_offt -window.innerHeight;
            var max_bg = min_bg+$('.section_others').innerHeight();
    
            parallaxMotion(scrTop, min_bg, max_bg, $('.section_others .bg'), function (per) {
                var val = 150;
                TweenMax.to($('.section_others .bg'), 0.6, {y: per * -150 + 100, ease: Quad.easeOut});
            });
        });
    } else {
        $(window).scroll(function(e) {
            var scrTop = $(window).scrollTop();
            if($('.top_wave').length>0){
                var min_wave = $('.section_top').hasClass('full')?0: 0;
                var max_wave =min_wave+$('.top_wave').innerHeight();
                var per = (scrTop-min_wave)/(max_wave-min_wave);
                per = (per < 0)?0:(per>1)?1:per;
                var plus = $('#contents .section_top').hasClass('first')?90:0
                TweenMax.to($('.top_wave g'), 0.4, {x: per * 80+plus, ease: Quad.easeOut});
            }
        });
    }
});