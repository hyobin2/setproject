<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
<script>
function fn_search(){
	$('#baseForm').attr('action','/en/sub/incruit/list.do');
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
									<li><a href="#" style="background-image:url(/file/viewImg.do?fIdx=${result.fileList[0].fIdx});">main visual 3</a></li>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<li><a href="#" style="background-image:url(/resources/en/img/img_main_visual01.jpg);">main visual 1</a></li>
								<li><a href="#" style="background-image:url(/resources/en/img/img_main_visual02.jpg);">main visual 2</a></li>
								<li><a href="#" style="background-image:url(/resources/en/img/img_main_visual03.jpg);">main visual 3</a></li>
							</c:otherwise>
						</c:choose>
						
					</ul>
				</div>
			</div>
			<div class="main_section02">
				<div class="inner">
					<ul>
						<li>
							<div class="txt">
								<span class="tit">Outplacement <br />Support Service</span>
								<p>Outplacement Support Service is a customized integrated support service that offers services a lot of personalized consulting, education, counseling, and others for developing self-confidence and successfully planning the next life of the young or clients who are expected to retire from their job for some unavoidable reasons. Through this, we support retired employees to be able to achieve their desired career goals in the most effective ways.</p>
							</div>
							<div class="img">
								<img src="/resources/en/img/img_main_service01.jpg" alt="Outplacement Support Service"/>
							</div>
						</li>
						<li>
							<div class="txt">
								<span class="tit">Employment Success Package</span>
								<p>Held by Ministry of Employment and Labor(MOEL), Employment Success Package is an integrated employment information service specialized by each step; 『counseling/diagnosis/course setting (first) → improvement of occupational abilities (second) → intensive job placement (third)』 for a year to the maximum based on personalized profiling for job seekers who have a hard time getting a job.</p>
							</div>
							<div class="img">
								<img src="/resources/en/img/img_main_service02.jpg" alt="Employment Success Package"/>
							</div>
						</li>
						<li>
							<div class="txt">
								<span class="tit">Youth to Tomorrow Savings</span>
								<p>Youth to Tomorrow Savings is a service that encourages young people who already got a full-time job in a small and medium-size enterprise to serve long. The youth, enterprise, and government jointly save deductible amount and pay the matured amount to the employees who have served for two or three years as bonus.</p>
							</div>
							<div class="img">
								<img src="/resources/en/img/img_main_service03.jpg" alt="Youth to Tomorrow Savings"/>
							</div>
						</li>
						<li>
							<div class="txt">
								<span class="tit">Education Consulting</span>
								<p>Based on our own differentiated education consulting methods, we provide enterprises with an education consulting service required to achieve their business strategies and business goals and support educational consulting for elementary school, middle school, high school, and university students to successfully find a job through the establishment of a proper career road map and employment strategy.</p>
							</div>
							<div class="img">
								<img src="/resources/en/img/img_main_service04.jpg" alt="Education Consulting"/>
							</div>
						</li>
						<li>
							<div class="txt">
								<span class="tit">MICE (Meeting, Incentive trip, Convention, Event) Business</span>
								<p>MICE Business is a service to plan and hold large and small events such as an employment service-related career fair, workshop, public or private seminar, forum, and others required to provide job seekers with an opportunity to work and enterprises recruiting employees with an opportunity to hire them.</p>
							</div>
							<div class="img">
								<img src="/resources/en/img/img_main_service05.jpg" alt="MICE (Meeting, Incentive trip, Convention, Event) Business"/>
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
					<a href="#" class="btn_go" onclick="section2Move(); return false;">Please consult with professional <br />consultants of K-Jobs in detail</a>
				</div>

			</div>
			<div class="main_section03">
				<div class="inner">
					<div class="txt">
						<h2>INSTAGRAM</h2>
						<p>Please listen to real <br />stories of people who <br />succeeded in <br />employment and <br />consultants by K-Jobs</p>
					</div>
					<div class="list">
						<ul id="insta_img">
						</ul>
					</div>
				</div>
			</div>
			<div class="main_section05">
				<div class="inner">
					<h2>CONTACT</h2>
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

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCkbkHsVbYxg4C1VtWEKs6297cvOeudTDg&callback=initMap" async defer></script>
<script>

function section2Move(){
	var slideIdx = $("#num_pager .active").data("slide-index")+1;
	var url = "";
	if(slideIdx == "1"){
		url = "/en/sub/business/business02_01.do";
	}else if(slideIdx == "2"){
		url = "/en/sub/business/business01_01.do";

	}else if(slideIdx == "3"){
		url = "/en/sub/business/business01_02.do";

	}else if(slideIdx == "4"){
		url = "/en/sub/business/business04_01.do";

	}else if (slideIdx =="5"){
		url = "/en/sub/business/business03_01.do";
	}

	document.location.href = url;

}
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

