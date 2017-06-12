<%@ page contentType="text/html; charset=utf-8"%>

<style>
img#chatBtn {
	position: fixed;
	right: 2%;
	bottom: 50px;
	z-index: 999;
}
</style>

<div class="page-wrapper">
  <img id="chatBtn" src="/resources/images/menu/chat.png"
    style="cursor: pointer;">
</div>

<script>
    $(function() {
        $("#chatBtn").click(function() {
        	var projectListNo = location.pathname.split('/')[3];
			$.ajax({
				url : "/project/getChatName",
				type : "POST",
				data : {
					projectListNo : projectListNo
				},
				success : function(data) {
					popupOpen(data);
				}
			});
		});
	});
	/*채팅창 팝업*/
	function popupOpen(chatName) {
		var popupUrl = "http://localhost:3000/chats/" + chatName;
		var popUrl = popupUrl; //팝업창에 출력될 페이지 URL

		//var popUrl = "http://www.naver.com";

		console.log(popUrl);

		var cw = screen.availWidth; // 화면너비
		var ch = screen.availHeight; // 화면높이
		var sw = 1000; // 띄울 창 너비
		var sh = 500; // 띄울 창 높이
		var ml = (cw - sw) / 2;
		var mt = (ch - sh) / 2;

		var popOption = "width=" + sw + ", height=" + sh + ", top=" + mt
				+ ",left=" + ml + " resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)

		window.open(popUrl, "", popOption);
	}
	setTimeout(function() {
		$('#loding').fadeOut();	
	}, 1500);
</script>
