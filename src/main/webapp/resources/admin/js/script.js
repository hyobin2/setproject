$(document).ready(function() {
	
	//gnb
	$(".gnb > .in > ul").hover(function(){
		$(".gnb_sub, .gnb > .bg").slideDown("fast");
	}, function(){
		$(".gnb_sub, .gnb > .bg").stop().slideUp("fast");	
	});
	
	
	//snb
	$("#snb > ul > li > a").click(function(){
		$("#snb > ul > li > a").removeClass("on");
		$("#snb > ul > li > .snb_sub").slideUp("fast");
		
		if( $(this).next().css("display") == "block" ){
			$(this).removeClass("on").next().slideUp("fast");
		} else{
			$(this).addClass("on").next().slideDown("fast");
		}
	
		window.location=$(this).attr("href");
	
		return false;
	});
	
	//좌측메뉴
	$(".btn").click(function () {
    $("#menu,.page_cover,html").addClass("open"); // 메뉴 버튼을 눌렀을때 메뉴, 커버, html에 open 클래스를 추가해서 효과를 준다.
    window.location.hash = "#open"; // 페이지가 이동한것 처럼 URL 뒤에 #를 추가해 준다.
	
});

window.onhashchange = function () {
    if (location.hash != "#open") { // URL에 #가 있을 경우 아래 명령을 실행한다.
        $("#menu,.page_cover,html").removeClass("open"); // open 클래스를 지워 원래대로 돌린다.
    }
};
	
	
});

//화면 확대 축소
/*
var size = '1';
if(size != null && size != "" && size != "1.0"){
	Zoom.size = Number(size);
	Zoom.load();
}
*/