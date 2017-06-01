<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<title>ASC</title>
<meta charset="utf-8">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">

<!-- jQuery -->
<script src="/resources/js/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/resources/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/resources/js/TimeCircles.js"></script>
<script type="text/javascript" src="/resources/js/backstretch.js"></script>
<script type="text/javascript" src="/resources/js/ajaxchimp.js"></script>
<script type="text/javascript" src="/resources/js/main.js"></script>
<script type="text/javascript" src="/resources/js/index.js"></script>

</head>


<body>

	<div class="cont">
		<div class="demo">
			<div class="login">
				<div class="login__check">
					<img src="/resources/images/logo5.png">
				</div>
				<div class="login__form">
   <form action="/user/loginPost" method="post">
					<div class="login__row">
						<svg class="login__icon name svg-icon" viewBox="0 0 20 20">
            				<path d="M0,20 a10,8 0 0,1 20,0z M10,0 a4,4 0 0,1 0,8 a4,4 0 0,1 0,-8" />
          				</svg>
						<input type="text" class="login__input name" id="id" placeholder="ID" />
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
					<button type="submit" class="login__submit">로그인</button>
                   </div> 
					<p class="login__signup">
						계정이 없으신가요? &nbsp;<a data-toggle="modal" data-target="#registerModal">가입하기</a>
					</p>

					<p class="login__signup">
						아이디와 비밀번호를 잊으셨나요? &nbsp;<a data-toggle="modal" data-target="#findIdPwModal">찾기</a>
					</p>
  </form>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<jsp:include page="user/include/registerModal.jsp" />
	<jsp:include page="user/include/findIdPwModal.jsp" />

</body>
</html>

