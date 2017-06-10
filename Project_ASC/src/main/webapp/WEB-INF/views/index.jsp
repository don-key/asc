<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<title>ASC</title>
<meta charset="utf-8">

<!-- 파비콘 설정 -->
<link rel="shortcut icon" type="image/x-icon" href="/resources/images/sharing.ico" />

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<!-- SweetAlert CSS -->
<link href="/resources/css/sweetalert2.min.css" rel="stylesheet">

<!-- jQuery -->
<script src="/resources/js/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/resources/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/resources/js/TimeCircles.js"></script>
<script type="text/javascript" src="/resources/js/backstretch.js"></script>
<script type="text/javascript" src="/resources/js/ajaxchimp.js"></script>
<script type="text/javascript" src="/resources/js/main.js"></script>
<script type="text/javascript" src="/resources/js/index.js"></script>
<!-- SweetAlert JavaScript -->
<script src="/resources/js/sweetalert2.min.js"></script>

<script>
$(function(){
	var status = getUrlParams();
	var result = status.result; // 비밀번호 잘못쓰면 error
	if(result == "error") {
		swal({
            title: '',
            text: '사이트에 등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.',
            type: 'warning',
            confirmButtonText: 'OK'
          });
	}
	
	
	if(result == "notAuth") {
		swal({
            title: '메인 미인증',
            text: '메일인증이 필요한 회원입니다.',
            type: 'warning',
            confirmButtonText: 'OK'
          });
	}

	if(result == "delete") {
		swal({
            title: '',
            text: '탈퇴한 회원입니다.',
            type: 'warning',
            confirmButtonText: 'OK'
          });
	}
	

	
	var message = $("#successMessage").val();
	if(message == "success") {
		swal(     
          		 '회원가입 신청완료!',
          	     '메일 인증을 하시면 이용가능합니다.',
          	     'success'
          		)
	}
	
	var message = $("#statusMessage").val();
	if(message == "status") {
		swal(     
          		 '메일인증 성공!',
          	     '로그인 후 이용가능합니다.',
          	     'success'
          		)
	}	
	
});

function getUrlParams() {
    var params = {};
    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, 
    		function(str, key, value) { params[key] = value; });
    return params;
}
</script>

</head>


<body>
<input type="hidden" id="successMessage" value="${message}"/>
<input type="hidden" id="statusMessage" value="${setStatus}"/>
	<div class="cont">
		<div class="demo">
			<div class="login">
				<div class="login__check">
					<img src="/resources/images/logo5.png">
				</div>
				<div class="login__form">
              <form action="/user/loginPost" method="post" >
					<div class="login__row">
						<svg class="login__icon name svg-icon" viewBox="0 0 20 20">
            				<path d="M0,20 a10,8 0 0,1 20,0z M10,0 a4,4 0 0,1 0,8 a4,4 0 0,1 0,-8" />
          				</svg>
						<input type="email" class="login__input name" name="id" id="id" placeholder="ID" />
					</div>
					<div class="login__row">
						<svg class="login__icon pass svg-icon" viewBox="0 0 20 20">
			            	<path d="M0,20 20,20 20,8 0,8z M10,13 10,16z M4,8 a6,8 0 0,1 12,0" />
			          	</svg>
						<input type="password" class="login__input pass" name="password" id="password" placeholder="Password" />
                    </div>
                      <div class="checkbox_row" style="display:inline-flex; margin-top:4%;">
                          <input class="checkBox" type="checkbox" name="useCookie" style="margin-left:-10%; margin-top:4%">
                            <p class="rememberMe" style="color:#9d9d9d; font-size:large; margin-left:10%;">Remember Me</p>
                      </div> 
                   <div>
					<button type="submit" id="loginBtn" class="login__submit">로그인</button>
                   </div> 
                </form>
					<p class="login__signup">
						계정이 없으신가요? &nbsp;<a data-toggle="modal" data-target="#registerModal">가입하기</a>
					</p>

					<p class="login__signup">
						아이디와 비밀번호를 잊으셨나요? &nbsp;<a data-toggle="modal" data-target="#findIdPwModal">찾기</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<jsp:include page="user/include/registerModal.jsp" />
	<jsp:include page="user/include/findIdPwModal.jsp" />


<script>

$("#loginBtn").on("click", function() {
	var emailpattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var id = $(".login__input").val();
	var password = $("#password").val();
	
	if(id.trim().length <1){
		swal({
            title: '아이디 미입력!',
            text: '아이디를 입력해주세요.',
            type: 'warning',
            confirmButtonText: '닫기'
          })
      return false;
	};
	
	if(!(emailpattern).test(id)){
		swal({
            title: 'email 형식으로 입력하세요.',
            text: 'EX) asc@gmail.com',
            type: 'warning',
            confirmButtonText: '닫기'
          })
      return false;
	};
	
	
	if(password.trim().length <1){
		swal({
            title : '비밀번호 미입력',
            text : '비밀번호를 입력해주세요.',
            type : 'warning',
            confirmButtonText : '닫기'
         })
		return false;
	};
});

</script>



</body>
</html>
