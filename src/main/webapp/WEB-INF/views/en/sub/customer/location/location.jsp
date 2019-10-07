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
					<h2>Customer Support</h2>
					<p>K-Jobs will do our best for customer satisfaction.</p>
					<div class="path">
						<ul>
							<li>Home</li>
							<li>Customer Support</li>
							<li>Directions</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- //sub_top -->

			<div class="mobile_path">
				<ul>
					<li><a href="/">HOME</a></li>
					<li>
						<a href="#">Customer Support</a>
						<div class="path_list">
							<ul>
								<li><a href="/en/sub/kjobs/greetings.do">K·Jobs</a></li>
								<li><a href="/en/sub/business/business01_01.do">Business Area</a></li>
								<li><a href="/en/sub/customer/location/location.do">Customer Support</a></li>
							</ul>
						</div>
					</li>
					<li>
						<a href="#">Directions</a>
						<div class="path_list">
							<ul>
								<li><a href="/en/sub/customer/location/location.do">Directions</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>

			<!-- contents-->
			<div id="contents">

				<div class="sub_tab_area one">
					<ul>
						<li><a href="/en/sub/customer/location/location.do" class="on">Directions</a></li>
					</ul>
				</div>

				<div class="location_wrap">
					<div class="inner">
						<p class="txt">
							K-Jobs have a lot of friendly consultants with <br />
							professionalism waiting for you all over the country.
						</p>
						<div class="select_area">
							<select name="select_area" id="select_area" onchange="changeArea(this.value);">
								<option value="1">Seoul</option>
								<option value="2">Seoul-Incheon</option>
								<option value="3">Chungcheong</option>
								<option value="4">Jeollanam</option>
								<option value="5">Gyeongsangnam</option>
								<option value="6">Gangwon</option>
							</select>
						</div>


						<div class="tab_area three" id="area1">
							<ul>
								<li><a href="#none" class="on" onclick="moveToLocation('37.525766', '126.963661', this, 1);">Head office</a></li>
								<li><a href="#none"  onclick="moveToLocation('37.494905', '126.859828', this, 2);">Gwanak</a></li>
								<li><a href="#none"  onclick="moveToLocation('37.504012', '126.881831', this, 3);">Guro</a></li>
							</ul>
						</div>

						<div class="tab_area four" style="display: none;" id="area2">
							<ul>
								<li><a href="#none" class="on" onclick="moveToLocation('37.450500', '126.698553', this, 4);">Incheon</a></li>
								<li><a href="#none" onclick="moveToLocation('37.634172', '127.210518', this, 5);">Namyangju</a></li>
								<li><a href="#none" onclick="moveToLocation('37.313498', '126.808315', this, 6);">Shin Ansan University</a></li>
								<li><a href="#none" onclick="moveToLocation('37.484395', '126.812932', this, 7);">Bucheon</a></li>
							</ul>
						</div>
						<div class="tab_area one" style="display: none;" id="area3">
							<ul>
								<li><a href="#none" class="on" onclick="moveToLocation('36.358529', '127.342829', this, 8);">Yuseong</a></li>
							</ul>
						</div>
						<div class="tab_area four" style="display: none;" id="area4" >
							<ul>
								<li><a href="#none" class="on" onclick="moveToLocation('34.951515', '127.514675', this, 9);">Suncheon</a></li>
								<li><a href="#none" onclick="moveToLocation('34.934661', '127.697780', this, 10);">Mokpo</a></li>
								<li><a href="#none" onclick="moveToLocation('34.749867', '127.699092', this, 11);">Yeosu</a></li>
								<li><a href="#none"  onclick="moveToLocation('34.934606', '127.697783', this, 12);">Gwangyang</a></li>
							</ul>
						</div>
						<div class="tab_area one" style="display: none;" id="area5">
							<ul>
								<li><a href="#none" class="on" onclick="moveToLocation('35.628657', '129.351327', this, 13);">Ulsan</a></li>
							</ul>
						</div>
						<div class="tab_area one" style="display: none;" id="area6">
							<ul>
								<li><a href="#none" class="on" onclick="moveToLocation('37.851849', '127.744280', this, 14);">Chuncheon</a></li>
							</ul>
						</div>

						<div class="map_area">
							<div class="map" id="map">
								
							</div>
							<div class="map_info">
								<div id="areaDetail1">
									<ul>
										<li>
											<strong>Address</strong>
											<span>3F, 9-5, 15-gil Han River Road, Yongsan-gu, Seoul</span>
										</li>
									</ul>
								</div>
								<div id="areaDetail2">
									<ul>
										<li>
											<strong>Address</strong>
											<span>2nd F, 70, Gaebong-ro 23th street, Guro-gu, Seoul, Republic of Korea</span>
										</li>
									</ul>
								</div>
								<div id="areaDetail3">
									<ul>
										<li>
											<strong>Address</strong>
											<span>#216, 102-dong, 584, Gyeongin-ro, Guro-gu, Seoul, Republic of Korea</span>
										</li>
									</ul>
								</div>
								<div id="areaDetail4">
									<ul>
										<li>
											<strong>Address</strong>
											<span>#402 and #502, 555, Inju-daero, Namdong-gu, Incheon, Republic of Korea</span>
										</li>
									</ul>
								</div>
								<div id="areaDetail5">
									<ul>
										<li>
											<strong>Address</strong>
											<span>#401, 979, Gyeongchun-ro, Namyangju-si, Gyeonggi-do, Republic of Korea</span>
										</li>
									</ul>
								</div>
								<div id="areaDetail6">
									<ul>
										<li>
											<strong>Address</strong>
											<span>#208, Mokyang Hall of Shin Ansan University, 135, Sinansandaehak-ro, Danwon-gu, Ansan-si, Gyeonggi-do, Republic of Korea</span>
										</li>
									</ul>
								</div>
								<div id="areaDetail7">
									<ul>
										<li>
											<strong>Address</strong>
											<span>#503, 520, Gyeongin-ro, Bucheon-si, Gyeonggi-do, Republic of Korea</span>
										</li>
									</ul>
								</div>
								<div id="areaDetail8">
									<ul>
										<li>
											<strong>Address</strong>
											<span>#202, 53, Daehak-ro, Yuseong-gu, Daejeon, Republic of Korea</span>
										</li>
									</ul>
								</div>
								<div id="areaDetail9">
									<ul>
										<li>
											<strong>Address</strong>
											<span>#202, Ga-dong, 276, Isu-ro, Suncheon-si, Jeollanam-do, Republic of Korea</span>
										</li>
									</ul>
								</div>
								<div id="areaDetail10">
									<ul>
										<li>
											<strong>Address</strong>
											<span>#201, 3, Pyeonghwa-ro, Mokpo-si, Jeollanam-do, Republic of Korea</span>
										</li>
									</ul>
								</div>
								<div id="areaDetail11">
									<ul>
										<li>
											<strong>Address</strong>
											<span>2nd F, 15, Munsu-ro, Yeosu-si, Jeollanam-do, Republic of Korea</span>
										</li>
									</ul>
								</div>
								<div id="areaDetail12">
									<ul>
										<li>
											<strong>Address</strong>
											<span>3rd F, 49, Jungmajungang-ro, Gwangyang-si, Jeollanam-do, Republic of Korea</span>
										</li>
									</ul>
								</div>
										<div id="areaDetail13">
									<ul>
										<li>
											<strong>Address</strong>
											<span>#202, 286, Hogye-ro, Buk-gu, Ulsan, Republic of Korea</span>
										</li>
									</ul>
								</div>
									<div id="areaDetail14">
									<ul>
										<li>
											<strong>Address</strong>
											<span>#804, 16, Toegyenonggong-ro, Chuncheon-si, Gangwon-do, Republic of Korea</span>
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

