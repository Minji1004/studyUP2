<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/fullcalendar/fullcalendar.min.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/fullcalendar/fullcalendar.print.min.css" media='print' type="text/css">

<style type="text/css">
.hbtn {
	font-family: "Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
    background-image:none;
    color:#fff;
    line-height: 1.5;
    text-align: center;
    padding: 5px 10px;
    font-size: 12px;
    text-decoration: none;
    position: relative;
    float: left;
    border: 1px solid #ccc;    
}
.hbtn:hover, .hbtn:active {
    background-image:none;
    color:#fff;
    text-decoration: none;
}

.hbtn:focus {
    background-image:none;
    color:#fff;
    text-decoration: none;
}

.hbtn-bottom {
	border-bottom:3px solid #3DB7CC;
	font-weight: 900;
}

#calendar {
	margin: 20px auto 10px;
}

#schLoading {
	display: none;
	position: absolute;
	top: 10px;
	right: 10px;
}

.fc-center h2{
	display: block;
	font-family: "Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
	font-size: 1.5em;
	font-weight: bold;
	/* -webkit-margin-after: 0.83em; */
	-webkit-margin-start: 0px;
	-webkit-margin-end: 0px;
}

.fc-content .fc-title{
	font-size: 9pt;
}

/* 일정분류버튼 css */
#classifyGroup .btn, #classifyGroup .focus.btn, #classifyGroup .btn:focus, #classifyGroup .btn:hover {
    color: #fff; background-image:none;
}
.btn-blue {
    background-color:blue; border-color:blue;
}
.btn-blue:hover, .btn-blue:focus {
    background-color:blue; border-color:blue;
}
.btn-black {
    background-color:black; border-color:black;
}
.btn-black:hover, .btn-black:focus {
    background-color:black; border-color:black;
}
.btn-green {
    background-color:green; border-color:green;
}
.btn-green:hover, .btn-green:focus {
    background-color:green; border-color:green;
}
.btn-red {
    background-color:red; border-color:red;
}
.btn-red:hover, .btn-red:focus {
    background-color:red; border-color:red;
}
</style>

<script type="text/javascript" src="<%=cp%>/resource/fullcalendar/lib/moment.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/fullcalendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/fullcalendar/locale-all.js"></script>

<script type="text/javascript">
//-------------------------------------------------------
//달력
var calendar=null;
var group="all";
var tempContent;

//start:2016-01-01 => 2016-01-01 일정
//start:2016-01-01, end:2016-01-02 => 2016-01-01 일정
//start:2016-01-01, end:2016-01-03 => 2016-01-01 ~ 2016-01-02 일정
$(function() {
		calendar = $('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay,listMonth'
			},
			locale: 'ko',
			selectable: true,
			selectHelper: true,
			select: function(start, end, allDay) {
				// start, end : moment 객체
				// 일정하나를 선택하는 경우 종일일정인경우 end는 start 보다 1일이 크다.
				//  캘런더에 start<=일정날짜또는시간<end 까지 표시함
				
				// 달력의 빈공간을 클릭하거나 선택할 경우 입력 화면
				insertForm(start, end);
				
			},
			eventClick: function(calEvent, jsEvent, view) {
				// 일정 제목을 선택할 경우 상세 일정
				articleForm(calEvent);
			},
			editable: true,
			eventLimit: true,
			events: function(start, end, timezone, callback){
				// 캘린더가 처음 실행되거나 월이 변경되면
				var startDay=start.format("YYYY-MM-DD");
				var endDay=end.format("YYYY-MM-DD");
		        
				var url="<%=cp%>/study/sch/month";
                var query="start="+startDay+"&end="+endDay+"&group="+group+"&tmp="+new Date().getTime();

				$.ajax({
				    url: url,
				    data: query,
				    dataType: 'json',
				    success: function(data, text, request) {
				    	var events = eval(data.list);
				        callback(events);
				    },
				    beforeSend : function(jqXHR) {
				        jqXHR.setRequestHeader("AJAX", true);
				    },
				    error:function(jqXHR) {
				    	if(jqXHR.status==403) {
				    		location.href="<%=cp%>/member/login";
				    		return;
				    	}
				    	console.log(jqXHR.responseText);
				    }
				});
			},
			eventDrop: function(event, dayDelta, minuteDelta, allDay, revertFunc, jsEvent, ui, view) {
				// 일정을 드래그 한 경우
				updateDrag(event);
			},
			eventResize: function(event, dayDelta, minuteDelta, allDay, revertFunc) {
				// 일정의 크기를 변경 한 경우
				updateDrag(event);
			},
			loading: function(bool) {
				$('#schLoading').toggle(bool);
			}
		});
});

