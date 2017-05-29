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
   onclick="popupOpen()">
  </div>
<script type="text/javascript">
	/*채팅창 팝업*/
	function popupOpen() {

		var popUrl = "/chatting"; //팝업창에 출력될 페이지 URL

		var popOption = "width=1000, height=500, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)

		window.open(popUrl, "", popOption);

	}
</script>

<script>
    $(function() {
        /* $(window).scroll(function() {
            if ($(this).scrollTop() > 500) {
                $('#chatBtn').fadeIn();
            } else {
                $('#chatBtn').fadeOut();
            }
        }); */
        $("#chatBtn").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
    });
</script>

