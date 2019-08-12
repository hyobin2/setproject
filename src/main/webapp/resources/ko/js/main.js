$(function(){
    //메뉴 스크롤
    $(window).on('scroll', function(){
        var scrTop = $(window).scrollTop();
        if (scrTop > 0) {
            $('#header').addClass('fixed');
        } else {
            $('#header').removeClass('fixed');
        }
    });

    //top_btn
    var topBtn = $('.top_btn');
    topBtn.on('click',function(){
        $('html,body').stop().animate({scrollTop:0},500);
    });

    //gnb
    var $pcDepth01 = $('nav.pc').find('.depth01');
    $pcDepth01.on('mouseenter', function(){
        $pcDepth01.find('.depth02').stop().slideDown(300);
        $('.menu_bg').stop().slideDown(300);
    });
    $pcDepth01.on('mouseleave', function(){
        $pcDepth01.find('.depth02').stop().slideUp(300);
        $('.menu_bg').stop().slideUp(300);
    });

    //mobile
    //gnb
    var $gnbOpen = $('#header').find('.gnb_open');
    var $gnbClose = $('#header').find('.gnb_close');
    $gnbOpen.on('click',function(){
        $('#header').addClass('open');
        $('.gnb_mask').fadeIn(300);
    });
    $gnbClose.on('click',function(){
        $('#header').removeClass('open');
        $('.gnb_mask').fadeOut(300);
    });

    //main_visual
    var mainVisualSwiper = new Swiper('#mainVisual', {
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '.swiper-next',
            prevEl: '.swiper-prev',
        },
    });

    //main_visual_popup
    var visualPopOpen = $('#mainVisual').find('.view_btn');
    var visualpopUp = $('.visual_popup');
    var visualpopClose = $('.visual_popup').find('.pop_close');
    var popMask = $('.pop_mask');
    visualPopOpen.on('click',function(){
        popMask.fadeIn(300);
        visualpopUp.fadeIn(300);
    });
    visualpopClose.on('click',function(){
        popMask.fadeOut(300);
        visualpopUp.fadeOut(300);
    });
    popMask.on('click',function(){
        popMask.fadeOut(300);
        visualpopUp.fadeOut(300);
    });

    //main_r&d
    var mainRndswiper = new Swiper('#mainRnd', {
        effect:'fade',
        pagination: {
            el: '.main_rnd .swiper-pagination',
            clickable: true,
            renderBullet: function (index, className) {
            return '<span class="' + className + '">' + (index + 1) + '</span>';
            },
        },
        navigation: {
            nextEl: '.main_rnd .swiper-next',
            prevEl: '.main_rnd .swiper-prev',
          },
    });

    //main_now
    var mainNowswiper = new Swiper('#mainNow', {
        slidesPerView: 3,
        spaceBetween: 30,
        slidesPerGroup: 3,
        pagination: {
          el: '.main_now .swiper-pagination',
          type: 'fraction',
        },
        navigation: {
          nextEl: '.main_now .swiper-next',
          prevEl: '.main_now .swiper-prev',
        },
        breakpoints: {
            // when window width is <= 460px
            460: {
                slidesPerView: 1,
                spaceBetween: 1,
                slidesPerGroup: 1,
            },
            // when window width is <= 790px
            790: {
              slidesPerView: 2,
              spaceBetween: 20,
              slidesPerGroup: 2,
            },

        }
    });

    //sub_contact_us
    var $tabBtn = $('.tab_btn_box').find('li');
    var $tabPanel = $('.tab_panel')
    var $tabBtnM = $('.tab_btn_box').find('select');
    $tabBtn.eq(0).addClass('select');
    $tabPanel.find('.tab_con').eq(0).show();
    $tabBtn.on('click',function(e){
        e.preventDefault();
        $tabBtn.removeClass('select');
        $tabPanel.find('.tab_con').hide();
        $(this).addClass('select');
        var $selectTab = $(this).find('a').attr('href');
        $tabPanel.find('#'+$selectTab).show();
        $tabBtnM.val($selectTab);
    });
    $tabBtnM.change(function(){
        $tabPanel.find('.tab_con').hide();
        var $selectTabValue = $tabBtnM.val();
        $tabPanel.find('#'+$selectTabValue).show();
        $tabBtn.removeClass('select');
        $tabBtn.find('a[href='+$selectTabValue+']').parent('li').addClass('select');
    });

    //sub_business_future
     var $popImgBtn = $('.business01_con02').find('.pop_btn');
     $popImgBtn.on('click',function(){
         if($(this).hasClass('open')){
            $(this).removeClass('open');
            $('.pop_img').fadeOut(300);
         }else{
            $(this).addClass('open');
            $('.pop_img').fadeIn(300);
         }
     });
     var businessFutureSwiper = new Swiper('#businessFuture', {
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '.arrows_box .swiper-next',
            prevEl: '.arrows_box .swiper-prev',
        },
    });

    //sub vsSports
    $('#vrSports').slick({
        centerMode: true,
        centerPadding: '0',
        slidesToShow: 3,
        prevArrow:'.slick-prev',
        nextArrow:'.slick-next',
        responsive: [
          {
            breakpoint: 790,
            settings: {
              arrows: false,
              centerMode: true,
              slidesToShow: 1,
              centerPadding: '80px',
            }
          },
          {
            breakpoint: 650,
            settings: {
              arrows: false,
              centerMode: true,
              slidesToShow: 1,
              centerPadding: '40px',
            }
          },
          {
            breakpoint: 460,
            settings: {
              arrows: false,
              centerMode: true,
              slidesToShow: 1,
              centerPadding: '0',
            }
          },
        ]
    });

    //reference_popup
    var popOpen = $('.refer_list').find('li');
    var popUp = $('.refer_popup');
    var popClose = $('.refer_popup').find('.pop_close');
    var popMask = $('.pop_mask');
    popOpen.on('click',function(){
        popMask.fadeIn(300);
        popUp.fadeIn(300);
    });
    popClose.on('click',function(){
        popMask.fadeOut(300);
        popUp.fadeOut(300);
    });
    popMask.on('click',function(){
        popMask.fadeOut(300);
        popUp.fadeOut(300);
    });

    //파일첨부
    var fileTarget = $('.upload_hidden');
	fileTarget.on('change', function(){
		if(window.FileReader){
			var filename = $(this)[0].files[0].name;
		} else {
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
		}

		$(this).siblings('.upload-name').val(filename);

	});

});