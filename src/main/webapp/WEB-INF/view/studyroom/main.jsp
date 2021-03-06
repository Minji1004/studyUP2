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
	
	$(document).ready(function(){
		// 지도를 띄우는 코드 작성
		var container = document.getElementById('srMap'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new daum.maps.LatLng(33, 126.570667), //지도의 중심좌표.
				level: 4 									  //지도의 레벨(확대, 축소 정도)
			};
		
		var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// 각 주소별 마커를 생성하는 것
		$("input[name=roadAddrs]").each(function(){
			var roadAddr = $(this).val();
			var cafeNum = $(this).next().val();
			var cafeName = $(this).next().next().val();
			var setMarker = "";
			// 주소-좌표 변환 객체를 생성합니다.
			var geocoder = new daum.maps.services.Geocoder();
			geocoder.addressSearch( roadAddr , function(result, status){
				 // 정상적으로 검색이 완료됐으면 
			     if (status === daum.maps.services.Status.OK) {
					
			    	var coords = new daum.maps.LatLng(result[0].y, result[0].x);   
			    	
					// 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new daum.maps.Marker({ 
			        	map: map,
			        	position : coords 
			        	});
					
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new daum.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+cafeName+'</div>'
			        });
			        infowindow.open(map, marker);
			        
			        setMarker = "<input type='text' name='markers' value='"+coords+"'>";
			        $(this).parent().append(setMarker);

			        map.setCenter(coords);
			    } 
			});
		});
	});
	
	function close_pop(){
		$('#srModal').on('hidden.bs.modal', function(e)
		    { 
		        $(this).removeData();
		 }) ;
	};
	