// 분류별 검색
function classification(kind, idx) {
	$("#calendarHeader a").each(function(){
		$(this).removeClass("hbtn-bottom");
		// $(this).css("opacity","0.8");
	});
	$("#calendarHeader a:eq("+idx+")").addClass("hbtn-bottom");
	// $("#calendarHeader a:eq("+idx+")").css("opacity","1.0");
	
	group=kind;
	calendar.fullCalendar('refetchEvents');
}

// -------------------------------------------
// -- 상세 일정 보기
function articleForm(calEvent) {
	var str;
	
	var num=calEvent.id;
	var title=calEvent.title;
	var userName=calEvent.userName;
	
	var color=calEvent.color;
	var classify="";
	if(color=="blue") classify="개인일정";
	else if(color=="black") classify="가족일정";
	else if(color=="green") classify="회사일정";
	else if(color=="red") classify="부서일정";
	
	var allDay=calEvent.allDay;
	var startDay="", startTime="", sday="";
	var endDay="", endTime="", eday="";
	var strDay;
	startDay=calEvent.start.format("YYYY-MM-DD");
	if(calEvent.start.hasTime()) {
	    startTime=calEvent.start.format("HH:mm");
	    if(calEvent.end!=null && calEvent.start.format()!=calEvent.end.format()) {
			endDay=calEvent.end.format("YYYY-MM-DD");
			endTime=calEvent.end.format("HH:mm");
		}	    
	} else {
		if(calEvent.end!=null && calEvent.start.format()!=calEvent.end.add("-1", "days").format()) {
			endDay=calEvent.end.format("YYYY-MM-DD");
		}
		if(calEvent.end!=null)
		    calEvent.end.add("1", "days");
	}
	if(allDay==false) {
		sday=startDay+" "+ startTime;
		eday=endDay+" "+ endTime;
		strDay="시간일정";
	}else if(allDay==false) {
		sday=startDay+" "+ startTime;
		eday=endDay;
		endTime="";
		strDay="시간일정";
	}else {
		sday=startDay;
		eday=endDay;
		startTime="";
		endTime="";
		strDay="하루종일";
	}
	
	var content=calEvent.content;
	if(! content) content="";
	tempContent=content;
	
	$('#scheduleModal .modal-body').load("<%=cp%>/study/sch/articleForm", function() {
		$("#schTitle").html(title);
		$("#schUserName").html(userName);
		$("#schClassify").html(classify);
		$("#schAllDay").html(strDay);
		$("#schStartDay").html(sday);
		$("#schEndDay").html(eday);
		$("#schContent").html(content);
		
		str="<button type='button' class='btn btn-primary' style='margin-right: 5px;' onclick='updateForm(\""+num+"\", \""+title+"\", \""+allDay+"\", \""+startDay+"\",\""+endDay+"\",\""+startTime+"\",\""+endTime+"\",\""+color+"\");'> 수정 <span class='glyphicon glyphicon-ok'></span></button>";
		str+="<button type='button' class='btn btn-danger' style='margin-right: 5px;' onclick='deleteOk(\""+num+"\");'> 삭제 <span class='glyphicon glyphicon-remove'></span></button>";
		str+="<button type='button' class='btn btn-default' data-dismiss='modal' style='margin-left: 0px;'> 닫기 </button>";
		$("#schFooter").html(str);
		
	    $('#scheduleModal .modal-title').html('상세 일정');
		$('#scheduleModal').modal('show');
	});	
}

