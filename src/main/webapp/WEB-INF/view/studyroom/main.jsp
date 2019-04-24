<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3088b9ab47979dd906360da2fb19d5f8&libraries=services"></script>
<script type="text/javascript">

// 좌측 사이드바 메뉴버튼
	function srOpenNav() {
	    document.getElementById("srMySidenav").style.width = "120px";
	    $("#srMain").hide();
	    // document.body.style.backgroundColor = "#438042";
	}

// 좌측 사이드바 닫기 버튼
	function srCloseNav() {
	    document.getElementById("srMySidenav").style.width = "0";
	    $("#srMain").show();
	    //document.body.style.backgroundColor = "white";
	}


	$(document).ready(function(){
		// 자동으로 열리는 modal
		$('#srModal').modal({remote:'<%=cp%>/studyroom/modal/created'});
		
		
		// 지도를 띄우는 코드 작성
		var container = document.getElementById('srMap'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
				level: 4 											 //지도의 레벨(확대, 축소 정도)
			};
		
		var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		
	});
	
	
	function viewMapSearch(){

		var places = new daum.maps.services.Places();

		var callback = function(result, status) {
		    if (status === daum.maps.services.Status.OK) {
		        console.log(result);
		    }
		};

		places.keywordSearch('판교 치킨', callback);
	};
	
	
	function close_pop(){
		$('#srModal').on('hidden.bs.modal', function(e)
		    { 
		        $(this).removeData();
		 }) ;
	};
	
// 시간 체크박스
	// 체크박스 건드리기
	$(document).on("change",".srTimeCB", function(){
		var f = $(this).is(":checked");
		
		if(f){
			$(this).parent().css("background-color", "#0aa54b");
			$(this).parent().children("span").css("background-color","#daffd0");
			return;
		}		
		$(this).parent().css("background-color", "#c0c0c0");
		$(this).parent().children("span").css("background-color","#ffffff");
	});
	
	// 색깔을 누르면 체크박스가 변하는 자바스크립트, 쿼리
	function checkOnOff() {
		var f = $(this).children("input");

		if(f.is(":checked")){
			f.prop("checked", false);
			return;
		}
		
		f.prop("checked", true);
		
	}
	
	// 모달 초기화 버튼
	function initial() {
		$(".srTimeCB").prop("checked", false);
		$(".srTimeCB").parent().css("background-color", "#c0c0c0");
		$(".srTimeCB").parent().children("span").css("background-color","#ffffff");
	}
	
	// 외부 jsp모달 불러오기
	$(function(){
		$(".btn-srModal").click(function(){
			$('#srModal').modal({remote:'<%=cp%>/studyroom/modal/main'});
		});
	});
	
	$(function(){
		$(".btn-srModalCreate").click(function(){
			$('#srModal').modal({remote:'<%=cp%>/studyroom/modal/created'});
		});
	});
	
	// 동적으로 input박스 추가하기
	// 테이블 행 추가
	function insertRow(){
		
		var addRow = "<tr class='srTableLine' style='border'><td class='secondTableName' style='background-color: #76956020'>";
			addRow += "<input type='text' id='roomName' name='roomName' class='srInsertText' style='background-color: #76956001' placeholder='방이름'></td>";
			addRow += "<td class='secondTableContent'><input type='text' id='unitPrice' name='unitPrice' class='srInsertText' placeholder='예) 8000'></td>";
			addRow += "<td class='secondTableContent'><input type='text' id='minUser' name='minUser' class='srInsertText' placeholder='예) 4'></td>";
			addRow += "<td class='secondTableContent'><input type='text' id='maxUser' name='maxUser' class='srInsertText' placeholder='예) 8'></td>";
			addRow += "<td><button type='button' class='srRemoveRow' onclick='deleteRow();'>X</button></td></tr>";
		
		$('#srRoomInfoTable').append(addRow);
	};
	
	function deleteLastRow(){
		$('#srRoomInfoTable').children().children().last().remove();
	};
	
	$(document).on("click",".srRemoveRow", function(){
		$(this).parent().parent().remove();
	});
	
	
	// write.jsp 마지막 리스트 새로확인
	$(document).on("click","#srModalFullTime", function(){
		// 먼저 안의 리스트를 지운다.
		$("#srModalRoomTime").children().remove();
		var opentime = parseInt($("input[name=cafeOpen]").val());
		var closetime = parseInt($("input[name=cafeClose]").val());
		if ( opentime=="" || opentime==null || closetime=="" || closetime==null ) {
			alert("값을 입력하세요.");
			return;
		}
		$("input[name=roomName]").each(function(){
			$divName = "<div class='roomName'>"+$(this).val()+"</div>"
			$divTimeButton = $("<div class='srTimeButton'>");
			$("#srModalRoomTime").append($divName);
			$("#srModalRoomTime").append($divTimeButton);
			for ( var i = opentime ; i < closetime ; i++) {
				var label  = "<label class='srTimeColor'><input class='srTimeCB' type='checkbox' autocomplete='off'>";
					label += "<span>|"+i+":00|</span>";
					label += "<input type='hidden' name='checkTime' value='"+i+"'>";
					$(".srTimeButton").last().append(label);
			}
			var checkboxCount = "<input type='hidden' name='checkboxCount' style='border:none; width: 50px;' readonly='readonly'>"
			$(".srTimeButton").last().append(checkboxCount);
		});
		
		$(".srTimeCB").hide();
	});
	
	// 주소검색 API
	function srPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                
            	var addr = ''; // 주소 변수
            	var extraAddr = ''; // 참고항목 변수
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = '(' + extraAddr + ')';
                    }
                }

                document.getElementById("roadAddr").value = data.roadAddress;
                document.getElementById("normAddr").value = data.jibunAddress;
                document.getElementById("bname").value = extraAddr;
                document.getElementById("bCode").value = data.bcode;
                document.getElementById("sido").value = data.sido;
                document.getElementById("sigungu").value = data.sigungu;
                
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddr").focus();
            }
        }).open();
    }

	
	
