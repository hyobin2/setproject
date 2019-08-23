<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
        <div id="contents" class="contact_page">
            <div class="section_top">
                <div class="top_wave">
                    <svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 21 150 24" preserveAspectRatio="none">
                        <defs><path id="top_wave" d="M-160 44c30 0 58-11 88-11s 58 11 88 11 58-11 88-11 58 11 88 11 v44h-352z" /></defs>
                        <g class="parallax"><use xlink:href="#top_wave" x="10" y="0" fill="#fff"/></g>
                    </svg>
                </div>
                <div class="wrapper">
                    <ul class="breadcrumb clear">
                        <li>HOME</li>
                        <li>회사소개</li>
                        <li>오시는 길</li>
                    </ul>
                    <div class="sub_tit">
                        <h2>회사소개</h2>
                        <p>아이디어와 기술로 트렌드를 리드하는 (주)모바인어스</p>
                    </div>
                </div>
            </div>
            <div class="section contact_con01">
                <div class="wrapper">
                    <h3 class="sub_con_tit">
                        오시는길
                    </h3>
                    <div class="tab_btn_box">
                        <ul class="clear pc">
                            <li class="tab_btn"><a href="seoul" onclick="resizeMap();">서울</a></li>
                            <li class="tab_btn"><a href="jeonnam" onclick="resizeMap();">전남</a></li>
                            <li class="tab_btn"><a href="lab" onclick="resizeMap();">연구소/제조공장</a></li>
                        </ul>
                        <select class="mobile" onchange="resizeMap();">
                            <option class="tab_btn" value="seoul" >서울</option>
                            <option class="tab_btn" value="jeonnam" >전남</option>
                            <option class="tab_btn" value="lab" >연구소/제조공장</option>
                        </select>
                    </div>
                    <div class="tab_panel">
                        <div id="seoul" class="tab_con">
                            <h3>서울</h3>
                            <div class="info_box clear">
                                <div class="map_box">
                                    <div id="map01"></div>
                                </div>
                                <ul class="info">
                                    <li>
                                        <h4>주소</h4>
                                        <p>
											서울 강남구 도곡로 123(역삼동 839-15) 대경빌딩 2층<br />
											2nd Floor, 123, Dogok-ro, Gangnam-gu, Seoul , Republic of Korea
                                        </p>
                                    </li>
                                    <li>
                                        <h4>대표전화</h4>
                                        <p>
                                            +82-2-785-7644
                                        </p>
                                    </li>
                                    <li>
                                        <h4>팩스</h4>
                                        <p>
                                            +82-2-785-7646
                                        </p>
                                    </li>
                                    <li>
                                        <h4>이메일</h4>
                                        <p>
                                            biz@mobinus.co.kr
                                        </p>
                                    </li>
                                </ul>
                            </div>
                            <div class="transport_box">
                                <ul class="clear">
                                    <li>지하철 이용시</li>
                                    <li>
                                        <p>강남역 4번 출구 / 양재역 3번 출구</p>
                                    </li>
                                </ul>
                                <ul class="clear">
                                    <li>버스 이용시</li>
                                    <li>
                                        <p>간선버스 340, 420, 461</p>
                                        <p>지선버스 4432</p>
                                        <p>광역버스 M7412</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div id="jeonnam" class="tab_con">
                            <h3>전남</h3>
                            <div class="info_box clear">
                                <div class="map_box">
                                    <div id="map02"></div>
                                </div>
                                <ul class="info">
                                    <li>
                                        <h4>주소</h4>
                                        <p>
                                            전남 나주시 정보화길 26, 409호(빛가람동, 케이원지식산업센터) <br />
                                            409, 26, Jeongbohwa-gil, Naju-si, Jeollanam-do, Republic of Korea
                                        </p>
                                    </li>
                                    <li>
                                        <h4>대표전화</h4>
                                        <p>
                                            +82-2-785-7644
                                        </p>
                                    </li>
                                    <li>
                                        <h4>팩스</h4>
                                        <p>
                                            +82-2-785-7646
                                        </p>
                                    </li>
                                    <li>
                                        <h4>이메일</h4>
                                        <p>
                                            biz@mobinus.co.kr
                                        </p>
                                    </li>
                                </ul>
                            </div>
                            <div class="transport_box">
                                <ul>
                                    <li>버스 이용시</li>
                                    <li>
                                        <p>간선버스 1160</p>
                                        <p>지선버스 700, 701</p>
                                        <p>급행버스 좌석02</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div id="lab" class="tab_con">
                            <h3>연구소/제조공장</h3>
                            <div class="info_box clear">
                                <div class="map_box">
                                    <div id="map03"></div>
                                </div>
                                <ul class="info">
                                    <li>
                                        <h4>주소</h4>
                                        <p>
                                            서울 강남구 도곡로 123(역삼동 839-15), 대경빌딩 B102호<br>
                                            B102, 123, Dogok-ro, Gangnam-gu, Seoul , Republic of Korea
                                        </p>
                                    </li>
                                    <li>
                                        <h4>대표전화</h4>
                                        <p>
                                            +82-2-785-7644
                                        </p>
                                    </li>
                                    <li>
                                        <h4>팩스</h4>
                                        <p>
                                            +82-2-785-7646
                                        </p>
                                    </li>
                                    <li>
                                        <h4>이메일</h4>
                                        <p>
                                            biz@mobinus.co.kr
                                        </p>
                                    </li>
                                </ul>
                            </div>
                            <div class="transport_box">
                                <ul>
                                    <li>지하철 이용시</li>
                                    <li>
                                        <p>강남역 4번 출구 / 양재역 3번 출구</p>
                                    </li>
                                </ul>
                                <ul>
                                    <li>버스 이용시</li>
                                    <li>
                                        <p>간선버스 340, 420, 461</p>
                                        <p>지선버스 4432</p>
                                        <p>광역버스 M7412</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2e283d6f385f2846062f23cc6debb1eb"></script>
		<script>
			//서울
			var mapContainer1 = document.getElementById('map01'),
				mapOption1 = {
					center: new kakao.maps.LatLng(37.490500, 127.033847),
					level: 3,
					mapTypeId : kakao.maps.MapTypeId.ROADMAP
				};
			var map1 = new kakao.maps.Map(mapContainer1, mapOption1);
			var marker1 = new kakao.maps.Marker({
				position: new kakao.maps.LatLng(37.490500, 127.033847),
				map: map1
			});

			//전남
			var mapContainer2 = document.getElementById('map02'),
				mapOption2 = {
					center: new kakao.maps.LatLng(35.020972, 126.797436),
					level: 3,
					mapTypeId : kakao.maps.MapTypeId.ROADMAP
				};
			var map2 = new kakao.maps.Map(mapContainer2, mapOption2);
			var marker2 = new kakao.maps.Marker({
				position: new kakao.maps.LatLng(35.020972, 126.797436),
				map: map2
			});

			//연구소
			var mapContainer3 = document.getElementById('map03'),
				mapOption3 = {
					center: new kakao.maps.LatLng(37.490500, 127.033847),
					level: 3,
					mapTypeId : kakao.maps.MapTypeId.ROADMAP
				};
			var map3 = new kakao.maps.Map(mapContainer3, mapOption3);
			var marker3 = new kakao.maps.Marker({
				position: new kakao.maps.LatLng(37.490500, 127.033847),
				map: map3
			});

			resizeMap();
			function resizeMap(){
				setTimeout(function(){
					map1.relayout();
					map1.setCenter( new kakao.maps.LatLng(37.490500, 127.033847));
					map2.relayout();
					map2.setCenter( new kakao.maps.LatLng(35.020972, 126.797436));
					map3.relayout();
					map3.setCenter( new kakao.maps.LatLng(37.490500, 127.033847));
				}, 500);
			}
		</script>