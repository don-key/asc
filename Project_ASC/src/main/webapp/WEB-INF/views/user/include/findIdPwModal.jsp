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
							<li id="findPassword"><a href="#tab2" data-toggle="tab">비밀번호 찾기</a></li>
							<li id="newPassword"><a href="#tab3" data-toggle="tab">새 비밀번호 만들기</a></li>
						</ul>

						<div class="tab-content">
							<div class="tab-pane active" id="tab1">
                          <form id="tab1Form" action="/user/findId">
							<br>
								<p style="text-align: center;">　 회원정보에 등록한 이름과 휴대전화 번호를 입력해 주세요.</p>
							<br>

								<div class="form-group">
									<div class="col-xs-3 col-sm-3 text-center">
										<label class="regist_label">이름</label>
									</div>
									<div class="col-xs-7 col-sm-7">
										<input type="text" class="form-control" id="nameForId" name="name" placeholder="이름을 입력하세요" />
									</div>
									<div class="clearfix"></div>
								</div>

								<div class="form-group">
									<div class="col-xs-3 col-sm-3 text-center">
										<label class="regist_label">휴대폰 번호</label>
									</div>
									<div class="col-xs-7 col-sm-7 ">
										<input type="tel" class="form-control placeholder" id="phoneForId" name="phone" placeholder="휴대폰 번호를 입력하세요" />
									</div>
									<div class="clearfix"></div>
								</div>
                                <div class="modal-footer">
                                  <div class="row">
                                    <div class="col-xs-2 col-xs-offset-4">
                                      <button type="submit" id="findIdBtn" class="btn btn-warning" style="width: 100%; font-size: 15px; font-weight: bold;">찾기</button>
                                    </div>
                                    <div class="col-xs-2">
                                      <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 100%; font-size: 15px; font-weight: bold; background-color: #333; color: #ffffff;">취소</button>
                                    </div>
                                  </div>
                                </div>
                          </form>
							</div>

						<div class="tab-pane" id="tab2">
                       <form action="/user/findPw">
							<br>
								<p style="text-align: center;">회원정보에 등록한 아이디, 이름과 휴대전화 번호를 입력해 주세요. <br> 새로운 비밀번호를 발급합니다.</p>
							<br>

								<div class="form-group">
									<div class="col-xs-3 col-sm-3 text-center">
										<label for="id" class="regist_label">아이디</label>
									</div>
									<div class="col-xs-7 col-sm-7">
										<input type="email" class="form-control onlyAlphabetAndNumber" id="idForPw" name="id" placeholder="이메일 형식으로만 입력 가능" maxlength="30">
									</div>
									<div class="clearfix"></div>
								</div>

								<div class="form-group">
									<div class="col-xs-3 col-sm-3 text-center">
										<label class="regist_label">이름</label>
									</div>
									<div class="col-xs-7 col-sm-7">
										<input type="text" class="form-control" id="nameForPw" name="name" placeholder="이름을 입력하세요" />
									</div>
									<div class="clearfix"></div>
								</div>

								<div class="form-group">
									<div class="col-xs-3 col-sm-3 text-center">
										<label class="regist_label">휴대폰 번호</label>
									</div>
									<div class="col-xs-7 col-sm-7 ">
										<input type="tel" class="form-control placeholder" id="phoneForPw" name="phone" placeholder="휴대폰 번호를 입력하세요" />
									</div>
									<div class="clearfix"></div>
								</div>
                
                                <div class="modal-footer">
                                  <div class="row">
                                    <div class="col-xs-2 col-xs-offset-4">
                                      <button type="submit" id="findPwBtn" class="btn btn-warning" style="width: 100%; font-size: 15px; font-weight: bold;">찾기</button>
                                    </div>
                                    <div class="col-xs-2">
                                      <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 100%; font-size: 15px; font-weight: bold; background-color: #333; color: #ffffff;">취소</button>
                                    </div>
                                  </div>
                                </div>
                         </form>
							</div>
                          
                        <div class="tab-pane" id="tab3">
                         <form action="/user/createNewPw">
                            <br>
                              <p style="text-align: center;">새롭게 사용하실 비밀번호를 등록해주세요 <br> </p>
                              <input type="hidden" id="newId" value="">
                            <br>
              
                              <div class="form-group">
                                <div class="col-xs-3 col-sm-3 text-center">
                                  <label for="id" class="regist_label">비밀번호</label>
                                </div>
                                <div class="col-xs-7 col-sm-7">
                                  <input type="password" class="form-control onlyAlphabetAndNumber" id="newSetPassword" name="password" placeholder="새롭게 사용할 비밀번호를 입력하세요" maxlength="30">
                                </div>
                                <div class="clearfix"></div>
                              </div>
              
                              <div class="form-group">
                                <div class="col-xs-3 col-sm-3 text-center">
                                  <label class="regist_label">비밀번호 확인</label>
                                </div>
                                <div class="col-xs-7 col-sm-7">
                                  <input type="password" class="form-control" id="newRePassword" name="rePassword" placeholder="비밀번호를 다시 입력하세요" />
                                </div>
                                <div class="clearfix"></div>
                              </div>
                              
                              <div class="modal-footer">
                                  <div class="row">
                                    <div class="col-xs-2 col-xs-offset-4">
                                      <button type="submit" id="newPwBtn" class="btn btn-warning" style="width: 100%; font-size: 15px; font-weight: bold;">등록</button>
                                    </div>
                                    <div class="col-xs-2">
                                      <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 100%; font-size: 15px; font-weight: bold; background-color: #333; color: #ffffff;">취소</button>
                                    </div>
                                  </div>
                                </div>
                          </form>
                            </div>
              
						</div>
					</div>
				</div>
			</div>
			<br>
		</div>
	</div>
