<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style type="text/css">
.right-callout {
	border-left: none; 
	border-right: 5px solid #eee; 
	text-align: right;
	background-color: #E0ECF8;
	border-color: #81BEF7;
}

.chatting-msg-more {
	float:right; 
	cursor: pointer; 
	margin-right: 10px; 
	margin-bottom: 10px;
	padding-top: 25px;
}

</style>

<script src="http://localhost:3001/socket.io/socket.io.js"></script>
<script type="text/javascript">
function convertStringToDate(str) {
	// yyyy-mm-dd hh:mi:ss
    
    return new Date(str.substr(0,4), str.substr(5,2)-1, str.substr(8,2), str.substr(11,2), str.substr(14,2), str.substr(17,2));
}

function convertDateTimeToString(date) {
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    m = (m>9 ? '' : '0') + m;
    var d = date.getDate();
    d = (d>9 ? '' : '0') + d;

    var hh = date.getHours();
    hh = (hh>9 ? '' : '0') + hh;
    var mi=date.getMinutes();
    mi = (mi>9 ? '' : '0') + mi;
    var ss=date.getSeconds();
    ss = (ss>9 ? '' : '0') + ss;
    
    return y + '-' + m + '-' + d +' ' + hh + ':'+mi+":"+ss;
}

function convertDateToString(date) {
	var week = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    var w = week[date.getDay()];
    
    return y + '년 ' + m + '월 ' + d +"일 " + w;
}

function yyyymmdd(date) {
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    
    return [y,
        (m>9 ? '' : '0') + m,
        (d>9 ? '' : '0') + d
       ].join('');
}

function convertTimeToString(date) {
    var h = date.getHours();
    var m=date.getMinutes();
    var ampm='오전';
    if (h>=12) ampm='오후';
    if (h>12) h=h-12;
    if (h==0) h=12;
    
    return ampm+" "+h+":"+m;
}

function compareToDate(date1, date2) {
	var d1, d2;
	
	if (typeof date1 === 'object' && date1 instanceof Date && typeof date2 === 'object' && date2 instanceof Date) {
		d1 = new Date(date1.getFullYear(), date1.getMonth(), date1.getDate());
		d2 = new Date(date2.getFullYear(), date2.getMonth(), date2.getDate());
	} else {
		// yyyymmdd
		d1 = new Date(date1.substr(0,4), date1.substr(4,2)-1, date1.substr(6,2));
		d2 = new Date(date2.substr(0,4), date2.substr(4,2)-1, date2.substr(6,2));
	}
	
	return d1.getTime() - d2.getTime();
}

