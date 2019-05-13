<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>




<section id="features" class="features section">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-6 feature text-center">
                   <span class="icon"><i class='fa fa-group'></i></span>
                    <div class="feature-content">
                        <h5>스터디 그룹</h5>
                        <p>스터디그룹을 만들거나 가입해서 스터디원들과 함께 공부해보세요. 스터디그룹을 위한 게시판, 일정, 채팅 기능을제공합니다.</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 feature text-center">
                    <span class="icon icon-calendar"></span>
                    <div class="feature-content">
                        <h5>스터디룸 예약</h5>
                        <p>스터디원들과 함께할 스터디룸을 예약해보세요.<br>스터디룸을 조회하고 예약할 수 있습니다.</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 feature text-center">
                    <span class="icon icon-book-open"></span>
                    <div class="feature-content">
                        <h5>오프라인 수업</h5>
                        <p>다양한 선생님들이 여러분께 강의를 제공합니다.<br>오프라인 수업을 구매해 참여해보세요!</p>
                    </div>
                </div>            
            </div>
        </div>
    </section><!-- features -->

    <section id="works" class="works section no-padding">
        <div class="container-fluid">
            <div class="row no-gutter">
                <div class="col-lg-3 col-md-6 col-sm-6 work">
                    <a href="<%=cp%>/resource/images/mypage.jpeg" class="work-box">
                        <img src="<%=cp%>/resource/images/mypage.jpeg" alt="">
                        <div class="overlay">
                            <div class="overlay-caption">
                                <h5>오답노트</h5>
                                <p>마이페이지에서 자신의 오답노트를 만들고 관리할 수 있습니다.</p>
                            </div>
                        </div><!-- overlay -->
                    </a>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 work">
                    <a href="<%=cp%>/resource/images/groupstudy.jpg" class="work-box">
                        <img src="<%=cp%>/resource/images/clocks.jpg" alt="">
                        <div class="overlay">
                            <div class="overlay-caption">
                                <h5>타이머</h5>
                                <p>과목과 목표치를 설정하여 자신의 공부시간을 측정할 수 있습니다.</p>
                            </div>
                        </div><!-- overlay -->
                    </a>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 work">
                    <a href="<%=cp%>/resource/images/work-3.jpg" class="work-box">
                        <img src="<%=cp%>/resource/images/groupstudy.jpg" alt="">
                        <div class="overlay">
                            <div class="overlay-caption">
                                <h5>스터디그룹</h5>
                                <p>스터디 그룹을 만들거나 가입하여 공부의 도움을 받을 수 있습니다.</p>
                            </div>
                        </div><!-- overlay -->
                    </a>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 work">
                    <a href="<%=cp%>/resource/images/work-4.jpg" class="work-box">
                        <img src="<%=cp%>/resource/images/studyroom2.jpg" alt="">
                        <div class="overlay">
                            <div class="overlay-caption">
                                <h5>스터디룸</h5>
                                <p>스터디룸을 검색하고 자신이 원하는 날짜에 스터디룸을 예약할 수 있습니다.</p>
                            </div>
                        </div><!-- overlay -->
                    </a>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 work">
                    <a href="<%=cp%>/resource/images/work-5.jpg" class="work-box">
                        <img src="<%=cp%>/resource/images/teacher.jpg" alt="">
                        <div class="overlay">
                            <div class="overlay-caption">
                                <h5>오프라인 강의</h5>
                                <p>오프라인 강의를 결제하여 선생님으로부터 직접 도움을 받을 수 있습니다.</p>
                            </div>
                        </div><!-- overlay -->
                    </a>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 work">
                    <a href="<%=cp%>/resource/images/work-6.jpg" class="work-box">
                        <img src="<%=cp%>/resource/images/chat.jpg" alt="">
                        <div class="overlay">
                            <div class="overlay-caption">
                                <h5>채팅</h5>
                                <p>스터디그룹과 강의 페이지에서 실시간으로 채팅할 수 있습니다.</p>
                            </div>
                        </div><!-- overlay -->
                    </a>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 work">
                    <a href="<%=cp%>/resource/images/work-7.jpg" class="work-box">
                        <img src="<%=cp%>/resource/images/calendar.jpg" alt="">
                        <div class="overlay">
                            <div class="overlay-caption">
                                <h5>일정</h5>
                                <p>공부 일정을 짜고 공유할 수 있습니다.</p>
                            </div>
                        </div><!-- overlay -->
                    </a>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 work">
                    <a href="<%=cp%>/resource/images/work-8.jpg" class="work-box">
                        <img src="<%=cp%>/resource/images/community.jpg" alt="">
                        <div class="overlay">
                            <div class="overlay-caption">
                                <h5>커뮤니티</h5>
                                <p>스터디 그룹 뿐만 아니라 커뮤니티에서 많은 사람들과 정보를 공유할 수 있습니다.</p>
                            </div>
                        </div><!-- overlay -->
                    </a>
                </div>
            </div>
        </div>
    </section><!-- works -->

    <section id="teams" class="section teams">
        <div class="container">
            <div class="row" style="margin-top: 100px;">
                <div class="col-md-3 col-sm-6">
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="person">
                        <img src="<%=cp%>/resource/images/dh2.jpg" alt="" class="img-responsive">
                        <div class="person-content">
                            <h4>한다혜</h4>
                            <h5 class="role">스터디 및 스터디 상세 페이지</h5>
                            <p>스터디 그룹 검색 및 조회, 스터디 그룹 일정, 게시판을 만들었습니다. 또한 Node.js와 MongoDB를 이용해 실시간 채팅을 구현하고 KG이니시스의 API를 이용해 공동구매의 결제 기능을 만들었습니다.</p>
                        </div>
                        <ul class="social-icons clearfix">
                            <li><a href="#" class=""><span class="fa fa-facebook"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-twitter"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-linkedin"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-google-plus"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-dribbble"></span></a></li>
                        </ul>
                    </div><!-- person -->
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="person">
                        <img src="<%=cp%>/resource/images/mj2.jpg" alt="" class="img-responsive">
                        <div class="person-content">
                            <h4>이민지</h4>
                            <h5 class="role">강의 및 선생님 페이지</h5>
                            <p>선생님 페이지의 선생님 소개, 평가, 강의 목록, 게시판을 구현하였습니다. 강의 게시판에서 강의 조회 및 검색, 강의 구매를 개발하였습니다. 또한 파일을 Zip으로 묶어 한꺼번에 받는 것을 구현했습니다.</p>
                        </div>
                        <ul class="social-icons clearfix">
                            <li><a href="#" class=""><span class="fa fa-facebook"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-twitter"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-linkedin"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-google-plus"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-dribbble"></span></a></li>
                        </ul>
                    </div><!-- person -->
                </div>
                <div class="col-md-3 col-sm-6">
                </div>
            </div>
            <div class="row" style="margin-top: 30px;">
                <div class="col-md-3 col-sm-6">
                    <div class="person">
                        <img src="<%=cp%>/resource/images/jm2.jpg" alt="" class="img-responsive">
                        <div class="person-content">
                            <h4>이재민</h4>
                            <h5 class="role">스터디룸 페이지</h5>
                            <p>스터디룸 검색 및 조회, 예약, 장바구니, 결제하는 부분을 디자인하고 기능을 구현했습니다. 또한 KAKAO에서 제공하는 지도 API를 이용하여 스터디룸의 위치를 지도상으로 나타내는 걸 구현했습니다.</p>
                        </div>
                        <ul class="social-icons clearfix">
                            <li><a href="#"><span class="fa fa-facebook"></span></a></li>
                            <li><a href="#"><span class="fa fa-twitter"></span></a></li>
                            <li><a href="#"><span class="fa fa-linkedin"></span></a></li>
                            <li><a href="#"><span class="fa fa-google-plus"></span></a></li>
                            <li><a href="#"><span class="fa fa-dribbble"></span></a></li>
                        </ul>
                    </div><!-- person -->
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="person">
                        <img src="<%=cp%>/resource/images/dk2.jpg" alt="" class="img-responsive">
                        <div class="person-content">
                            <h4>이동건</h4>
                            <h5 class="role">로그인 및 마이페이지</h5>
                            <p>회원가입 시 이메일을 보내 메일인증을 받는 걸 구현했습니다. 카카오와 연동하여 카카오ID로 회원가입이 가능합니다. 또한 마이페이지에서 개인정보 수정, 마이페이지, 일정을 구현했습니다.</p>
                        </div>
                        <ul class="social-icons clearfix">
                            <li><a href="#" class=""><span class="fa fa-facebook"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-twitter"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-linkedin"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-google-plus"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-dribbble"></span></a></li>
                        </ul>
                    </div><!-- person -->
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="person">
                        <img src="<%=cp%>/resource/images/hs2.jpg" alt="" class="img-responsive">
                        <div class="person-content">
                            <h4>임희석</h4>
                            <h5 class="role">관리지 페이지</h5>
                            <p>관리자 페이지에서 회원들이 신고한 내역을 확인할 수 있고, 회원을 차단할 경우 블랙리스트에서 조회 가능합니다. 또한 회원들을 검색 및 조회할 수 있습니다.<br><br></p>
                        </div>
                        <ul class="social-icons clearfix">
                            <li><a href="#" class=""><span class="fa fa-facebook"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-twitter"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-linkedin"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-google-plus"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-dribbble"></span></a></li>
                        </ul>
                    </div><!-- person -->
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="person">
                        <img src="<%=cp%>/resource/images/js2.jpg" alt="" class="img-responsive">
                        <div class="person-content">
                            <h4>홍재승</h4>
                            <h5 class="role">커뮤니티 및 고객센터</h5>
                            <p>고객센터 페이지에서  공지사항, 1:1문의, FAQ를 만들었습니다. 1:1문의의 경우 파일첨부가 가능하고, FAQ는 아코디언으로 만들었습니다. 또한 커뮤니티 페이지에서 과목별 게시판을 만들었습니다.</p>
                        </div>
                        <ul class="social-icons clearfix">
                            <li><a href="#" class=""><span class="fa fa-facebook"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-twitter"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-linkedin"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-google-plus"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-dribbble"></span></a></li>
                        </ul>
                    </div><!-- person -->
                </div>
            </div>
        </div>
    </section><!-- teams -->
   
<div class="footer-top footer">
            <div class="container">
                <div class="row">
                    <div class="footer-col col-md-4">
                        <h5>스터디룸 운영하기</h5>
                        <p>스터디 가페, 강의실을 studyUp에 올려서 운영해보세요.</p>
                        <a href="<%=cp%>/register/check?mode=studyroom" class="btn btn-large">스터디룸 운영페이지 이동</a>
                    </div>
                    <div class="footer-col col-md-4">
                       	<h5>studyUp에서 가르치기</h5>
                        <p>studyUp에서 자신이 좋아하는 분야를 가르쳐보세요.</p>
                        <a href="<%=cp%>/register/check?mode=teacher" class="btn btn-large">강의 운영페이지 이동</a>
                    </div>
                    <div class="footer-col col-md-4">
                        <h5>고객센터</h5>
                        <p>studyUp에 대해 궁금하신 점을 언제든지 물어보세요.</p>
                        <a href="<%=cp%>/servicecenter/main" class="btn btn-large">고객센터로 이동</a>    
                    </div>
                </div>
            </div>
        </div><!-- footer top -->

   


   