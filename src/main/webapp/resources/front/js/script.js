$(document).ready(function(){
	
	//gnb
	$("#header > .inner .gnb .inner > ul > li > a").mouseenter(function(){
		var gnbsubH = $(this).next().height();
		$("#header > .inner .gnb .inner > ul > li > a").removeClass("on");
		$("#header > .inner .gnb .inner > ul > li .gnb_sub").hide();
		$(this).addClass("on").next().show();
		if( $(this).next().height() == null ){
			$(".bg_gnb_sub").height("0").css("border-bottom", "0");
		} else{
			$(".bg_gnb_sub").height(gnbsubH);
		}
		$(".bg_gnb_sub").show();
	});
	$("#header > .inner .gnb").mouseleave(function(){
		$("#header > .inner .gnb .inner > ul > li > a").removeClass("on");
		$("#header > .inner .gnb .inner > ul > li .gnb_sub").hide();
		$(".bg_gnb_sub").hide();
	});
	$("#header > .inner .gnb .inner > ul > li > a").focus(function(){
		var gnbsubH = $(this).next().height();
		$("#header > .inner .gnb .inner > ul > li > a").removeClass("on");
		$("#header > .inner .gnb .inner > ul > li .gnb_sub").hide();
		$(this).addClass("on").next().show();
		if( $(this).next().height() == null ){
			$(".bg_gnb_sub").height("0").css("border-bottom", "0");
		} else{
			$(".bg_gnb_sub").height(gnbsubH);
		}
		$(".bg_gnb_sub").show();
	});
	$("#header > .inner .gnb > .inner > ul > li:last-child > .gnb_sub > ul > li:last-child > a").blur(function(){
		$("#header > .inner .gnb .inner > ul > li > a").removeClass("on");
		$("#header > .inner .gnb .inner > ul > li .gnb_sub").hide();
		$(".bg_gnb_sub").hide();
	});
	
	//전체메뉴
	$(".open_fullmenu").click(function(){
		$(".fullmenu").slideDown("fast");
		return false;
	});
	$(".close_fullmenu").click(function(){
		$(".fullmenu").slideUp("fast");
		return false;
	});
	
	//모바일 전체메뉴
	$(".open_mobile_fullmenu").click(function(){
		$(".mobile_fullmenu").fadeIn("fast");
		$("#mobile_header .mobile_fullmenu .inner").animate({
			right : "0"
		}, 500, "easeInOutCubic");
		return false;
	});
	$(".close_mobile_fullmenu").click(function(){
		$("#mobile_header .mobile_fullmenu .inner").animate({
			right : "-80%"
		}, 500, "easeInOutCubic");
		$(".mobile_fullmenu").delay(200).fadeOut("fast");
		return false;
	});
	$("#mobile_header .mobile_fullmenu .inner .mobile_fullmenu_list > ul > li > a").click(function(){
		if( $(this).next().is("div") ){
			if( $(this).hasClass("on") ){
				$(this).removeClass("on").next().slideUp("fast");
			} else{
				$("#mobile_header .mobile_fullmenu .inner .mobile_fullmenu_list > ul > li > a").removeClass("on");
				$("#mobile_header .mobile_fullmenu .inner .mobile_fullmenu_list > ul > li > .mobile_fullmenu_list_sub").slideUp("fast");
				$(this).addClass("on").next().slideDown("fast");
			}
			
			return false;
		}
	});
	$("#mobile_header .mobile_fullmenu .inner .mobile_fullmenu_list > ul > li > .mobile_fullmenu_list_sub > ul > li > a").click(function(){
		if( $(this).next().is("ul") ){
			if( $(this).hasClass("on") ){
				$(this).removeClass("on").next().slideUp("fast");
			} else{
				$("#mobile_header .mobile_fullmenu .inner .mobile_fullmenu_list > ul > li > .mobile_fullmenu_list_sub > ul > li > a").removeClass("on");
				$("#mobile_header .mobile_fullmenu .inner .mobile_fullmenu_list > ul > li > .mobile_fullmenu_list_sub > ul > li > ul").slideUp("fast");
				$(this).addClass("on").next().slideDown("fast");
			}
			
			return false;
		}
	});
	
	//모바일 path
	$(".mobile_path > ul > li > a").click(function(){
		if( $(this).next().is(".path_list") ){
			if( $(this).hasClass("on") ){
				$(".mobile_path > ul > li > a").removeClass("on");
				$(".mobile_path > ul > li > .path_list").slideUp("fast");
			} else{
				$(".mobile_path > ul > li > a").removeClass("on");
				$(".mobile_path > ul > li > .path_list").slideUp("fast");
				$(this).addClass("on").next(".path_list").slideDown("fast");
				
				$("#wrap").children().click(function(e){
					if ($(".mobile_path > ul > li > .path_list").css("display") == "block"){
						if (!$(".mobile_path > ul > li > .path_list").has(e.target).length){
							$(".mobile_path > ul > li > a").removeClass("on");
							$(".mobile_path > ul > li > .path_list").slideUp("fast");
						}
					}
				});
			}
			return false;
		}
	});

	
	//개인정보처리방침 팝업
	$(".open_pop_privacy").click(function(){
		$(".pop_privacy").fadeIn("fast");
		return false;
	});
	$(".close_pop_privacy").click(function(){
		$(".pop_privacy").fadeOut("fast");
		return false;
	});
	
	//smooth scroll
	$('a[href*=#]:not([href=#])').click(function() {
		if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
			var target = $(this.hash);
			target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
			if (target.length) {
				$('html,body').animate({
					scrollTop: target.offset().top
				}, 500);
				
				return false;
			}
		}
	});
});

$(window).load(function(){
	
	//메인 비주얼 슬라이드
	$(".main_visual > .inner > ul").bxSlider({
		auto : true
	});
	
	$(".main_section02 .inner ul").bxSlider({
		auto :true,
		pagerCustom: "#num_pager"
	});
	
	$(".main_section03 .inner .list ul").bxSlider({
		minSlides : 2,
		maxSlides : 3,
		moveSlides : 1,
		slideWidth : 280,
		slideMargin : 30,
		pager : false,
		touchEnabled : false
	});
	
	$(".main_section04 .inner .list ul").bxSlider({
		auto : true,
		pager : false
	});
	
});