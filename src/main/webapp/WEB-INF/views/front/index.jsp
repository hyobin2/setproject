<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
<script>
function fn_search(){
	$('#baseForm').attr('action','/front/sub/incruit/list.do');
	$('#baseForm').submit();
}

/* Instagram post API */
$(document).ready(function(){
    var tocken = "16590107755.4b48e39.93bf0b5931ac4babb49bf132bc473376"; /* Access Tocken  */
    var count = "10";
    $.ajax({
        type: "GET",
        dataType: "jsonp",
        cache: false,
        url: "https://api.instagram.com/v1/users/self/media/recent/?access_token=" + tocken + "&count=" + count,
        success: function(response) {
            if ( response.data.length > 0 ) {
                for(var i = 0; i < response.data.length; i++) {
                    var insta = '';
                    var highimage = response.data[i].images.low_resolution.url;

                    insta += '<li>';
                    insta += "  <a href='" + response.data[i].link + "' target='_blank' alt='instagram'>";
                    insta += '      <img src="' + highimage + '">';
                    insta += "  </a>";
                    insta += "</li>";

                    $("#insta_img").append(insta);
				}
			}
		}
    });
    return false;
});

function changeArea(idx){
	$(".tab_area").hide();
	$("#area"+idx).show();
}

</script>


			<div class="main_visual">
				<div class="inner">
					<ul>
						<c:choose>
							<c:when test="${fn:length(bannerList) > 0}">
								<c:forEach var="result" items="${bannerList}" varStatus="status">
									<li><a href="#" style="background-image:url(/file/viewImg.do?fIdx=${result.fileList[0].fIdx});">메인 비주얼 3</a></li>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<li><a href="#" style="background-image:url(/resources/front/img/img_main_visual01.jpg);">메인 비주얼 1</a></li>
								<li><a href="#" style="background-image:url(/resources/front/img/img_main_visual02.jpg);">메인 비주얼 2</a></li>
								<li><a href="#" style="background-image:url(/resources/front/img/img_main_visual03.jpg);">메인 비주얼 3</a></li>
							</c:otherwise>
						</c:choose>

					</ul>
				</div>
			</div>
			<div class="main_section01">
				<div class="inner">
					<div class="search">
						<div class="txt">
							<h2>채용정보 <br />검색하기</h2>
							<p>K·Jobs의 맞춤형 <br />인재정보를 확인해 보세요.</p>
						</div>
						<div class="search_form">
						<form name="baseForm" id="baseForm" method="get" action="/front/sub/incruit/list.do" >
							<ul>
								<li>
									<label for="search_form1" class="hide">지역선택</label>
									<select name="area" id="area" style="width:33%;">
										<option value="" >지역</option>
										<option value="서울" >서울</option>
		                        		<option value="경기" >경기</option>
		                        		<option value="인천" >인천</option>
		                        		<option value="대전" >대전</option>
		                        		<option value="세종" >세종</option>
		                        		<option value="충남" >충남</option>
		                        		<option value="충북" >충북</option>
		                        		<option value="광주" >광주</option>
		                        		<option value="전남" >전남</option>
		                        		<option value="전북" >전북</option>
		                        		<option value="대구" >대구</option>
		                        		<option value="경북" >경북</option>
		                        		<option value="부신" >부산</option>
		                        		<option value="경남" >경남</option>
		                        		<option value="강원" >강원</option>
		                        		<option value="제주" >제주</option>
									</select>
									<label for="search_form2" class="hide">산업별 구분 선택</label>
									<select name="division" id="division" style="width:63%;">
										<option value="" >구분</option>
										<option value="서비스" >서비스업</option>
		                        		<option value="교육" >교육업</option>
		                        		<option value="금융" >금융/은행업</option>
		                        		<option value="기관" >기관/협회</option>
		                        		<option value="건설" >건설업</option>
		                        		<option value="판매" >판매/유통업</option>
		                        		<option value="문화" >문화/예술/디자인업</option>
		                        		<option value="의료" >의료/제약업</option>
		                        		<option value="IT">IT/정보통신업</option>
		                        		<option value="미디어" >미디어/광고업</option>
		                        		<option value="제조" >제조/생산/화학업</option>
									</select>
								</li>
								<li>
									<label for="search_form3" class="hide">연봉 선택</label>
									<select name="salary" id="salary" style="width:63%;">
										<option value="" >연봉 </option>
										<option value="2000" >2000이하</option>
	      								<option value="2499" >2000~2500미만</option>
	         							<option value="2999"  >2500~3000미만</option>
	         							<option value="3499" >3000~3500미만</option>
	         							<option value="4999" >3500~5000미만</option>
	         							<option value="5000" >5000이상</option>
									</select>
									<label for="search_form4" class="hide">형태 선택</label>
									<select name="work" id="work" style="width:33%;">
										<option value="" >고용형태</option>
										<option value="정규직" >정규직</option>
		            					<option value="계약직" >계약직</option>
		            					<option value="파견직" >파견직</option>
									</select>
								</li>
								<li class="long">
									<button onclick="fn_search()">검색하기</button>
								</li>
							</ul>
						</form>
						</div>
					</div>
					<div class="job_info">
						<a href="/front/sub/incruit/list.do">
							<p>K·Jobs의 <br />신선한 채용정보들을 <br />만나보세요.</p>
							<span class="go">GO</span>
						</a>
					</div>
				</div>
			</div>
			<div class="main_section02">
				<div class="inner">
					<ul>
						<li>
							<div class="txt">
								<span class="tit">전직지원서비스</span>
								<p>정년 또는 피치 못할 사유로 퇴직(예정)을 하게 된 고객들에게 자신감 고취 및 성공적인 제 2의 인생설계를 위한 다양한 맞춤형 컨설팅과 교육, 상담 등의 서비스를 제공하여 퇴직자가 원하는 경력목표를 가장 효과적으로 달성할 수 있도록 지원하는 맞춤형 종합지원 서비스 입니다.</p>
							</div>
							<div class="img">
								<img src="/resources/front/img/img_main_service01.jpg" alt="전직지원서비스"/>
							</div>
						</li>
						<li>
							<div class="txt">
								<span class="tit">취업성공 패키지</span>
								<p>고용노동부 주관으로 취업에 어려움을 겪고 있는 구직자들에게 개인별 프로파일링을 토대로 최장 1년간 『상담 〮 진단 〮 경로 설정(1단계) → 직업능력 증진(2단계) → 집중 취업알선(3단계)』을 단계별 맞춤형으로 제공하는 종합 취업지원 서비스입니다.</p>
							</div>
							<div class="img">
								<img src="/resources/front/img/img_main_service02.jpg" alt="취업성공 패키지"/>
							</div>
						</li>
						<li>
							<div class="txt">
								<span class="tit">청년 내일 채움 공제</span>
								<p>중소∙중견기업에 정규직으로 취업한 청년들의 장기근속을 위하여 『청년∙기업∙정부』가 공동으로 공제금을 적립하여 2년 또는 3년간 근속한 청년에게 성과보상금 형태로 만기공제금을 지급하는 서비스입니다.</p>
							</div>
							<div class="img">
								<img src="/resources/front/img/img_main_service03.jpg" alt="청년 내일 채움 공제"/>
							</div>
						</li>
						<li>
							<div class="txt">
								<span class="tit">교육컨설팅서비스</span>
								<p>케이잡스만의 차별화된 교육컨설팅 기법을 바탕으로 기업에는 경영전략과 사업목표를 효과적으로 달성하는데 필요한 교육컨설팅 서비스를, 초〮중〮고 및 대학생을 대상으로 적합한 진로 로드맵 설정과 취업전략 수립을 통해 성공적인 취업으로 이어질 수 있도록 교육컨설팅을 지원하는 서비스 입니다.</p>
							</div>
							<div class="img">
								<img src="/resources/front/img/img_main_service04.jpg" alt="교육컨설팅서비스"/>
							</div>
						</li>
						<li>
							<div class="txt">
								<span class="tit">MICE 사업</span>
								<p>직장을 구하는 사람들에게 일할 기회를 제공하고, 일할 사람이 필요한 기업에게는 채용기회를 제공하기위해 필요한 고용서비스 관련 채용박람회, 워크숍, 공공 또는 민간분야 세미나, 포럼 등 크고 작은 행사의 기획 및 운영을 제공하는 서비스 입니다.</p>
							</div>
							<div class="img">
								<img src="/resources/front/img/img_main_service05.jpg" alt="MICE 사업"/>
							</div>
						</li>
					</ul>
					<div class="bx-pager" id="num_pager">
						<div class="bx-pager-item"><a href="#" data-slide-index="0">01</a></div>
						<div class="bx-pager-item"><a href="#" data-slide-index="1">02</a></div>
						<div class="bx-pager-item"><a href="#" data-slide-index="2">03</a></div>
						<div class="bx-pager-item"><a href="#" data-slide-index="3">04</a></div>
						<div class="bx-pager-item"><a href="#" data-slide-index="4">05</a></div>
					</div>
					<a href="/front/sub/customer/service/write.do" class="btn_go">K·Jobs 전문 컨설턴트의 <br />자세한 상담을 받아보세요</a>
				</div>

			</div>
			<div class="main_section03">
				<div class="inner">
					<div class="txt">
						<h2>INSTAGRAM</h2>
						<p>K·Jobs를 통해 <br />취업에 성공한 분들과 <br />상담사 분들의 생생한 <br />얘기를 들어보세요.</p>
					</div>
					<div class="list">
						<ul id="insta_img">
						</ul>
					</div>
				</div>
			</div>
			<div class="main_section04">
				<div class="inner">
					<h2>INTERVIEW</h2>
					<div class="list">
						<ul>
						<c:forEach var="result" items="${list}" varStatus="status">
							<li>
								<a href="/front/sub/cummunity/customercase/view.do?bIdx=${result.bIdx }">
									<div class="txt">
										<p>${result.title}</p>
										<span class="job">${result.content }</span>
									</div>
								</a>
							</li>
						</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<div class="main_section05">
				<div class="inner">
					<h2>CONTACT</h2>
					<p class="txt">
						K·Jobs는 전국에 여러분들을 위한, <br />
						전문성과 친절함을 보유한 컨설턴트 분들이 대기하고 있습니다.
					</p>
					<div class="select_area">
						<select name="select_area" id="select_area" onchange="changeArea(this.value);">
							<option value="1">서울</option>
							<option value="2">경인</option>
							<option value="3">충청</option>
							<option value="4">전남</option>
							<option value="5">경남</option>
							<option value="6">강원</option>

						</select>
					</div>

					<div class="tab_area three" id="area1">
						<ul>
							<li><a href="#none" class="on" onclick="moveToLocation('37.525766', '126.963661', this, 1);">본사</a></li>
							<li><a href="#none"  onclick="moveToLocation('37.494905', '126.859828', this, 2);">관악지사</a></li>
							<li><a href="#none"  onclick="moveToLocation('37.504012', '126.881831', this, 3);">구로지사</a></li>
						</ul>
					</div>

					<div class="tab_area four" style="display: none;" id="area2">
						<ul>
							<li><a href="#none" class="on" onclick="moveToLocation('37.450500', '126.698553', this, 4);">인천</a></li>
							<li><a href="#none" onclick="moveToLocation('37.634172', '127.210518', this, 5);">남양주</a></li>
							<li><a href="#none" onclick="moveToLocation('37.313498', '126.808315', this, 6);">신안산대</a></li>
							<li><a href="#none" onclick="moveToLocation('37.484395', '126.812932', this, 7);">부천</a></li>
						</ul>
					</div>
					<div class="tab_area one" style="display: none;" id="area3">
						<ul>
							<li><a href="#none" class="on" onclick="moveToLocation('36.358529', '127.342829', this, 8);">유성</a></li>
						</ul>
					</div>
					<div class="tab_area four" style="display: none;" id="area4" >
						<ul>
							<li><a href="#none" class="on" onclick="moveToLocation('34.951515', '127.514675', this, 9);">순천</a></li>
							<li><a href="#none" onclick="moveToLocation('34.934661', '127.697780', this, 10);">목포</a></li>
							<li><a href="#none" onclick="moveToLocation('34.749867', '127.699092', this, 11);">여수</a></li>
							<li><a href="#none"  onclick="moveToLocation('34.934606', '127.697783', this, 12);">광양</a></li>
						</ul>
					</div>
					<div class="tab_area one" style="display: none;" id="area5">
						<ul>
							<li><a href="#none" class="on" onclick="moveToLocation('35.628657', '129.351327', this, 13);">울산</a></li>
						</ul>
					</div>
					<div class="tab_area one" style="display: none;" id="area6">
						<ul>
							<li><a href="#none" class="on" onclick="moveToLocation('37.851849', '127.744280', this, 14);">춘천</a></li>
						</ul>
					</div>

					<div class="map_area">
						<div class="map" id="map">
						</div>
						<div class="map_info">
							<div id="areaDetail1">
								<ul>
									<li>
										<strong>주소</strong>
										<span>서울특별시 용산구 한강대로 15길 9-5 3층</span>
									</li>
									<li>
										<strong>문의</strong>
										<span>02-6959-8983</span>
									</li>
									<li>
										<strong>FAX</strong>
										<span>02-6958-9297</span>
									</li>
								</ul>
							</div>
							<div id="areaDetail2">
								<ul>
									<li>
										<strong>주소</strong>
										<span>서울특별시 구로구 개봉로23가길 70, 2층 </span>
									</li>
									<li>
										<strong>문의</strong>
										<span> 02-2615-9197</span>
									</li>
									<li>
										<strong>FAX</strong>
										<span>02-2615-9297</span>
									</li>
								</ul>
							</div>
							<div id="areaDetail3">
								<ul>
									<li>
										<strong>주소</strong>
										<span>서울특별시 구로구 경인로 584, 102동 216호 </span>
									</li>
									<li>
										<strong>문의</strong>
										<span> 02-6959-1003</span>
									</li>
									<li>
										<strong>FAX</strong>
										<span>02-6959-0114</span>
									</li>
								</ul>
							</div>
							<div id="areaDetail4">
								<ul>
									<li>
										<strong>주소</strong>
										<span>인천광역시 남동구 인주대로 555, 402호, 502호 </span>
									</li>
									<li>
										<strong>문의</strong>
										<span> 032-719-7804</span>
									</li>
									<li>
										<strong>FAX</strong>
										<span>032-719-7815</span>
									</li>
								</ul>
							</div>
							<div id="areaDetail5">
								<ul>
									<li>
										<strong>주소</strong>
										<span>경기도 남양주시 경춘로 979, 401호 </span>
									</li>
									<li>
										<strong>문의</strong>
										<span>031-595-7610</span>
									</li>
									<li>
										<strong>FAX</strong>
										<span>031-595-7611</span>
									</li>
								</ul>
							</div>
							<div id="areaDetail6">
								<ul>
									<li>
										<strong>주소</strong>
										<span>경기도 안산시 단원구 신안산대학로 135, 신안산대학교 목양관 208호 </span>
									</li>
									<li>
										<strong>문의</strong>
										<span>031-495-6514</span>
									</li>
									<li>
										<strong>FAX</strong>
										<span>031-495-6512</span>
									</li>
								</ul>
							</div>
							<div id="areaDetail7">
								<ul>
									<li>
										<strong>주소</strong>
										<span>경기도 부천시 경인로 520, 503호 </span>
									</li>
									<li>
										<strong>문의</strong>
										<span>  032-351-8851</span>
									</li>
									<li>
										<strong>FAX</strong>
										<span>032-351-8854</span>
									</li>
								</ul>
							</div>
							<div id="areaDetail8">
								<ul>
									<li>
										<strong>주소</strong>
										<span>대전광역시 유성구 대학로 53, 202호 </span>
									</li>
									<li>
										<strong>문의</strong>
										<span> 042-719-7018</span>
									</li>
									<li>
										<strong>FAX</strong>
										<span>042-719-7013</span>
									</li>
								</ul>
							</div>
							<div id="areaDetail9">
								<ul>
									<li>
										<strong>주소</strong>
										<span>전라남도 순천시 이수로 276, 가동 202호 </span>
									</li>
									<li>
										<strong>문의</strong>
										<span>  061-755-9314</span>
									</li>
									<li>
										<strong>FAX</strong>
										<span>061-755-9297</span>
									</li>
								</ul>
							</div>
							<div id="areaDetail10">
								<ul>
									<li>
										<strong>주소</strong>
										<span>전라남도 목포시 평화로 3, 201호 </span>
									</li>
									<li>
										<strong>문의</strong>
										<span> 061-282-9197</span>
									</li>
									<li>
										<strong>FAX</strong>
										<span>061-282-9213</span>
									</li>
								</ul>
							</div>
							<div id="areaDetail11">
								<ul>
									<li>
										<strong>주소</strong>
										<span>전라남도 여수시 문수로 15, 2층 </span>
									</li>
									<li>
										<strong>문의</strong>
										<span> 061-654-9212</span>
									</li>
									<li>
										<strong>FAX</strong>
										<span>061-654-9213</span>
									</li>
								</ul>
							</div>
							<div id="areaDetail12">
								<ul>
									<li>
										<strong>주소</strong>
										<span>전라남도 광양시 중마중앙로 49, 3층 </span>
									</li>
									<li>
										<strong>문의</strong>
										<span> 061-792-9098</span>
									</li>
									<li>
										<strong>FAX</strong>
										<span>061-792-9197</span>
									</li>
								</ul>
							</div>
									<div id="areaDetail13">
								<ul>
									<li>
										<strong>주소</strong>
										<span>울산광역시 북구 호계로 286, 202호 </span>
									</li>
									<li>
										<strong>문의</strong>
										<span> 052-273-8601</span>
									</li>
									<li>
										<strong>FAX</strong>
										<span>052-273-8608</span>
									</li>
								</ul>
							</div>
								<div id="areaDetail14">
								<ul>
									<li>
										<strong>주소</strong>
										<span>강원도 춘천시 퇴계농공로 16, 804호 </span>
									</li>
									<li>
										<strong>문의</strong>
										<span> 033-912-6668</span>
									</li>
									<li>
										<strong>FAX</strong>
										<span>033-912-6669</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCkbkHsVbYxg4C1VtWEKs6297cvOeudTDg&callback=initMap" async defer></script>