// -------------------------------------------
// -- 입력 및 수정 대화상자
// 일정 등록 폼
function insertForm(start, end) {
	$('#scheduleModal .modal-body').load("<%=cp%>/study/sch/inputForm", function() {
		var startDay="", startTime="";
		var endDay="", endTime="";
		
		startDay=start.format("YYYY-MM-DD");
		startTime=start.format("HH:mm");

		$("input[name='startDay']").val(startDay);

		if(start.hasTime()) {
			// 시간 일정인 경우
			$("#allDayChk").prop("checked", false);
			$("#allDayHidden").prop("disabled", false);
			
			$("#startTime").show();
			$("#endTime").show();
            
			$("input[name='startTime']").val(startTime);
			if(start.format()!=end.format()) {
				endDay=end.format("YYYY-MM-DD");
				endTime=end.format("HH:mm");
			
				$("input[name='endDay']").val(endDay);
				$("input[name='endTime']").val(endTime);
			}			
		} else {
			// 하루종일 일정인 경우
			$("#allDayChk").prop("checked", true);
			$("#allDayHidden").prop("disabled", true);
			
			$("input[name='startTime']").val("");
			$("input[name='endTime']").val("");
			$("#startTime").hide();
			$("#endTime").hide();
			
			if(start.format()!=end.add("-1", "days").format()) {
				endDay=end.format("YYYY-MM-DD");
				$("input[name='endDay']").val(endDay);
			}
			end.add("1", "days");
		}
		
	    $('#scheduleModal .modal-title').html('일정 추가');
		$('#scheduleModal').modal('show');
		
		$("input[name='title']").focus();
		
		calendar.fullCalendar('unselect');
	});
}

// 새로운 일정 등록
function insertOk() {
	if(! validCheck())
		return;
	
	var query=$("form[name=schForm]").serialize();
	var url="<%=cp%>/study/sch/created";
    
     $.ajax({
        type:"post"
        ,url:url
        ,data:query
        ,dataType:"json"
        ,success:function(data) {
	      	   var state=data.state;
	      	   if(state=="true") {
	      		   group="all";
	      		   calendar.fullCalendar('refetchEvents');

	      		    $("#calendarHeader a").each(function(){
	      				$(this).removeClass("hbtn-bottom");
	      			});
	      			$("#calendarHeader a:eq(0)").addClass("hbtn-bottom");
	          }
        }
     	,beforeSend : function(jqXHR) {
	          jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	  if(jqXHR.status==403) {
	    		  location.href="<%=cp%>/member/login";
	    	      return;
	    	  }
	    	  console.log(jqXHR.responseText);
	    }
    });
     
     $('#scheduleModal').modal('hide');
}

function validCheck() {
	var title=$.trim($("input[name='title']").val());
	var color=$.trim($("select[name='color']").val());
	var allDay=$("#allDayChk:checked").val();
	var startDay=$.trim($("input[name='startDay']").val());
	var endDay=$.trim($("input[name='endDay']").val());
	var startTime=$.trim($("input[name='startTime']").val());
	var endTime=$.trim($("input[name='endTime']").val());
	var content=$.trim($("textarea[name='content']").val());
	
	if(! title) {
		alert("제목을 입력 하세요 !!!");
		$("input[name='title']").focus();
		return false;
	}
	
	 if(! /[12][0-9]{3}-[0-9]{2}-[0-9]{2}/.test(startDay)){
			alert("날짜를 정확히 입력 하세요 [yyyy-mm-dd] !!! ");
			$("input[name='startDay']").focus();
			return false;
	 }
	 if(endDay!="" && ! /[12][0-9]{3}-[0-9]{2}-[0-9]{2}/.test(endDay)){
			alert("날짜를 정확히 입력 하세요 [yyyy-mm-dd] !!! ");
			$("input[name='endDay']").focus();
			return false;
	 }
	
	 if(startTime!="" && ! /[0-2][0-9]:[0-5][0-9]/.test(startTime)){
			alert("시간을 정확히 입력 하세요 [hh:mm] !!! ");
			$("input[name='startTime']").focus();
			return false;
	 }
	 if(allDay==undefined && startTime=="") {
		    alert("시간을 정확히 입력 하세요 [hh:mm] !!! ");
			$("input[name='startTime']").focus();
			return false;
	 }
	 
	 if(endTime!="" && ! /[0-2][0-9]:[0-5][0-9]/.test(endTime)){
			alert("시간을 정확히 입력 하세요 [hh:mm] !!! ");
			$("input[name='endTime']").focus();
			return false;
	 }
	 
	 if(allDay==undefined && endDay!="" && endTime=="") {
		 alert("시간을 정확히 입력 하세요 [hh:mm] !!! ");
			$("input[name='endTime']").focus();
			return false;
	 }

	// 종료 날짜는 종일일정인 경우 하루가 더 커야한다.
	// 캘런더에 start<=일정날짜또는시간<end 까지 표시함
    var end;
    if(endDay!="") {
    	if(endTime!="") {
        	end=moment(endDay+"T"+endTime);
			endDay=end.format("YYYY-MM-DD");
			endTime=end.format("HH:mm");
    	} else {
        	end=moment(endDay);
        	end=end.add("1", "days");
			endDay=end.format("YYYY-MM-DD");
    	}
    	$("input[name='endDay']").val(endDay);
    }
    
	if(allDay=="true") {
		$("input[name='startTime']").val("");
		$("input[name='endTime']").val("");
		$("#allDayHidden").prop("disabled", true);
	} else {
		$("input[name='endTime']").val(endTime);
		$("#allDayHidden").prop("disabled", false);
	}
	
	return true;
}