// 시간 체크박스
	// 체크박스 건드리기
	$(document).on("change",".srTimeCB", function(){
		var $srTimeCB = $(this);
		var f = $(this).is(":checked");
				
		if(f){
			
			$(this).parent().css("background-color", "#0aa54b");
			$(this).parent().children("span").css("background-color","#daffd0");
			
			$(".srTimeButton").each(function(){
				var cnt=0;
				$(this).find(".srTimeCB").each(function(){
					if( $(this).is(":checked") && ! $(this).siblings("input[name='checkTimes']").val() ){
						var temp = $(this).siblings("input[name='timeValues']").val();
						var label  = "<input type='hidden' name='checkTimes' value='"+temp+"'"; 
							label += " style='width:25px; height: 15px; border: 1px solid #cccccc; font-size:4pt;'>";
						$(this).parent().append(label);
					} 
					if( $(this).is(":checked")) {
						cnt++;						
					}
					$(this).parent().parent().find("input[name='checkboxCounts']").val(cnt);
				});
			});
			
			
		} else {
			$(this).parent().css("background-color", "#c0c0c0");
			$(this).parent().children("span").css("background-color","#ffffff");
			
			$(".srTimeButton").each(function(){
				var cnt=0;
				$(this).find(".srTimeCB").each(function(){
					if( $(this).is(":checked")) {
						cnt++;						
					} else if(! $(this).is(":checked") ) {
						$(this).parent().find("input[name='checkTimes']").remove();
					}
					$(this).parent().parent().find("input[name='checkboxCounts']").val(cnt);
				});
			});
			
		}
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
			var url = "<%=cp%>/studyroom/modal/main";
			var cafeNum = $(this).parent().find(".cafeNum").val();
			var page = $(this).parent().find(".page").val();
			
			var query = "?cafeNum="+cafeNum+"&page="+page;
			var url = url + query;
			
			$('#srModal').modal({remote:url});
		});
	});
	
	$(function(){
		$(".btn-srModalCreate").click(function(){
			$('#srModal').modal({remote:'<%=cp%>/studyroom/modal/created'});
			/*
			$('#srModal .modal-content').load("<%=cp%>/studyroom/modal/created", function(){
				$('#srModal').modal("show");
			});
			*/
		});
	});
	
	// 동적으로 input박스 추가하기
	// 테이블 행 추가
	function insertRow(){
		
		var addRow = "<tr class='srTableLine' style='border'><td class='secondTableName' style='background-color: #76956020'>";
			addRow += "<input type='text' id='roomNames' name='roomNames' class='srInsertText' style='background-color: #76956001' placeholder='방이름'></td>";
			addRow += "<td class='secondTableContent'><input type='text' id='unitPrices' name='unitPrices' class='srInsertText' placeholder='예) 8000'></td>";
			addRow += "<td class='secondTableContent'><input type='text' id='minUsers' name='minUsers' class='srInsertText' placeholder='예) 4'></td>";
			addRow += "<td class='secondTableContent'><input type='text' id='maxUsers' name='maxUsers' class='srInsertText' placeholder='예) 8'></td>";
			addRow += "<td><button type='button' class='srRemoveRow' onclick='deleteRow();'>X</button></td></tr>";
		
		$('#srRoomInfoTable').append(addRow);
	};
	
	function deleteLastRow(){
		$('#srRoomInfoTable').children().children().last().remove();
	};
	
	$(document).on("click",".srRemoveRow", function(){
		$(this).parent().parent().remove();
	});
	
	// write.jsp 마지막 시간리스트 확인
	$(document).on("click","#srModalFullTime", function(){
		// 먼저 안의 리스트를 지운다.
		$("#srModalRoomTime").children().remove();
		var opentime = parseInt($("input[name=cafeOpen]").val());
		var closetime = parseInt($("input[name=cafeClose]").val());
		if ( opentime=="" || opentime==null || closetime=="" || closetime==null ) {
			alert("값을 입력하세요.");
			return;
		}
		$("input[name=roomNames]").each(function(){
			$divName = "<div class='roomNames'>"+$(this).val()+"</div>"
			$divTimeButton = $("<div class='srTimeButton'>");
			$("#srModalRoomTime").append($divName);
			$("#srModalRoomTime").append($divTimeButton);
			for ( var i = opentime ; i < closetime ; i++) {
				var label  = "<label class='srTimeColor'><input class='srTimeCB' type='checkbox' autocomplete='off'>";
					label += "<span>|"+i+":00|</span>";
					label += "<input type='hidden' name='timeValues' value='"+i+"'>";
					$(".srTimeButton").last().append(label);
			}
			var checkboxCounts = "<input type='hidden' id='checkboxCounts' name='checkboxCounts' style='width:25px; height: 15px; border: 1px solid #cccccc; font-size:4pt;'>"
			if(checkboxCounts=="") {
				checkboxCounts = 0;
			}  
			$(".srTimeButton").last().append(checkboxCounts);
		});
		
		$(".srTimeCB").hide();
	});
	
	// main.jsp 시간 리스트 체크
	$(document).on("click","#srModalMainTime", function(){
		// 먼저 안의 리스트를 지운다.
		$("#scrollThirdModal").children().remove();
		var opentime = parseInt($("input[name=srTimeButtonOpen]").val());
		var closetime = parseInt($("input[name=srTimeButtonClose]").val());
		$divSpace = "<div style='height:20px'>";
		
		$("input[name=modalRoomName]").each(function(){
			var roomName = $(this).val();
			var roomNum  = $(this).next().val();
			$divCol = "<div class='col-xs-12 col-sm-12 col-md-12'>";
			$divName = "<div class='srRoomName'>"+$(this).val()+"</div>";
			$divTime = "<div class='srTimeButton'>";
			
						
			$("#scrollThirdModal").append($divCol);
			$("#scrollThirdModal").children().last().append($divName);
			$("#scrollThirdModal").children().last().append($divTime);
			
			for ( var i = opentime ; i < closetime ; i++) {
				// if( $("input[name=roomTime"+roomNum+"]"))
				var label = "";
				$("input[name=roomTime"+roomNum+"]").each(function(){
					var time = $(this).val();
					if ( i == time ){
						label += "<label class='srTimeColor'><input class='srTimeCB' type='checkbox' autocomplete='off' checked='checked'>";
						return;
					}
				});
				if ( label == "") {
					label += "<label class='srTimeColor'><input class='srTimeCB' type='checkbox' autocomplete='off'>";
				}
				
				label += "<span>|"+i+":00|</span>";
				label += "<input type='hidden' name='timeValues' value='"+i+"'>";
				$(".srTimeButton").last().append(label);
			}
			var roomNums = "<input type='hidden' name='roomNums' value='"+roomNum+"'>";
			var checkboxCounts = "<input type='hidden' id='checkboxCounts' name='checkboxCounts' style='width:25px; height: 15px; border: 1px solid #cccccc; font-size:4pt;'>"
			if(checkboxCounts=="") {
				checkboxCounts = 0;
			}
			$(".srTimeButton").last().append(roomNums);
			$(".srTimeButton").last().append(checkboxCounts);
		});
		
		$("#scrollThirdModal").children().last().append($divSpace);
		
		checked();
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
                document.getElementById("buildName").value = extraAddr;
                document.getElementById("bname").value = data.bname;
                document.getElementById("bCode").value = data.bcode;
                document.getElementById("sido").value = data.sido;
                document.getElementById("sigungu").value = data.sigungu;
                
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddr").focus();
            }
        }).open();
    }

	
	