</script>


<section class="srcontianer" style="height:75vh;">
	<div class="container">
	<!-- 
		사이드 바
		#srMain 		: 메뉴 클릭		(앞 sr부분을 각 게시판에 맞게 수정하세요.)
		#srMySidenav 	: 사이드바 메뉴 	(앞 sr부분을 각 게시판에 맞게 수정하세요.)
		
		글어갈 때 필요한 것들
		1. 스크립트의 사이드바 function2개
		2. resource/studyroom/css/srmain.css 파일
		3. layout3에 css 링크넣기	
	-->
	
	<div id="srMain">
		<div class="srMenuBtn" onclick="srOpenNav()">☰ </div>
	</div>
	
	<aside class="main-sidebar" style = "	max-width: 140px;background: #222d32;padding-Top:15px;height: 1026px;">
	
	    <!-- sidebar: style can be found in sidebar.less -->
	    <section class="sidebar">
	
	      <!-- Sidebar user panel (optional) -->
	      <div class="user-panel">
	        <div class="pull-left image">
	          	
	        </div>
	        <div class="pull-left info">
	          <p>선생님</p>
	        </div>
	      </div>
	
	      <!-- /.search form -->
	
	      <!-- Sidebar Menu -->
	      <ul class="sidebar-menu" data-widget="tree">
	        <!-- Optionally, you can add icons to the links -->
	        <li><a href="#"><i class="fa fa-link"></i> <span>관리자룸</span></a></li>
			<li><a href="#"><i class="fa fa-link"></i> <span>장바구니</span></a></li>
			<li><a href="#"><i class="fa fa-link"></i> <span>예약현황</span></a></li>
			<li><a href="#"><i class="fa fa-link"></i> <span>예약취소</span></a></li>
	      </ul>
	      <!-- /.sidebar-menu -->
	    </section>
	    <!-- /.sidebar -->
	  </aside>
	
	<div id="srMySidenav" class="srMySidenav">
		<a>&nbsp;</a>		
		<a href="#">관리자룸</a>		
		<a href="#">장바구니</a>		
		<a href="#">예약현황</a>		
		<a href="#">예약취소</a>			
		<a href="javascript:void(0)" class="srClosebtn" onclick="srCloseNav()">X</a>
	</div>
	
	
	
	<div>
		<!-- 페이지 맨 윗단 소개글 -->
		<div class="col-md-12" style="padding: 20px 10px 10px 20px;">
			<!-- <img class="col-md-1" src="<%=cp%>/resource/studyroom/images/icons/idea.png" height="100%" width="100%" style="max-height: 100px; max-width: 100px;" alt="...">  -->
			<div  class="col-md-12">
				<h2 style="font-weight: 700; font-family: '맑은고딕';">언제나, 목표를 향한 공간을</h2>
				<p style="font-family: '맑은고딕';">목표를 향한 노력에는 그에 알맞는 공간이 필요합니다. 'StudyUp'은 당신이 공간을 찾도록 돕겠습니다.</p>
			</div>
		</div>

		<div class="col-xs-12 col-md-8">
			
			<!-- select -->
			<div class="srSelect">
				<div class="col-xs-4">
					<select class="form-control">
						<option>시/도</option>
						<option>서울</option>
						<option>인천</option>
						<option>경기</option>
						<option>강원</option>
					</select>
				</div>
				<div class="col-xs-4">
					<select class="form-control">
						<option>시군구</option>
						<option>구로구</option>
						<option>영등포구</option>
						<option>마포구</option>
						<option>중구</option>
					</select>
				</div>
				<div class="col-xs-4">
					<select class="form-control">
						<option>동/리</option>
						<option>서교동</option>
						<option>홍제동</option>
						<option>연남동</option>
					</select>
				</div>
			</div>
			<div class="col-xs-12" style="height:10px"></div>
			
			<!-- 페이지 글 목록 -->
			<div class="col-xs-12 col-sm-6 col-md-4">
				<div class="thumbnail">
					<!-- 사진 슬라이드 넘기는 곳 -->
					<div id="slidePic1" class="carousel slide" data-ride="carousel" data-interval="false">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#slidePic1" data-slide-to="0"></li>
							<li data-target="#slidePic1" data-slide-to="1"></li>
							<li data-target="#slidePic1" data-slide-to="2"></li>
						</ol>
						
						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic01.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic02.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic03.jpg" alt="..." height="100%" width="100%">
							</div>
						</div>
						
						<!-- Controls -->
						<a class="left carousel-control" href="#slidePic1" role="button" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="right carousel-control" href="#slidePic1" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
					
					<!-- 사진 관련 태그들 -->
					<div>
						<div style="min-height:150px;">
							<div style="padding: 20px 10px 0px 10px; font-family:'맑은고딕'; font-weight: 600; font-size: 14pt;">NHK</div>
							<div style="font-family:'맑은고딕'; font-weight: 600; font-size: 9pt; color : #cccccc;">평점 : ★★★☆☆</div>
							<div class="srPicTagContent">
								<div>어서오세요. NHK에! 이제부터 잘해드릴게요 아하하하하</div>
							</div>
							<div style="height:28px;">
								<button type="button" class="btn-srModal">More...</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4">
				<div class="thumbnail" style="text-align: center; cursor:pointer;">
					<div>	
						<div id="slidePic2" class="carousel slide" data-ride="carousel" data-interval="false">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#slidePic2" data-slide-to="0"></li>
								<li data-target="#slidePic2" data-slide-to="1"></li>
								<li data-target="#slidePic2" data-slide-to="2"></li>
							</ol>
							
							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic02.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic03.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic04.jpg" alt="..." height="100%" width="100%">
							</div>
						</div>
							<!-- Controls -->
							<a class="left carousel-control" href="#slidePic2" role="button" data-slide="prev">
								<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="right carousel-control" href="#slidePic2" role="button" data-slide="next">
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
					<div>
						<div style="min-height:150px;">
							<div style="padding: 20px 10px 0px 10px; font-family:'맑은고딕'; font-weight: 600; font-size: 14pt;">오성스터디카페</div>
							<div style="font-family:'맑은고딕'; font-weight: 600; font-size: 9pt; color : #cccccc;">평점 : ★★★★☆</div>
							<div class="srPicTagContent">
								<div>쾌적한 공간을 제공해드립니다!</div>
							</div>
							<div style="height:28px;">
								<button type="button" class="btn-srModal">More...</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4">
				<div class="thumbnail" style="text-align: center; cursor:pointer;">
					<div>	
						<div id="slidePic3" class="carousel slide" data-ride="carousel" data-interval="false">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#slidePic3" data-slide-to="0"></li>
								<li data-target="#slidePic3" data-slide-to="1"></li>
								<li data-target="#slidePic3" data-slide-to="2"></li>
							</ol>
							
							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic03.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic04.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic01.jpg" alt="..." height="100%" width="100%">
							</div>
						</div>
							<!-- Controls -->
							<a class="left carousel-control" href="#slidePic3" role="button" data-slide="prev">
								<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="right carousel-control" href="#slidePic3" role="button" data-slide="next">
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
					<div>
						<div style="min-height:150px;">
							<div style="padding: 20px 10px 0px 10px; font-family:'맑은고딕'; font-weight: 600; font-size: 14pt;">라쿠니라챠</div>
							<div style="font-family:'맑은고딕'; font-weight: 600; font-size: 9pt; color : #cccccc;">평점 : ★★☆☆☆</div>
							<div class="srPicTagContent">
								<div>너굴맨이 얼렸으니 조심하라구!!</div>
							</div>
							<div style="height:28px;">
								<button type="button" class="btn-srModal">More...</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4">
				<div class="thumbnail" style="text-align: center; cursor:pointer;">
					<div>	
						<div id="slidePic4" class="carousel slide" data-ride="carousel" data-interval="false">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#slidePic4" data-slide-to="0"></li>
								<li data-target="#slidePic4" data-slide-to="1"></li>
								<li data-target="#slidePic4" data-slide-to="2"></li>
							</ol>
							
							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic04.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic01.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic02.jpg" alt="..." height="100%" width="100%">
							</div>
						</div>
							<!-- Controls -->
							<a class="left carousel-control" href="#slidePic4" role="button" data-slide="prev">
								<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="right carousel-control" href="#slidePic4" role="button" data-slide="next">
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
					<div>
						<div style="min-height:150px;">
							<div style="padding: 20px 10px 0px 10px; font-family:'맑은고딕'; font-weight: 600; font-size: 14pt;">기가스터딥</div>
							<div style="font-family:'맑은고딕'; font-weight: 600; font-size: 9pt; color : #cccccc;">평점 : ★☆☆☆☆</div>
							<div class="srPicTagContent">
								<div>메가로는 모자라다!! 기가급으로 승부하자!</div>
							</div>
							<div style="height:28px;">
								<button type="button" class="btn-srModal">More...</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4">
				<div class="thumbnail" style="text-align: center; cursor:pointer;">
					<div>	
						<div id="slidePic5" class="carousel slide" data-ride="carousel" data-interval="false">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#slidePic5" data-slide-to="0"></li>
								<li data-target="#slidePic5" data-slide-to="1"></li>
								<li data-target="#slidePic5" data-slide-to="2"></li>
							</ol>
							
							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic01.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic02.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic03.jpg" alt="..." height="100%" width="100%">
							</div>
						</div>
							<!-- Controls -->
							<a class="left carousel-control" href="#slidePic5" role="button" data-slide="prev">
								<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="right carousel-control" href="#slidePic5" role="button" data-slide="next">
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
					<div>
						<div style="min-height:150px;">
							<div style="padding: 20px 10px 0px 10px; font-family:'맑은고딕'; font-weight: 600; font-size: 14pt;">이to스</div>
							<div style="font-family:'맑은고딕'; font-weight: 600; font-size: 9pt; color : #cccccc;">평점 : ★★★★☆</div>
							<div class="srPicTagContent">
								<div>옆집 메가보단 쌉니다.!옆집 메가보단 쌉니다.!옆집 메가보단 쌉니다.!옆집 메가보단 쌉니다.!옆집 메가보단 쌉니다.!옆집 메가보단 쌉니다.!옆집 메가보단 쌉니다.!옆집 메가보단 쌉니다.!</div>
							</div>
							<div style="height:28px;">
								<button type="button" class="btn-srModal">More...</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4">
				<div class="thumbnail" style="text-align: center; cursor:pointer;">
					<div>	
						<div id="slidePic6" class="carousel slide" data-ride="carousel" data-interval="false">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#slidePic6" data-slide-to="0"></li>
								<li data-target="#slidePic6" data-slide-to="1"></li>
								<li data-target="#slidePic6" data-slide-to="2"></li>
							</ol>
							
							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic02.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic03.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic04.jpg" alt="..." height="100%" width="100%">
							</div>
						</div>
							<!-- Controls -->
							<a class="left carousel-control" href="#slidePic6" role="button" data-slide="prev">
								<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="right carousel-control" href="#slidePic6" role="button" data-slide="next">
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>

					<div>
						<div style="min-height:150px;">
							<div style="padding: 20px 10px 0px 10px; font-family:'맑은고딕'; font-weight: 600; font-size: 14pt;">카페나라</div>
							<div style="font-family:'맑은고딕'; font-weight: 600; font-size: 9pt; color : #cccccc;">평점 : ★★★★★</div>
							<div class="srPicTagContent">
								<div>사랑스러운 동물들이 함께 하는 카페나라입니다.</div>
							</div>
							<div style="height:28px;">
								<button type="button" class="btn-srModal">More...</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		<!-- 지도를 넣을 장소 -->
		<div class="col-xs-12 col-sm-12 col-md-4">
			<div>
				<div id="srMap" class="srMap"></div>
				<button type="button" class="btn-srModalCreate">등록하기</button>
				<button type="button" class="viewMapSearch" onclick="viewMapSearch();">??</button>
			</div>
		</div>
	</div>

	<!-- 페이징 처리 -->
	<div class="col-xs-12 col-sm-12 col-md-12" align="center">
		<nav>		
			<ul class="pagination">
				<li class="disabled"><a href="#" aria-label="previous"><span aria-hidden="true">&lt;</span></a></li>
				<li class="active"><a href="#">1<span class="sr-only">(current)</span></a></li>
				<li class="disabled"><a href="#">2<span class="sr-only">(current)</span></a></li>
				<li class="disabled"><a href="#">3<span class="sr-only">(current)</span></a></li>
				<li class="disabled"><a href="#">4<span class="sr-only">(current)</span></a></li>
				<li class="disabled"><a href="#">5<span class="sr-only">(current)</span></a></li>
				<li class="disabled"><a href="#" aria-label="next"><span aria-hidden="true">&gt;</span></a></li>
			</ul>
		</nav>
	</div>
	
	
	
	<!-- The Modal -->
	<div class="modal modal-center" id="srModal">
		<div class="modal-dialog modal-center modal-eight">
			<div class="modal-content modal-eight">
				
			</div>
		</div>	
	</div>	
		
		
	
	</div>
</section>