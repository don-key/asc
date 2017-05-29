<%@ page contentType="text/html; charset=UTF-8"%>
<style>
.regist_label {
 font-size: 15px;
}

@font-face {
  font-family: 'LotteMartDream';
  font-style: normal;
  font-weight: 400;
  src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff') format('woff');
}

#registerModal label {
  font-family: 'LotteMartDream';
}
</style>


<!-- Modal -->
<div class="modal fade" id="registerModal" role="dialog">
	<div class="modal-dialog" style="width: 35%">

		<!-- Modal content-->
		<div class="modal-content">

			<div class="modal-header" style="background: #354555; color: #ffffff;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h2 class="regist_label" style="font-weight: bolder;">회원가입</h2>
			</div>

			<div class="modal-body">
				<div class="row">
					<div class="form-group">
						<div class="col-xs-3 col-sm-3">
							<label for="id" class="regist_label">아이디</label>
						</div>
						<div class="col-xs-7 col-sm-7">
							<input type="email" class="form-control onlyAlphabetAndNumber" id="id" name="id" placeholder="이메일 형식으로만 입력 가능" maxlength="20">
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3">
							<label for="pw" class="regist_label">비밀번호</label>
						</div>
						<div class="col-xs-7 col-sm-7">
							<input type="password" class="form-control" name="passwd" placeholder="비밀번호를 입력하세요">
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3">
							<label for="repw" class="regist_label">비밀번호 확인</label>
						</div>
						<div class="col-xs-7 col-sm-7">
							<input type="password" class="form-control" name="repasswd" placeholder="비밀번호를 한 번 더 입력하세요">
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3">
							<label class="regist_label">이름</label>
						</div>
						<div class="col-xs-7 col-sm-7">
							<input type="text" class="form-control" name="name" placeholder="이름을 입력하세요" />
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3">
							<label class="regist_label">휴대폰 번호</label>
						</div>
						<div class="col-xs-7 col-sm-7 ">
							<input type="tel" class="form-control placeholder" name="telephone" placeholder="휴대폰 번호를 입력하세요" />
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3">
							<label class="regist_label">프로필 사진</label>
						</div>
							<div class="col-xs-3 col-sm-3 ">
								<a href="#" class="thumbnail"> <img src="resources/images/main/image-placeholder.png" alt=""></a>
							</div>

							<div class="col-xs-5 col-sm-5">
								<input type="file" class="form-control placeholder" name="profile" />
							</div>
							<div class="clearfix"></div>
					</div>

				</div>
				<br>

			</div>

			<div class="modal-footer">
				<div class="row">
					<div class="col-xs-2 col-xs-offset-4">
						<button type="button" class="btn btn-warning" style="width: 100%; font-size: 15px; font-weight: bold;">가입</button>
					</div>
					<div class="col-xs-2">
						<button type="button" class="btn btn-default" data-dismiss="modal" style="width: 100%; font-size: 15px; font-weight: bold; background-color: #333; color: #ffffff;">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>