// -------------------------------------------------
// 수정 폼
function updateForm(num, title, allDay, startDay, endDay, startTime, endTime, color) {
	$('#scheduleModal .modal-body').load("<%=cp%>/study/sch/inputForm", function() {
		$("input[name='title']").val(title);
		classifyChange(color);
		// $("input[name='color']").val(color);
		$("input[name='startDay']").val(startDay);
		$("input[name='endDay']").val(endDay);
		$("input[name='startTime']").val(startTime);
		$("input[name='endTime']").val(endTime);
		$("textarea[name='content']").val(tempContent);
		
		if(allDay=="true") {
			$("#allDayChk").prop('checked', true);
			$("#allDayHidden").prop("disabled", true);
			
			$("#startTime").hide();
			$("#endTime").hide();
		} else {
			$("#allDayChk").prop('checked', false);
			$("#allDayHidden").prop("disabled", false);
			
			$("#startTime").show();
			$("#endTime").show();
		}
		
		str="<button type='button' class='btn btn-primary' style='margin-right: 5px;' onclick='updateOk("+num+");'> 확인 <span class='glyphicon glyphicon-ok'></span></button>";
		str+="<button type='button' class='btn btn-default' data-dismiss='modal' style='margin-left: 0px;'> 닫기 </button>";
		$("#schFooter").html(str);
		
	    $('#scheduleModal .modal-title').html('일정 수정');
		$('#scheduleModal').modal('show');
		
		$("input[name='title']").focus();
	});
}

// 수정 완료
function updateOk(num) {
	if(! validCheck())
		return;
	
	$("form[name=schForm] input[name=num]").val(num);
	var query=$("form[name=schForm]").serialize();
	var url="<%=cp%>/study/sch/update";
       
    $.ajax({
         type:"post"
         ,url:url
         ,data:query
         ,dataType:"json"
         ,success:function(data) {
    		 group="all";
        	 calendar.fullCalendar('refetchEvents', num);
        	 
   			$("#calendarHeader a").each(function(){
  				$(this).removeClass("hbtn-bottom");
  			});
  			$("#calendarHeader a:eq(0)").addClass("hbtn-bottom");
         }
         ,beforeSend : function(jqXHR) {
             jqXHR.setRequestHeader("AJAX", true);
         }
         ,error:function(jqXHR) {
  	         if(jqXHR.status==403) {
  		         location.href="<%=cp%>/member/login";
  	             return;
  	         }
  	         console.log(jqXHR.responseText);
        }
   });
    
    $('#scheduleModal').modal('hide');
}

// -------------------------------------------------------
// 일정을 드래그하거나 일정의 크기를 변경할 때 일정 수정
function updateDrag(e) {
	var num=e.id;
	var title=e.title;
	var color=e.color;
	var allDay=e.allDay;
	var startDay="", startTime="";
	var endDay="", endTime="";
	
	startDay=e.start.format("YYYY-MM-DD");
	if(e.start.hasTime()) {
		// 시간 일정인 경우
		startTime=e.start.format("HH:mm");
		
		if(e.end) {
		    endDay=e.end.format("YYYY-MM-DD");
		    endTime=e.end.format("HH:mm");
		    if(e.start.format()==e.end.format()) {
			    endDay="";
			    endTime="";
		    }
		}
	} else {
		// 하루종일 일정인 경우
		if(e.end) {
			endDay=e.end.format("YYYY-MM-DD");
			if(e.start.format()==e.end.add("-1", "days").format()) {
				endDay="";
			}
			e.end.add("1", "days")
		}
	}
	
	if(startTime=="" && endTime=="") {
		allDay="true";
	} else {
		allDay="false";
	}
	
	var content=e.content;
	if(!content)
		content="";

	var query="num="+num
           +"&title="+title
           +"&color="+color
           +"&allDay="+allDay
           +"&startDay="+startDay
           +"&endDay="+endDay
           +"&startTime="+startTime
           +"&endTime="+endTime
           +"&content="+content;
	
	var url="<%=cp%>/study/sch/update";
	$.ajax({
         type:"post"
         ,url:url
		 ,data:query
		 ,dataType:"json"
		 ,success:function(data) {
         }
	     ,beforeSend : function(jqXHR) {
             jqXHR.setRequestHeader("AJAX", true);
         }
         ,error:function(jqXHR) {
  	         if(jqXHR.status==403) {
  		         location.href="<%=cp%>/member/login";
  	             return;
  	         }
  	         console.log(jqXHR.responseText);
        }
	});
}