</div>

<script>

/**새로운 비밀번호등록 탭 안보이기*/
$(function() {
	$('#newPassword').hide();	
});


/**이름과 전화번호로 아이디 찾기*/
$(function (){
    $('#findIdBtn').click(function(e){ 
    	e.preventDefault();
          var nameForId = $("#nameForId").val();
          	$("#nameForId").val('');
          if(nameForId < 1){
               swal({
                    title: '이름 미입력!',
                    text: '이름을 입력해주세요.',
                    type: 'warning',
                    confirmButtonText: '닫기'
                  })
              return false;
            }
          var phoneForId = $("#phoneForId").val();
        	  $("#phoneForId").val('');
          if(phoneForId < 1){
              swal({
                   title: '전화번호 미입력!',
                   text: '전화번호를 입력해주세요.',
                   type: 'warning',
                   confirmButtonText: '닫기'
                 })
             return false;
           }   
           $.ajax({
               type : 'GET',
               url : "/user/findId",
               data:
               {
            	   name: nameForId,
            	   phone: phoneForId,
               },
               success:function(request){
                  if (request == '') {
                       swal(
                              '　',
                              '찾는 아이디가 없습니다!',
                              'success'
                            )
               
            } else {
                   swal(
                         request,
                         '찾으시는 아이디입니다 :)',
                         'success'
                       )
                    }
                   }
         }); 
       });
   });

/** 아이디, 이름과 전화번호로 비밀번호 찾기*/
$(function (){
    $('#findPwBtn').click(function(e){ 
    	e.preventDefault();
          var id = $("#idForPw").val();
         	 $("#idForPw").val('');
          if(id < 1){
               swal({
                    title: '아이디 미입력!',
                    text: '아이디를 입력해주세요.',
                    type: 'warning',
                    confirmButtonText: '닫기'
                  })

              return false;
            }
          var nameForPw = $("#nameForPw").val();
          		$("#nameForPw").val('');
          if(nameForPw < 1){
              swal({
                   title: '이름 미입력!',
                   text: '이름을 입력해주세요.',
                   type: 'warning',
                   confirmButtonText: '닫기'
                 })
             return false;
           }   
          var phoneForPw = $("#phoneForPw").val();
          		$("#phoneForPw").val('');
          if(phoneForPw < 1){
              swal({
                   title: '전화번호 미입력!',
                   text: '전화번호를 입력해주세요.',
                   type: 'warning',
                   confirmButtonText: '닫기'
                 })
             return false;
           }  
          
           $.ajax({
               type : 'GET',
               url : "/user/findPw",
               data:
               {
            	   id: id,
            	   name: nameForPw,
            	   phone: phoneForPw,
               },
               success:function(request){
                  if (request == '') {
                       swal(
                              '　',
                              '찾는 비밀번호가 없습니다!',
                              'success'
                            )
            }else{

            	$('#newPassword').show();
            	$('#tab2').removeClass("active");
            	$('#tab3').addClass("active");
            	$('#findPassword').removeClass("active");
            	$('#newPassword').addClass("active");
            	$('#newId').val(id);
            	
            	}
               }
    });
    
    });
});
 
    /** 새로운 비밀번호 생성하기 */
    
    $(function (){
       $('#newPwBtn').click(function(e){ 
   		var id = $('#newId').val();
//      	$('#newId').val('');
     	var password = $('#newSetPassword').val();
     		$('#newSetPassword').val('');
   		var rePassword = $('#newRePassword').val();
	   		$('#newRePassword').val('');
       	e.preventDefault();
           $.ajax({
               type : 'GET',
               url : "/user/createNewPw",
               data:
               {
            	   password: password,
            	   id : id
               },
               success:function(request){
                  if (request == 'success') {
                       swal(
                              '비밀번호가 변경되었습니다.',
                              '',
                              'success'
                            ).then(function(){
                  				 location.href="/";
                            	
                })
    	     }
       		}
    	});        
        
       }); 
    }); 
</script>