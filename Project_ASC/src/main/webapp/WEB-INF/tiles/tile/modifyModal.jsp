<%@ page contentType="text/html; charset=utf-8"%>
<style>
.regist_label {
	font-size: 14px;
}

@font-face {
	font-family: 'THE130';
	font-style: normal;
	font-weight: 400;
	src: local('THE130'), url('/resources/fonts/THE130.ttf') format('ttf');
}

#registerModal label {
	font-family: 'THE130';
}
</style>


<!-- Modal -->
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
							<a class="thumbnail" style="border: none;"> <img src="../../resources/images/main/image-placeholder.png" alt="" class="img-circle" >
							</a>
						</div>

						<div class="col-xs-6 col-sm-6">
							<h3>Object@gmail.com</h3>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label for="id" class="regist_label">아이디</label>
						</div>
						<div class="col-xs-7 col-sm-7">
							<input type="email" class="form-control onlyAlphabetAndNumber" id="id" name="id" placeholder="이메일 형식으로만 입력 가능" maxlength="20">
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label for="pw" class="regist_label">비밀번호</label>
						</div>
						<div class="col-xs-7 col-sm-7">
							<input type="password" class="form-control" name="passwd" placeholder="비밀번호를 입력하세요">
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label for="repw" class="regist_label">비밀번호 확인</label>
						</div>
						<div class="col-xs-7 col-sm-7">
							<input type="password" class="form-control" name="repasswd" placeholder="비밀번호를 한 번 더 입력하세요">
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label class="regist_label">이름</label>
						</div>
						<div class="col-xs-7 col-sm-7">
							<input type="text" class="form-control" name="name" placeholder="이름을 입력하세요" />
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label class="regist_label">휴대폰 번호</label>
						</div>
						<div class="col-xs-7 col-sm-7 ">
							<input type="tel" class="form-control placeholder" name="telephone" placeholder="휴대폰 번호를 입력하세요" />
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label class="regist_label">사진</label>
						</div>
						<div class="col-xs-7 col-sm-7 ">
							<input type="file" class="form-control placeholder" name="profile" />
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<br>
			</div>

			<div class="modal-footer">
				<div class="row">
					<div class="col-xs-2 col-xs-offset-3">
						<button type="button" class="btn btn-warning" style="width: 100%; font-size: 15px; font-weight: bold;">수정</button>
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