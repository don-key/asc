<%@ page contentType="text/html; charset=utf-8"%>
<style>
.regist_label {
	font-size: 14px;
}
.wen {width:80px; height:80px; border-radius:80px; margin:0 auto; overflow:hidden;}
.wen img {height:80px; width:80px;}
</style>


<!-- Modal -->
<form action="/user/modify">
<div class="modal fade" id="modifyModal" role="dialog">
	<div class="modal-dialog" style="width: 35%">

		<!-- Modal content-->
		<div class="modal-content">

			<div class="modal-header" style="background: #354555; color: #ffffff;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h2 class="regist_label" style="font-weight: bolder;">회원 정보 수정</h2>
			</div>

			<div class="modal-body" style="margin-left: 10%">
				<div class="row">

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 ">
							<div class="wen"><img src="../resources/images/noimage.png"></div>
						</div>

						<div class="col-xs-6 col-sm-6">
						<br><br>
							<p style="font-size: 25px; font-weight: bold;">${login.id}</p>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label for="id" class="regist_label">아이디</label>
						</div>
						<div class="col-xs-6 col-sm-6">
							<input type="email" class="form-control onlyAlphabetAndNumber" id="id" name="id" value="${login.id}" readonly>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label for="pw" class="regist_label">비밀번호</label>
						</div>
						<div class="col-xs-6 col-sm-6">
							<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요">
						</div>
                        <div class="col-xs-3 col-sm-3" style="font-size:small">
                          <label id="">(영문소문자/숫자, 4~16자)</label>
                        </div>            
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label for="repw" class="regist_label">비밀번호 확인</label>
						</div>
						<div class="col-xs-6 col-sm-6">
							<input type="password" class="form-control" id="repassword" name="repassword" placeholder="비밀번호를 한 번 더 입력하세요" onkeyup="passwdCheck()">
						</div>
                        <div class="col-xs-3 col-sm-3" style="font-size:small">
                          <label id="info"></label>
                        </div>            
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label class="regist_label">이름</label>
						</div>
						<div class="col-xs-6 col-sm-6">
							<input type="text" class="form-control" id="name" name="name" value="${login.name }"placeholder="이름을 입력하세요" />
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label class="regist_label">휴대폰 번호</label>
						</div>
						<div class="col-xs-6 col-sm-6">
							<input type="tel" class="form-control placeholder" id="phone" name="phone" value="${user.phone }"placeholder="휴대폰 번호를 입력하세요" />
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label class="regist_label">사진</label>
						</div>
						<div class="col-xs-6 col-sm-6">
							<input type="file" class="form-control placeholder" id="photo" name="photo" />
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<br>
			</div>

			<div class="modal-footer">
				<div class="row">
					<div class="col-xs-2 col-xs-offset-3">
						<button type="submit" class="btn btn-warning" style="width: 100%; font-size: 15px; font-weight: bold;">수정</button>
					</div>
					<div class="col-xs-2">
						<button type="button" class="btn btn-danger" data-dismiss="modal" style="width: 100%; font-size: 15px;">탈퇴</button>
					</div>
					<div class="col-xs-2">
						<button type="button" class="btn btn-default" data-dismiss="modal" style="width: 100%; font-size: 15px; font-weight: bold; ">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</form>

<script>

/** 비밀번호 일치 체크*/
function passwdCheck() {
    var password = $('#password').val();
    var repassword = $('#repassword').val();
    var passwdText = document.getElementById("info");
    if (password == repassword) {
       passwdText.innerHTML = "비밀번호가 일치합니다.";
    } else {
       passwdText.innerHTML = "비밀번호가 일치하지 않습니다.";
    }

 }

</script>