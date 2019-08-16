<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="util" uri="util"%>
        <div id="contents" class="about_page">
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
                        <li>(주)모바인어스</li>
                    </ul>
                    <div class="sub_tit">
                        <h2>회사소개</h2>
                        <p>아이디어와 기술로 트렌드를 리드하는 (주)모바인어스</p>
                    </div>
                </div>
            </div>
            <div class="section about_con01">
                <div class="wrapper">
                    <h3 class="sub_con_tit">
                        ㈜모바인어스
                    </h3>
                    <p class="sub_con_txt">
                        ㈜모바인어스는 헬스케어 기반 하드웨어&소프트웨어의 개발과 제조,<br>
                        멀티미디어학습시스템 및 디지털 사이니지, 전시 콘텐츠 개발 및 기획 전문 기업입니다.
                    </p>
                    <ul class="about_con1_list clear">
                        <li>
                            <h4>
                                <span><img src="/resources/ko/images/about_ico01.png" alt="the future fit"></span>
                                The Future Fit
                            </h4>
                            <p class="img_box">
                                <img src="/resources/ko/images/about_img01.jpg" alt="the future fit">
                            </p>
                            <ul>
                                <li>Smart Healthcare</li>
                                <li>IoT Device</li>
                                <li>Gamification contents</li>
                                <li>Body composition analysis</li>
                                <li>Embedded system</li>
                            </ul>
                        </li>
                        <li>
                            <h4>
                                <span><img src="/resources/ko/images/about_ico02.png" alt="전시영상"></span>
                                전시영상
                            </h4>
                            <p class="img_box">
                                <img src="/resources/ko/images/about_img02.jpg" alt="전시영상">
                            </p>
                            <ul>
                                <li>Edge blending</li>
                                <li>Multivision</li>
                                <li>Digital Signage</li>
                                <li>Rear Screen system</li>
                                <li>Interactive AR·VR·MR</li>
                            </ul>
                        </li>
                        <li>
                            <h4>
                                <span><img src="/resources/ko/images/about_ico03.png" alt="가상현실스포츠실"></span>
                                가상현실스포츠실
                            </h4>
                            <p class="img_box">
                                <img src="/resources/ko/images/about_img03.jpg" alt="가상현실스포츠실">
                            </p>
                            <ul class="con3">
                                <li>차세대 미래체육교육시스템</li>
                                <li>Health-related Device</li>
                                <li>Skill-related Device</li>
                                <li>운동량 & 신체 변화량 분석</li>
                                <li>실시간 건강관리 데이터</li>
                                <li>사용자 통계 모듈/ 코칭 서비스</li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="section about_con02">
                <img src="/resources/ko/images/about_con02_bg.jpg" alt="" class="pc">
                <img src="/resources/ko/images/about_con02_bg_m.jpg" alt="" class="mobile">
                  <div class="wrapper">
                    <div class="sub_pattern">
                        <img src="/resources/ko/images/pattern2_1.png" alt="">
                    </div>
                    <div class="con_txt">
                        <h4>㈜모바인어스</h4>
                        <h5>대표이사 김의광</h5>
                        <p>
							주식회사 모바인어스는 언제나 고객 입장에서의 혁신적인 기술 개발을 추구합니다.<br />
							제품과 서비스의 흥미로움에서 머무는 것이 아닌 다양한 의견을 귀담아 듣고 여러분과 지속적 관계가 되고자<br />
							항상 고민하고 노력하겠습니다. 감사합니다.
                        </p>
                    </div>
                </div>
            </div>
            <div id="history" class="section about_con03">
                <div class="wrapper">
                    <h3 class="tit">주요 연혁 및 인증</h3>
                    <div class="img_box">
                        <img src="/resources/ko/images/about_con03_img01.jpg" alt="" class="pc">
                        <img src="/resources/ko/images/about_con03_img01_m.jpg" alt="" class="mobile">
                    </div>
                    <div class="history_list">
						<c:set var="curYear" value="" />
                        <c:forEach var="result" items="${list}" varStatus="status">
                        	<c:if test="${curYear != result.year }">
                        		<c:set var="curYear" value="${result.year }" />
                        			<c:if test="${status.index > 0 }">
	                        				</ul>
	                        			</div>
                        			</c:if>
                        		<div>
	                            	<h4>${curYear }</h4>
	                            	<ul class="story_list">
                        	</c:if>
                        	<li>
                                <span>${result.month }.</span>
                                <ul>
                                   <li>${result.content }</li>
                                </ul>
                            </li>
                            <c:if test="${status.index+1 == fn:length(list) }">
                     				</ul>
                     			</div>
                    		</c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
