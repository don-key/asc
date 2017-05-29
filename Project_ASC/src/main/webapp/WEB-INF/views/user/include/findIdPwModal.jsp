<%@ page contentType="text/html; charset=UTF-8"%>
<style>
.tabbable {
	font-size: 15px;
}

@font-face {
  font-family: 'LotteMartDream';
  font-style: normal;
  font-weight: 400;
  src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff') format('woff');
}

* {
font-family: 'LotteMartDream';
}

#registerModal * {
	font-family: 'LotteMartDream';
}
</style>


<!-- Modal -->
<div class="modal fade" id="findIdPwModal" role="dialog">
	<div class="modal-dialog" style="width: 35%">

		<!-- Modal content-->
		<div class="modal-content">

			<div class="modal-header" style="background: #354555; color: #ffffff;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h2 class="tabbable" style="font-weight: bolder;">회원정보 찾기</h2>
			</div>

			<div class="modal-body">
				<div class="row">
					<div class="tabbable">

						<ul class="nav nav-tabs">
							<li class="active"><a href="#tab1" data-toggle="tab">아이디 찾기</a></li>
							<li><a href="#tab2" data-toggle="tab">비밀번호 찾기</a></li>
						</ul>

						<div class="tab-content">
							<div class="tab-pane active" id="tab1">
							<br>
								<p style="text-align: center;">　 회원정보에 등록한 이름과 휴대전화 번호를 입력해 주세요.</p>
							<br>

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
							</div>


							<div class="tab-pane" id="tab2">
							<br>
								<p style="text-align: center;">회원정보에 등록한 아이디, 이름과 휴대전화 번호를 입력해 주세요. <br> 이메일로 임시 비밀번호를 발급합니다.</p>
							<br>

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
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>

			<div class="modal-footer">
				<div class="row">
					<div class="col-xs-2 col-xs-offset-4">
						<button type="button" class="btn btn-warning" style="width: 100%; font-size: 15px; font-weight: bold;">찾기</button>
					</div>
					<div class="col-xs-2">
						<button type="button" class="btn btn-default" data-dismiss="modal" style="width: 100%; font-size: 15px; font-weight: bold; background-color: #333; color: #ffffff;">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>