</script>


<section class="studyroomSection" style="height:75vh; width:100%;">
	<div class="srContainer" style="width:100%;">

	<div>
		<!-- 페이지 맨 윗단 소개글 -->
		<div class="col-md-12" style="padding: 20px 10px 10px 20px;">
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
			<c:forEach var="dto" items="${list}">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="thumbnail">
						<!-- 사진 슬라이드 넘기는 곳 -->
						<div id="slidePic${dto.cafeNum}" class="carousel slide" data-ride="carousel" data-interval="false">
							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<c:if test="${not empty dto.fileList}">
									${dto.fileList}
								</c:if>
								<c:if test="${empty dto.fileList}">
									<div class="item active">
										<img class="srPic" src="<%=cp%>/resource/studyroom/images/coming_soon.jpg" alt="..." height="100%" width="100%">
									</div>
								</c:if>
							</div>
							<c:if test="${not empty dto.fileList}">
								<!-- Controls -->
								<a class="left carousel-control" href="#slidePic${dto.cafeNum}" role="button" data-slide="prev">
									<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
									<span class="sr-only">Previous</span>
								</a>
								<a class="right carousel-control" href="#slidePic${dto.cafeNum}" role="button" data-slide="next">
									<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
									<span class="sr-only">Next</span>
								</a>
							</c:if>
						</div>
						
						<!-- 사진 관련 태그들 -->
						<div>
							<div style="min-height:150px;">
								<div style="padding: 20px 10px 0px 10px; font-family:'맑은고딕'; font-weight: 600; font-size: 14pt;">${dto.cafeName}</div>
								<div style="font-family:'맑은고딕'; font-weight: 600; font-size: 9pt; color : #cccccc;">평점 : ★★★☆☆</div>
								<div class="srPicTagContent">
									<div>${dto.cafeIntro}</div>
								</div>
								<div style="height:28px;">
									<button type="button" class="btn-srModal">More...</button>
									<input type="hidden" class="cafeNum" value="${dto.cafeNum}">
									<input type="hidden" class="page" value="${page}">
								</div>
							</div>
						</div>
					</div>
					<input type="hidden" name="roadAddrs" value="${dto.roadAddr}">
					<input type="hidden" name="cafeNums" value="${dto.cafeNum}">
					<input type="hidden" name="cafeNames" value="${dto.cafeName}">
				</div>
			</c:forEach>
			
		</div>
		<!-- 지도를 넣을 장소 -->
		<div class="col-xs-12 col-sm-12 col-md-4">
			<div>
				<div id="srMap" class="srMap"></div>
				<button type="button" class="btn-srModalCreate">등록하기</button>
			</div>
		</div>
	</div>

	<!-- 페이징 처리 -->
	<div class="col-xs-12 col-sm-12 col-md-12" align="center">
		${paging}
	</div>
	

	
		
		
	
	</div>
</section>