$(function(){
	var uid = "${sessionScope.member.userId}";
	var nickName = "${sessionScope.member.userName}";
    if(! uid) {
    	location.href="<%=cp%>/member/login";
    	return;
    }

	var first_date = null; // 화면에 출력된 메시지의 최초의 날짜 
	var last_date = null;  // 화면에 출력된 메시지의 마지막 날짜 
	var room = null;
	
	// 채팅 서버에 접속
	var sock = io('http://localhost:3001/chat');
	
	// 채팅방 입장
	$(".chatting-room-btn").on("click", function(){
		room = $(this).attr("data-room"); // 회원의 아이디로 처리할 시 카톡처럼 가능
		var otherId = $(this).attr("data-userId");
		var roomSub = room.split("@", 1);
		
		if(uid == otherId) {
			room = roomSub[0];
		} else {
			otherId = uid > otherId ? uid : otherId;
			
			var uidSub = "Ostudy" + "${studyNum}" + otherId;
			uidSub = uidSub.split("@", 1);
			
			room = uidSub[0]; 
		}
		
		first_date = last_date = new Date();
		
		var roomName = $(this).text();
		$(".chatting-content-list").empty();
		$(".chatting-room-name").html("["+roomName+"]");
		
		$('#chatting').css('display', 'block');
		// $('#chatting').appendChild($(".direct-chat-success"));
		
		// 오늘 날짜의 룸 채팅 문자열 리스트 요청
		sock.emit("chat-msg-list", {
			room : room,
			writeDate : convertDateTimeToString(last_date)
		});
	});
	
	// 채팅 메시지 보내기
	$("#chatMsg").on("keydown",function(event) {
    	// 엔터키가 눌린 경우, 서버로 메시지를 전송한다.
        if (event.keyCode == 13) {
        	var message = $("#chatMsg").val().trim();
        	
        	if(! message) {
        		return false;
        	}
        	
        	var msg = {
        		room:room,	
        		writeDate:convertDateTimeToString(new Date()),	
        		userId:uid,
        		nickName:nickName,
        		message:message,	
        	};
        	
			sock.emit("chat-msg", msg);
        	
        	$("#chatMsg").val("");
        	$("#chatMsg").focus();
        }
    });
	
	// 더보기 보내기
	$(".chatting-msg-more").click(function(){
		first_date.setDate(first_date.getDate()-1); // 자동으로 월 바뀜
		
		// 이전 날짜의 룸 채팅 문자열 리스트 요청
		sock.emit("chat-msg-list", {
			room : room,
			writeDate : convertDateTimeToString(first_date)
		});
		
	});
	
	// 채팅 문자열이 전송된 경우
	sock.on("chat-msg", function(data) {
		writeToScreen(data);
	});	
	
	function writeToScreen(data) {
		var room = data.room;
		var writeDate = convertStringToDate(data.writeDate);
		var userId = data.userId;
		var nickName = data.nickName;
		var message = data.message;

		var out;
		var dispDate = convertDateToString(writeDate);
		var dispTime = convertTimeToString(writeDate);
		var strDate = yyyymmdd(writeDate);
    	var cls = "date-"+strDate;

		if(! $(".chatting-content-list").children("div").hasClass(cls)) {
			// 날짜 출력
			out =  "<div class='"+cls+"'>";
	    	out += " <div style='clear: both; margin: 7px 5px 3px;'>";
		    out += "   <div style='float: left; font-size: 10px; padding-right: 5px;'><i class='far fa-calendar'></i> "+dispDate+"</div>";
		    out += "   <hr>";
		    out += "  </div>";
		    out += "</div>";
		    
		    if(compareToDate(strDate, yyyymmdd(last_date)) >=0 ) {
		    	last_date = writeDate;
		    	$(".chatting-content-list").append(out);
		    } else {
		    	$(".chatting-content-list").prepend(out);
		    }
		}
		
		// 메시지 출력 (우측, 좌측)
		if(uid==userId) {
        	out = "<div style='margin-left:50%; width: 50%;'>"
			out +=  "<div class='direct-chat-msg right'><div class='direct-chat-info clearfix'>";
			out += " <span class='direct-chat-name pull-right'>"+nickName+"</span>"
			out += " <span class='direct-chat-timestamp pull-left'>"+dispTime+"</span></div>";
			out += " <img class='direct-chat-img' alt='Message User Image' src='<%=cp%>/resource/study/images/in-love.png'>";
			out += "  <div class='direct-chat-text'>"+message+"</div>";
			out += " <div style='clear:both; height:3px;'></div>";
			out += "</div></div>";
			
			
		} else {			
			out = "<div style='width: 50%;'>"
			out +=  "<div class='direct-chat-msg'><div class='direct-chat-info clearfix'>";
			out += " <span class='direct-chat-name pull-left'>"+nickName+"</span>"
			out += " <span class='direct-chat-timestamp pull-right'>"+dispTime+"</span></div>";
			out += " <img class='direct-chat-img' alt='Message User Image' src='<%=cp%>/resource/study/images/happy.png'>";
			out += "  <div class='direct-chat-text'>"+message+"</div>";
			out += " <div style='clear:both; height:3px;'></div>";
			out += "</div></div>";			
		}
		
		$("."+cls).append(out);
		$('.chatting-content-list').scrollTop($('.chatting-content-list').prop('scrollHeight'));
	}
	
});
</script>


<!-- Main content -->
<section class="content container-fluid">
	<div class="row">
		<div class="col-md-4 col-md-offset-2">
          <!-- DIRECT CHAT SUCCESS -->
          <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">Member</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body"  style="height: 900px;">
            	<div class="callout chatting-room-btn" data-userId="${sessionScope.member.userId}" data-room="study${studyNum}${sessionScope.member.userId}">
	                <h4>${sessionScope.member.userName}</h4>
	             </div>
	             
	             <c:forEach var="dto" items="${list}">
	             	<c:if test="${dto.userId ne sessionScope.member.userId}">	             	
			             <div class="callout right-callout chatting-room-btn" data-userId="${dto.userId}" data-room="study${studyNum}${dto.userId}">
			             	<h4>${dto.nickname}</h4>
			             </div>	              	
	             	</c:if>		             
	             </c:forEach>
	             
              
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
            </div>
            <!-- /.box-footer-->
          </div>
        </div>	
		
		
	
		<div class="col-md-4" id="chatting" style="display: none;">
          <!-- DIRECT CHAT SUCCESS -->
          <div class="box box-success direct-chat direct-chat-success" style="height: 90%">
            <div class="box-header with-border chatting-header">
              <h3 class="box-title"><span class="chatting-room-name">Direct Chat</span></h3>
			  
            </div>
            <!-- /.box-header -->
            <div class="box-body" style="height: 920px; min-height: 920px;">
				<span class="chatting-msg-more">더보기</span>
				<!-- Conversations are loaded here -->
				<div class="direct-chat-messages chatting-content-list" style="clear: both">			  
				</div>
            	<!-- /.box-body -->
            	<div class="box-footer">
                <div class="input-group">
                  <input id="chatMsg" name="message" class="form-control" type="text" placeholder="Type Message ...">
                      <span class="input-group-btn">
                        <button class="btn btn-success btn-flat" type="submit">Send</button>
                      </span>
                </div>
           	 </div>
            <!-- /.box-footer-->
          </div>
          <!--/.direct-chat -->
          </div>	
		</div>
	</div>
</section>