<script>

/* function section2Move(){
	var slideIdx = $("#num_pager .active").data("slide-index")+1;
	var url = "";
	if(slideIdx == "1"){
		url = "/front/sub/business/business02_01.do";
	}else if(slideIdx == "2"){
		url = "/front/sub/business/business01_01.do";

	}else if(slideIdx == "3"){
		url = "/front/sub/business/business01_02.do";

	}else if(slideIdx == "4"){
		url = "/front/sub/business/business04_01.do";

	}else if (slideIdx =="5"){
		url = "/front/sub/business/business03_01.do";
	}

	document.location.href = url;

} */
for(var i=2;i<15;i++){
$('#areaDetail'+i).hide();
}
var map;
var image = '/resources/ko/images/sub/marker.png';
function initMap() {
	//
	var location = {lat: 35.154582, lng: 128.988158}; //좌표

	map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 15,
    	center: location,
	});
	addMarker(location, map);

}

function addMarker(location, map) {
  var marker = new google.maps.Marker({
	  position: location,
	  map: map,
	  icon: image,
  });
}

function moveToLocation(lat, lng, selObj, i){

	var location = {lat: lat, lng: lng}; //좌표
	addMarker(location, map);

	var center = new google.maps.LatLng(lat, lng);
	map.panTo(center);

	$('li > a').removeClass();
	$(selObj).addClass('on');
	$('#areaDetail'+i).show();
	for(var j=0 ; j<15 ; j++){
		if(j != i){
			$('#areaDetail'+j).hide();
		}
	}
}
</script>

