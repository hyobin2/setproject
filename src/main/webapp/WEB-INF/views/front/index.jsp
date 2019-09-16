<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script>
function fn_search(){
	$('#area').val($('#search_form1 option:selected').val());
	$('#division').val($('#search_form2 option:selected').val());
	$('#salary').val($('#search_form3 option:selected').val());
	$('#work').val($('#search_form4 option:selected').val());
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
						<li><a href="#" style="background-image:url(/resources/front/img/img_main_visual01.jpg);">메인 비주얼 1</a></li>
						<li><a href="#" style="background-image:url(/resources/front/img/img_main_visual02.jpg);">메인 비주얼 2</a></li>
						<li><a href="#" style="background-image:url(/resources/front/img/img_main_visual03.jpg);">메인 비주얼 3</a></li>
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
									<input type="hidden" name="area" id="area" >
									<select name="" id="search_form1" style="width:33%;">
										<option value="지역" >지역</option>
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
									<input type="hidden" name="division" id="division" >
									<select name="" id="search_form2" style="width:63%;">
										<option value="구분" >구분</option>
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
									<input type="hidden" name="salary" id="salary" >
									<select name="" id="search_form3" style="width:63%;">
										<option value="0" >연봉 </option>
										<option value="2000" >2000이하</option>
	      								<option value="2499" >2000~2500미만</option>
	         							<option value="2999"  >2500~3000미만</option>
	         							<option value="3499" >3000~3500미만</option>
	         							<option value="4999" >3500~5000미만</option>
	         							<option value="5000" >5000이상</option>
									</select>
									<label for="search_form4" class="hide">형태 선택</label>
									<input type="hidden" name="work" id="work">
									<select name="" id="search_form4" style="width:33%;">
										<option value="고용형태" >고용형태</option>
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
						<a href="#">
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
								<p>퇴직을 앞두고 있는 고객들에게 자신감 고취 및 성공적인 제 2의 인생설계를 위한 다양한 맞춤형 컨설팅과 교육, 상담 등의 서비스를 제공하여 퇴직자가 원하는 경력목표를 가장 효과적으로 달성할 수 있도록 지원하는 맞춤형 종합지원 서비스 입니다.</p>
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
								<span class="tit">전직지원서비스</span>
								<p>퇴직을 앞두고 있는 고객들에게 자신감 고취 및 성공적인 제 2의 인생설계를 위한 다양한 맞춤형 컨설팅과 교육, 상담 등의 서비스를 제공하여 퇴직자가 원하는 경력목표를 가장 효과적으로 달성할 수 있도록 지원하는 맞춤형 종합지원 서비스 입니다.</p>
							</div>
							<div class="img">
								<img src="/resources/front/img/img_main_service04.jpg" alt="전직지원서비스"/>
							</div>
						</li>
					</ul>
					<div class="bx-pager" id="num_pager">
						<div class="bx-pager-item"><a href="#" data-slide-index="0">01</a></div>
						<div class="bx-pager-item"><a href="#" data-slide-index="1">02</a></div>
						<div class="bx-pager-item"><a href="#" data-slide-index="2">03</a></div>
						<div class="bx-pager-item"><a href="#" data-slide-index="3">04</a></div>
					</div>
					<a href="#" class="btn_go">K·Jobs 전문 컨설턴트의 <br />자세한 상담을 받아보세요</a>
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
							<li>
								<a href="#" style="background-image:url(/resources/front/img/img_main_interview01.jpg)">
									<div class="txt">
										<p>K·Jobs를 통해 <br />원하는 회사에  입사했어요</p>
										<span class="job">넥시큐어 시스템<br />한보름 사원</span>
									</div>
								</a>
							</li>
							<li>
								<a href="#" style="background-image:url(/resources/front/img/img_main_interview01.jpg)">
									<div class="txt">
										<p>K·Jobs를 통해 <br />원하는 회사에  입사했어요</p>
										<span class="job">넥시큐어 시스템<br />한보름 사원</span>
									</div>
								</a>
							</li>
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
							<li><a href="#" class="on" id="seoul" onclick="moveToLocation('', '');">본사</a></li>
							<li><a href="#" id="gwanak" onclick="moveToLocation('', '');">관악지사</a></li>
							<li><a href="#" id="guro" onclick="moveToLocation('', '');">구로지사</a></li>
						</ul>
					</div>

					<div class="tab_area five" style="display: none;" id="area2">
						<ul>
							<li><a href="#" class="on" id="incheon" onclick="moveToLocation('', '');">인천</a></li>
							<li><a href="#" id="namyangju" onclick="moveToLocation('', '');">남양주</a></li>
							<li><a href="#" id="sinak" onclick="moveToLocation('', '');">신안산대</a></li>
							<li><a href="#" id="bucheon" onclick="moveToLocation('', '');">부천</a></li>
							<li><a href="#" id="bucheonUniversity" onclick="moveToLocation('', '');">부천대학교</a></li>
						</ul>
					</div>
					<div class="tab_area one" style="display: none;" id="area3">
						<ul>
							<li><a href="#" class="on" id="useong" onclick="moveToLocation('', '');">유성</a></li>
						</ul>
					</div>
					<div class="tab_area four" style="display: none;" id="area4" >
						<ul>
							<li><a href="#" class="on" id="suncheon" onclick="moveToLocation('', '');">순천</a></li>
							<li><a href="#" id="mokpo" onclick="moveToLocation('', '');">목포</a></li>
							<li><a href="#" id="yeosu" onclick="moveToLocation('', '');">여수</a></li>
							<li><a href="#" id="gwangyang" onclick="moveToLocation('', '');">광양</a></li>
						</ul>
					</div>
					<div class="tab_area one" style="display: none;" id="area5">
						<ul>
							<li><a href="#" class="on" id="ulsan" onclick="moveToLocation('', '');">울산</a></li>
						</ul>
					</div>
					<div class="tab_area two" style="display: none;" id="area6">
						<ul>
							<li><a href="#" class="on" id="chunCheon" onclick="moveToLocation('', '');">춘천</a></li>
							<li><a href="#" id="gangwon" onclick="moveToLocation('', '');">강원관광대학교</a></li>
						</ul>
					</div>

					<div class="map_area">
						<div class="map" id="map">
						</div>
						<div class="map_info">
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
					</div>
				</div>
			</div>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCkbkHsVbYxg4C1VtWEKs6297cvOeudTDg&callback=initMap" async defer></script>
<script>

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

function moveToLocation(lat, lng){

	var location = {lat: lat, lng: lng}; //좌표
	addMarker(location, map);

	var center = new google.maps.LatLng(lat, lng);
	map.panTo(center);

	$('a').removeClass();
	$(this).addClass('on');

}
</script>

