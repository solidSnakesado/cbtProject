<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>채팅하기</title>
<script type="text/javascript">
	$(document).ready(function() {
		var ws;
		if (ws != undefined && ws.readyState != WebSocket.CLOSED) {
			writeResponse("WebSocket is already opened.");
			return;
		}
		
		// 웹소켓 객채 생성
		ws = new WebSocket("ws://192.168.0.112:8081/project/echo.do");
		ws.onopen = function(event) {
			if (event.data == undefined) {
				return;
			}

			writeResponse(event.data);
		};
		
		ws.onmessage = function(event) {
			writeResponse(event.data);
		};

		ws.onclose = function(event) {
			writeResponse("Connection closed");
		};

		$("#sendBtn").click(function() {
			var text = $("#messageInput").val() + "," + $("#sender").val();
			ws.send(text);
			text = "";
		});

		$("#closeBtn").click(function() {
			ws.close();
		});

		// 2019.07.18 성재민
		// 메시지를 화면에 전시
		function writeResponse(text) {
			$("#messages").append("<br>" + text);
		}​
	});
</script>
</head>
<body>
	<div>
		<!-- 2019.07.18 성재민 -->
		<!-- value 값은 로그인된 유저라면 해당 유저의 id 가 -->
		<!-- 비 로그인 된 유저라면 손님이니 비로그인 유저라는 표시 -->
		<input type="text" id="sender" value="test" style="display: none;">
		<input type="text" id="messageInput">
	</div>

	<div>
		<button type="button" id="sendBtn">Send</button>
		<button type="button" id="closeBtn">Close</button>
	</div>

	<!-- 2019.07.18 성재민 -->
	<!-- 서버에서 전송받은 값이 전시 되는 부분 -->
	<div id="messages"></div>
</body>
</html>