// -------------------------------------------
function deleteOk(num) {
	if(confirm("삭제 하시겠습니까 ?")) {
		
		var url="<%=cp%>/study/sch/delete";
		var query="num="+num;
		$.ajax({
	         type:"post"
	         ,url:url
			 ,data:query
			 ,dataType:"json"
			 ,success:function(data) {
				 calendar.fullCalendar('removeEvents', num);
	         }
		     ,beforeSend : function(jqXHR) {
	             jqXHR.setRequestHeader("AJAX", true);
	         }
	         ,error:function(jqXHR) {
	  	         if(jqXHR.status==403) {
	  		         location.href="<%=cp%>/member/login";
	  	             return;
	  	         }
	  	         console.log(jqXHR.responseText);
	        }
		});
	}
	
    $('#scheduleModal').modal('hide');
}

// -------------------------------------------------
// 입력 및 수정 화면에서 일정 분류를 선택 한 경우
function classifyChange(classify) {
	$("#btnTitle").removeClass("btn-blue")
	                     .removeClass("btn-black")
	                     .removeClass("btn-green")
	                     .removeClass("btn-red");
	$("#btnDropdown").removeClass("btn-blue")
	                              .removeClass("btn-black")
	                              .removeClass("btn-green")
	                              .removeClass("btn-red");
	
	if(classify=="blue") {
		$("#btnTitle").html("개인일정")
		$("#btnTitle").addClass("btn-blue");
		$("#btnDropdown").addClass("btn-blue");
	} else if(classify=="black") {
		$("#btnTitle").html("가족일정")
		$("#btnTitle").addClass("btn-black");
		$("#btnDropdown").addClass("btn-black");
	} else if(classify=="green") {
		$("#btnTitle").html("회사일정")
		$("#btnTitle").addClass("btn-green");
		$("#btnDropdown").addClass("btn-green");
	} else if(classify=="red") {
		$("#btnTitle").html("부서일정")
		$("#btnTitle").addClass("btn-red");
		$("#btnDropdown").addClass("btn-red");
	}
	$("#scheduleModal input[name='color']").val(classify);
}

// 종일일정에 따른 시간 입력폼 보이기/숨기기
$(function(){
	$(document).on("click","#allDayChk",function(){
		var allDay=$("#allDayChk:checked").val();
		if(allDay=='true') {
			$("#startTime").hide();
			$("#endTime").hide();
			$("#allDayHidden").prop("disabled", false);
		} else {
			$("#startTime").show();
            $("#endTime").show();
			$("#allDayHidden").prop("disabled", true);
		}
	});
});
</script>
<section class="content container-fluid">
<div class="bodyFrame col-md-offset-2" style="width: 50%;">
    <div class="body-title">
          <h3><i class="fa fa-fw fa-calendar"></i> 일정관리 </h3>
    </div>
    
    <div id="calendarHeader" style="height: 35px; line-height: 35px;">
        <div style="text-align: right;">
             <div class="btn-group" role="group" aria-label="header">
                 <a class="hbtn hbtn-bottom" style="background: white ; color:#2f3741;"
                       href="javascript:classification('all', 0);">전체일정</a>
                 <a class="hbtn" style="background: blue;"
                       href="javascript:classification('blue', 1);">개인일정</a>
                 <a class="hbtn" style="background-color:black;"
                       href="javascript:classification('black', 2);">가족일정</a>
                 <a class="hbtn" style="background: green;"
                       href="javascript:classification('green', 3);">회사일정</a>
                 <a class="hbtn" style="background: red;"
                       href="javascript:classification('red', 4);">부서일정</a>
             </div>      
        </div>
    </div>
    
    <div id="calendar"></div>
	<div id='schLoading'>loading...</div>
</div>
</section>


<div class="modal fade" id="scheduleModal" tabindex="-1" role="dialog" aria-labelledby="scheduleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="scheduleModalLabel" style="font-family: 나눔고딕, 맑은 고딕, sans-serif; font-weight: bold;">일정</h4>
      </div>
      <div class="modal-body"></div>
    </div>
  </div>
</div>
