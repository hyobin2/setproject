<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script>
function changeArea(idx){
	$(".tab_area").hide();
	$("#area"+idx).show();
}
</script>
			<!-- sub_top -->
			<div class="sub_top sub_top05">
				<div class="inner">
					<h2>고객지원</h2>
					<p>케이잡스는 고객 만족을 위해 최선을 다합니다.</p>
					<div class="path">
						<ul>
							<li>Home</li>
							<li>고객지원</li>
							<li>오시는 길</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- //sub_top -->

			<div class="mobile_path">
				<ul>
					<li><a href="/">HOME</a></li>
					<li>
						<a href="#">고객지원</a>
						<div class="path_list">
							<ul>
								<li><a href="/front/sub/hyobin/greetings.do">K·Jobs</a></li>
								<li><a href="/front/sub/business/business01_01.do">사업분야</a></li>
								<li><a href="/front/sub/cummunity/activity/list.do">커뮤니티</a></li>
								<li><a href="/front/sub/incruit/list.do">채용정보</a></li>
								<li><a href="/front/sub/customer/inquiry/list.do">고객지원</a></li>
							</ul>
						</div>
					</li>
					<li>
						<a href="#">오시는길</a>
						<div class="path_list">
							<ul>
								<li><a href="/front/sub/customer/inquiry/list.do">고객문의</a></li>
								<li><a href="/front/sub/customer/service/list.do">서비스 신청 및 접수</a></li>
								<li><a href="/front/sub/customer/location/location.do">오시는길</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>

			<!-- contents-->
			<div id="contents">

				<div class="sub_tab_area three">
					<ul>
						<li><a href="/front/sub/customer/inquiry/list.do" >고객문의</a></li>
						<li><a href="/front/sub/customer/service/list.do" > 서비스 신청 및 접수</a></li>
						<li><a href="/front/sub/customer/location/location.do" class="on">오시는 길</a></li>
					</ul>
				</div>

				<div class="location_wrap">
					<div class="inner">
						<p class="txt">
							hyobin는 전국에 친절함을 겸비한 <br />
							전문 컨설턴트가 여러분들을 기다리고 있습니다.
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
								지도영역
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

			</div>
			<!-- //contents-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCkbkHsVbYxg4C1VtWEKs6297cvOeudTDg&callback=initMap" async defer></script>
<script>
for(var i=2;i<15;i++){
	$('#areaDetail'+i).hide();
}
var map;
var image =''/*  '/resources/ko/images/sub/marker.png'; //이미지 */
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
			$('#areaDetail'+ j).hide();
		}
	}
}

</script>

