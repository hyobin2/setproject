<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
        <div id="contents">
            <div class="main_visual section">
                <div id="mainVisual" class="swiper-container">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide" style="background:url('/resources/ko/images/main01.jpg') center/cover no-repeat;">
                            <div class="wrapper">
                                <h2 class="tit"><img src="/resources/ko/images/tit.png" alt="the future fit"></h2>
                                <div class="mv_info">
                                    <h3>Tech & Product</h3>
                                    <div class="txt_box clear">
                                        <h2>㈜모바인어스</h2>
                                        <p>
                                           ㈜모바인어스는 스포츠 헬스케어, IoT 디바이스, AR·VR 실감형 콘텐츠, 전시 영상 개발 전문 업체로써<br>
                                           디자인에서부터 개발, 제조, 서비스, 소프트웨어를 통한 다채널 영상제어 기술까지 모든 공정을 직접 운용하고 있습니다.
                                        </p>
                                    </div>
                                    <div class="btn01 view_btn">
                                        View Video
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide" style="background:url('/resources/ko/images/main02.jpg') center/cover no-repeat;">
                            <div class="wrapper">
                                    <h2 class="tit"><img src="/resources/ko/images/tit.png" alt="the future fit"></h2>
                                <div class="mv_info">
                                    <h3>Tech & Product</h3>
                                    <div class="txt_box clear">
                                        <h2>㈜모바인어스</h2>
                                        <p>
                                            ㈜모바인어스는 스포츠 헬스케어, IoT 디바이스, AR·VR 실감형 콘텐츠, 전시 영상 개발 전문 업체로써<br>
                                            디자인에서부터 개발, 제조, 서비스, 소프트웨어를 통한 다채널 영상제어 기술까지 모든 공정을 직접 운용하고 있습니다.
                                        </p>
                                    </div>
                                    <div class="btn01 view_btn">
                                        View Video
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide" style="background:url('/resources/ko/images/main03.jpg') center/cover no-repeat;">
                            <div class="wrapper">
                                <h2 class="tit"><img src="/resources/ko/images/tit.png" alt="the future fit"></h2>
                                <div class="mv_info">
                                    <h3>Tech & Product</h3>
                                    <div class="txt_box clear">
                                        <h2>㈜모바인어스</h2>
                                        <p>
                                            ㈜모바인어스는 스포츠 헬스케어, IoT 디바이스, AR·VR 실감형 콘텐츠, 전시 영상 개발 전문 업체로써<br>
                                            디자인에서부터 개발, 제조, 서비스, 소프트웨어를 통한 다채널 영상제어 기술까지 모든 공정을 직접 운용하고 있습니다.
                                        </p>
                                    </div>
                                    <div class="btn01 view_btn">
                                        View Video
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Add Pagination -->
                    <div class="swiper-pagination"></div>
                    <!-- Add Arrows -->
                    <div class="swiper-next"><i class="xi-angle-right-thin"></i></div>
                    <div class="swiper-prev"><i class="xi-angle-left-thin"></i></div>
                </div>
            </div>

            <div class="seciton_others">
                <div class="bg"></div>
                <div id="wave1" class="waves on">
                    <svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 10 150 35" width="2000" height="466" preserveAspectRatio="none">
                        <defs>
                            <path id="gentle-wave1"
                                    d="M-160 44c30 0
                                    58-14 88-14s
                                    58 14 88 14
                                    58-14 88-14
                                    58 14 88 14
                                    v-44h-352z"></path>
                        </defs>
                        <g class="parallax">
                            <use xlink:href="#gentle-wave1" x="0" y="0" fill="#fff"></use>
                        </g>
                    </svg>
                </div>
                <div id="wave2" class="waves on">
                    <svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 25 150 45" width="2000" preserveAspectRatio="none">
                        <defs>
                            <path id="gentle-wave2"
                                    d="M-160 44c30 0
                                    58-18 88-18s
                                    58 18 88 18
                                    58-18 88-18
                                    58 18 88 18
                                    v44h-352z" ></path>
                        </defs>
                        <g class="parallax">
                            <use xlink:href="#gentle-wave2" x="-50" y="0" fill="#fff"></use>
                        </g>
                    </svg>
                </div>
                <div id="wave3" class="waves on">
                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 10 150 35" width="2000" preserveAspectRatio="none">
                        <defs>
                            <path id="gentle-wave3"
                                    d="M-160 44c30 0
                                    58-18 88-18s
                                    58 18 88 18
                                    58-18 88-18
                                    58 18 88 18
                                    v-44h-352z" ></path>
                        </defs>
                        <g class="parallax">
                            <use xlink:href="#gentle-wave3" x="0" y="0" fill="#fff"></use>
                        </g>
                    </svg>
                </div>
                <div id="wave4" class="waves on">
                    <svg  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 25 150 45" width="2000" preserveAspectRatio="none">
                        <defs>
                            <path id="gentle-wave4"
                                    d="M-160 44c30 0
                                    58-12 88-12s
                                    58 12 88 12
                                    58-12 88-12
                                    58 12 88 12
                                    v44h-352z" ></path>
                        </defs>
                        <g class="parallax">
                            <use xlink:href="#gentle-wave4" x="50" y="0" fill="#fff"></use>
                        </g>
                    </svg>
                </div>

                <div class="section_area main_business">
                    <div class="wrapper clear">
                        <div class="pattern pattern1_1 dowm"><img src="/resources/ko/images/pattern1_1.png" alt=""></div>
                        <div class="pattern pattern1_2 up"><img src="/resources/ko/images/pattern1_2.png" alt=""></div>
                        <div class="main_tit">
                            <h2 class="fo_exo">BUSINESS</h2>
                            <p>
                                모바인어스는 아이디어와 기술로<br>
                                트렌드를 리드하는 창조적 가치를<br>
                                목표로 합니다.
                            </p>
                        </div>
                        <div class="main_business_list clear">
                            <div class="main_business_con">
                                <a href="/ko/business/future.do" class="clear">
                                    <div class="img_box">
                                        <div class="img">
                                            <img src="/resources/ko/images/business_img1.jpg" class="pc" alt="">
                                            <img src="/resources/ko/images/business_img1_m.jpg" class="mobile" alt="">
                                        </div>
                                    </div>
                                    <div class="text_box">
                                        <div class="text_inner">
                                            <div class="tit">
                                                <span class="ico"><img src="/resources/ko/images/business_ico1.png" alt=""></span>
                                                The Future Fit
                                            </div>
                                            <div class="desc">
                                                스포츠와 ICT의 융복합 B2B, B2C<br>
                                                비즈니스 모델
                                            </div>
                                            <div class="more fo_exo">
                                                View More
                                                <span>
                                                    <img src="/resources/ko/images/business_arrow1.png" alt="더보기">
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="main_business_con">
                                <a href="/ko/business/arvrev.do" class="clear">
                                    <div class="text_box con2">
                                        <div class="text_inner">
                                            <div class="tit">
                                                <span class="ico"><img src="/resources/ko/images/business_ico2.png" alt=""></span>
                                               	전시영상
                                            </div>
                                            <div class="desc">
					                                                다채널 영상·음향, 기획&설계&시공,<br>
					                                                디지털사이니지, 체감형 콘텐츠
                                            </div>
                                            <div class="more fo_exo">
                                                View More
                                                <span>
                                                    <img src="/resources/ko/images/business_arrow2.png" alt="더보기">
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="img_box con2">
                                        <div class="img">
                                            <img src="/resources/ko/images/business_img2.jpg" class="pc" alt="">
                                            <img src="/resources/ko/images/business_img2_m.jpg" class="mobile" alt="">
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="main_business_con">
                                <a href="/ko/vrsports/vrsports.do" class="clear">
                                    <div class="img_box">
                                        <div class="img">
                                            <img src="/resources/ko/images/business_img3.jpg" class="pc" alt="">
                                            <img src="/resources/ko/images/business_img3_m.jpg" class="mobile" alt="">
                                        </div>
                                    </div>
                                    <div class="text_box con3">
                                        <div class="text_inner">
                                            <div class="tit">
                                                <span class="ico"><img src="/resources/ko/images/business_ico3.png" alt=""></span>
                                                가상현실스포츠실
                                            </div>
                                            <div class="desc">
                                                차세대 미래체육교육시스템<br>
                                                (문화체육관광부, 국민체육진흥공단 지원)
                                            </div>
                                            <div class="more fo_exo">
                                                View More
                                                <span>
                                                    <img src="/resources/ko/images/business_arrow3.png" alt="더보기">
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="section_area main_refer">
                    <div class="wrapper">
                            <div class="pattern pattern2_1 dowm"><img src="/resources/ko/images/pattern2_1.png" alt=""></div>
                            <div class="pattern pattern2_2 up"><img src="/resources/ko/images/pattern2_2.png" alt=""></div>
                            <div class="pattern pattern2_3 dowm"><img src="/resources/ko/images/pattern2_3.png" alt=""></div>
                        <div class="main_tit">
                            <h2 class="fo_exo">REFERENCE</h2>
                            <p>
                                모바인어스의 다양한<br>
                                개발 사례들을 만나보세요.
                            </p>
                        </div>
                        <div class="main_refer_box">
                            <div class="main_refer_con clear">
                                <div class="img">
                                    <img src="/resources/ko/images/main_refer_img01.jpg" alt="">
                                </div>
                                <div class="text">
                                    <div class="text_inner">
                                        <h2 class="fo_exo">The Future Fit</h2>
                                        <p>
                                            스포츠와 ICT(정보통신기술)의<br>
                                            융복합 B2B, B2C 비즈니스 모델
                                        </p>
                                        <ul>
                                            <li>Smart Healthcare</li>
                                            <li>IoT Device</li>
                                            <li>Embedded system</li>
                                            <li>Gamification contents</li>
                                            <li>Body composition analysis</li>
                                        </ul>
                                        <div class="btn01">
                                            <a href="/ko/reference/futurefit/list.do" class="fo_exo">VIEW MORE <i class="xi-long-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="main_refer_con right clear">
                                <div class="img">
                                    <img src="/resources/ko/images/main_refer_img02.jpg" alt="">
                                </div>
                                <div class="text_box con2">
                                    <div class="text">
                                        <div class="text_inner">
                                            <h2 class="fo_exo">전시영상</h2>
                                            <p>
                                                다채널 영상·음향, 기획&설계&시공,<br>
                                                디지털사이니지, 체감형 콘텐츠
                                            </p>
                                            <ul>
                                                <li>Exhibition Planning</li>
                                                <li>Edge blending</li>
                                                <li>Digital Signage</li>
                                                <li>Rear Screen system</li>
                                                <li>VR Experience</li>
                                                <li>Interactive AR</li>
                                            </ul>
                                            <div class="btn01">
                                                <a href="/ko/reference/arvrev/list.do" class="fo_exo">VIEW MORE <i class="xi-long-arrow-right"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="section_area main_rnd">
                    <div class="wrapper clear">
                            <div class="pattern pattern3_1 up"><img src="/resources/ko/images/pattern3_1.png" alt=""></div>
                            <div class="pattern pattern3_3 dowm"><img src="/resources/ko/images/pattern3_3.png" alt=""></div>
                        <div class="main_tit">
                            <h2 class="fo_exo">R&amp;D</h2>
                            <ul>
                                <li>임베디드 솔루션 분야</li>
                                <li>스포츠 헬스케어 분야</li>
                                <li>전시 영상, 음향 분야</li>
                            </ul>
                            <div class="swiper_box clear">
                                <!-- Add Arrows -->
                                <div class="swiper-prev"><i class="xi-angle-left-min"></i></div>
                                <div class="swiper-pagination"></div>
                                <div class="swiper-next"><i class="xi-angle-right-min"></i></div>
                            </div>
                        </div>
                        <div id="mainRnd" class="swiper-container">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <div class="img">
                                        <img src="/resources/ko/images/main_rnd_img01.jpg" alt="">
                                    </div>
                                    <div class="con">
                                        <div class="table_cell">
                                            <h3>임베디드 솔루션 분야</h3>
                                            <p>
                                                IOT 플랫폼<br>
                                                임베디드 S/W<br>
                                                센서 노드<br>
                                                컨트롤 노드
                                            </p>
                                        </div>
                                    </div>

                                </div>
                                <div class="swiper-slide">
                                        <div class="img">
                                            <img src="/resources/ko/images/main_rnd_img02.jpg" alt="">
                                        </div>
                                        <div class="con">
                                            <div class="table_cell">
                                                <h3>스포츠 헬스케어 분야</h3>
                                                <p>
                                                    운동량 &amp; 신체 변화량 분석, 실시간<br>
                                                    건강관리 데이터, 사용자 통계모듈<br>
                                                    코칭 서비스<br>
                                                    Health-related Device<br>
                                                    Skill-related Device<br>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="img">
                                            <img src="/resources/ko/images/main_rnd_img03.jpg" alt="">
                                        </div>
                                        <div class="con">
                                            <div class="table_cell">
                                                <h3>전시 영상, 음향 분야</h3>
                                                <p>
                                                    Exhibition Planning, Edge-Blending<br>
                                                    Simulation analysis<br>
                                                    Warping application<br>
                                                    Rear Screen system
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="section_area main_now">
                    <div class="wrapper clear">
                        <div class="main_tit">
                            <h2 class="fo_exo">NOW</h2>
                            <p>
                                모바인어스에서 전하는<br>
                                다양한 소식들을 확인해보세요.
                            </p>
                            <div class="swiper_box clear">
                                <!-- Add Arrows -->
                                <div class="swiper-prev"><i class="xi-angle-left-min"></i></div>
                                <div class="swiper-pagination fo_exo"></div>
                                <div class="swiper-next"><i class="xi-angle-right-min"></i></div>
                            </div>
                        </div>
                        <div id="mainNow" class="swiper-container">
                            <div class="swiper-wrapper">
								<c:forEach var="result" items="${nowList}" varStatus="status">
                                <div class="swiper-slide">
                                    <a href="${result.url != '' ? result.url:'#' }">
                                        <div class="img">
                                        	<c:if test="${result.fileList[0].fOrder == '1'}">
                                        		<img src="/file/viewImg.do?fIdx=${result.fileList[0].fIdx}&thumbYn=Y&w=280&h=220" alt="${result.fileList[0].orgFilename}">
			                                </c:if>

                                        </div>
                                        <div class="txt">
                                            <p class="tit">
                                               ${result.title }
                                            </p>
                                            <p class="date">
                                                2019.04.19
                                            </p>
                                        </div>
                                    </a>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="visual_popup">
                <div class="pop_inner">
                    <div class="pop_con">
                        <iframe src="https://www.youtube.com/embed/1at7kKzBYxI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
            <div class="pop_mask"></div>
