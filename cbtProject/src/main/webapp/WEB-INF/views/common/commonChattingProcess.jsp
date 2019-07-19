<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/styleChat.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>채팅하기</title>
<script type="text/javascript">
	$(document).ready(function() {
		var Now = new Date();
		var tempId = "test" + Now.getSeconds();
		var ws;
		if (ws != undefined && ws.readyState != WebSocket.CLOSED) {
			$("#messages").append("<br>" + "WebSocket is already opened.");
			return;
		}

		// 웹소켓 객채 생성
		ws = new WebSocket("ws://192.168.0.112:8081/project/echo.do");
		ws.onopen = function(event) {
			/* if (event.data === undefined)
				return; */

			onOpen(event);
		};

		ws.onmessage = function(event) {
			onMessage(event);
		};

		// 2019.07.18 성재민
		// 메시지를 화면에 전시
		function onMessage(event) {
			var message 	= JSON.parse(event.data);
			var messageType = "";
			
			console.log(message.id + " : " + tempId);

			if (message.id == tempId) {
				return;
			}
			
			if(message.type == "message") {
				messageType = "tmOtherMsg";
			} else if(message.type == "system") {
				console.log("외부 입장");
				messageType = "tmSystemMsg";
			}

			var html = '';
			html += '<p class=' + messageType + '>';
			
			if(message.type == "message"){
				html += '<span class="tmUserId">' + message.id + '</span>';
				html += '<span class="tmMsg">' + message.msg + '</span>';
				html += '<span class="tmArrow"></span>'
			} else if(message.type == "system"){
				html += '<span class="tmMsg"><strong>' + message.msg + '</strong></span>';
			}
			
			html += '</p>';

			$("#tmMessageList .tmInner").append(html);
			$("#tmMessageList .tmInner").scrollTop($("#tmMessageList .tmInner")[0].scrollHeight);
		}

		function onOpen(event) {
			var sendMessage = {
				type : "system",
				msg : tempId + "님이 입장 하셨습니다.",
				id : tempId,
				rid : tempId
			};
			
			ws.send(JSON.stringify(sendMessage));
		}

		// 2019.07.19 성재민
		// 전송버튼을 누르면 메시지 전송
		$("#tmSendMessage").click(function() {
			sendMessage();
		});

		// 2019.07.19 성재민
		// 입력창에 엔터키가 입력되면 메시지 전송.
		$("#tmInputMessage").keyup(function(event) {
			if (event.keyCode == 13) {
				sendMessage();
			}
		});

		function sendMessage() {
			// 2019.07.19 성재민
			// 아무것도 입력 안하거나 공백으로만 입력한 값은 전송하지 않게 처리
			if ($.trim($("#tmInputMessage").val()) == '') {
				$("#tmInputMessage").val('').focus();
				return;
			}

			var sendMessage = {
				type : "message",
				msg : $("#tmInputMessage").val(),
				id : tempId,
				rid : tempId
			};

			ws.send(JSON.stringify(sendMessage));

			var html = '';
			html += '<p class="tmMyMsg">';
			html += ' <span class="tmMsg">' + sendMessage.msg + '</span>';
			html += ' <span class="tmArrow"></span>';
			html += '</p>';

			$("#tmMessageList .tmInner").append(html);
			$("#tmInputMessage").val('').focus();
			
			$("#tmMessageList .tmInner").scrollTop($("#tmMessageList .tmInner")[0].scrollHeight);
		}
	});
</script>
</head>
<body>
	<section id="tmLayerChat">
		<div class="tmHead" style="width: 60%; margin-left: 20%;">
			<h2 class="logo"></h2>
		</div>
		<div class="tmBody" style="width: 60%; height: 750px; margin-left: auto; margin-right: auto;">
		
			<!-- 2019.07.19 성재민 -->
			<!-- 채팅 메시지 목록 -->
			<div id="tmMessageList" style="height: 91%;">
				<div class="tmInner scroll-pane jspScrollable" tabindex="0" style="overflow: scroll; padding: 0px; width: 100%">
				</div>
			</div>

			<!-- 2019.07.19 성재민 -->
			<!-- 채팅 메시지 입력 전송 영역 -->
			<div id="tmMessageForm">
				<div id="tmInputMessageWrap">
					<textarea id="tmInputMessage"></textarea>
				</div>
				<div id="tmSendMessageWrap">
					<button type="button" id="tmSendMessage" class="hidden">전송</button>
				</div>
			</div>
			<div id="tmCopyright">
				<p>예담직업전문학교</p>
			</div>
		</div>
	</section>

</body>
</html>