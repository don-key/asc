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

.wen {width:50px; height:50px; border-radius:50px; margin:0 auto; overflow:hidden;}
.wen img {height:50px; width:50px;}
</style>


<!-- Modal -->
<form action="/user/register" method="post" enctype="multipart/form-data" onsubmit="">
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
						<div class="col-xs-2 col-sm-2 text-center">
							<label for="id" class="regist_label">아이디</label>
						</div>
						<div class="col-xs-7 col-sm-7">
							<input type="email" class="form-control onlyAlphabetAndNumber" id="registerId" name="id" placeholder="이메일 형식으로만 입력 가능" maxlength="30" onkeyup="idCheck()">
						</div>
                        <div class="col-xs-3 col-sm-3" style="font-size:small">
                          <label id="display">(영문소문자/숫자, 이메일 형식)</label>
                        </div>
            
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-2 col-sm-2 text-center">
							<label for="pw" class="regist_label">비밀번호</label>
						</div>
						<div class="col-xs-7 col-sm-7">
							<input type="password" class="form-control" id="registerPassword" name="password" placeholder="비밀번호를 입력하세요" >
						</div>
                        <div class="col-xs-3 col-sm-3" style="font-size:small">
                          <label id="info">(영문소문자/숫자, 4~16자)</label>
                        </div>            
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-2 col-sm-2 text-center">
							<label for="repw" class="regist_label">비밀번호 확인</label>
						</div>
						<div class="col-xs-7 col-sm-7">
							<input type="password" class="form-control" id="repassword" name="repassword" placeholder="비밀번호를 한 번 더 입력하세요" >
						</div>
                        <div class="col-md-3 col-sm-3">
                          <label id="info"></label>
                        </div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-2 col-sm-2 text-center">
							<label class="regist_label">이름</label>
						</div>
						<div class="col-xs-7 col-sm-7">
							<input type="text" class="form-control" id="registerName" name="name" placeholder="이름을 입력하세요" />
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-2 col-sm-2 text-center">
							<label class="regist_label">휴대폰 번호</label>
						</div>
						<div class="col-xs-7 col-sm-7 ">
							<input type="tel" class="form-control placeholder" id="registerPhone" name="phone" placeholder="휴대폰 번호를 입력하세요" />
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-2 col-sm-2 text-center">
							<label class="regist_label">프로필 사진</label>
						</div>
							<div class="col-xs-2 col-sm-2 ">
								<div class="wen"><img src="../resources/images/noimage.png"></div>
							</div>

							<div class="col-xs-5 col-sm-5">
								<input type="file" class="form-control placeholder" name="fileupload" />
							</div>
							<div class="clearfix"></div>
					</div>

				</div>
				<br>

			</div>

			<div class="modal-footer">
				<div class="row">
					<div class="col-xs-2 col-xs-offset-4">
						<button id="registerBtn" type="submit" class="btn btn-warning" style="width: 100%; font-size: 15px; font-weight: bold;">가입</button>
					</div>
					<div class="col-xs-2">
						<button type="button" class="btn btn-default" data-dismiss="modal" style="width: 100%; font-size: 15px; font-weight: bold; background-color: #333; color: #ffffff;">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
  </div>
</form>

<script>
	
/** 아이디 중복체크 */
   function idCheck() {
      var registerId = $('#registerId').val();
      if (registerId.length > 3) {

         $.ajax({
            type : 'GET',
            url : "/user/idCheck",
            data : {
            	
            	registerId : registerId

            },
            success : function(request) {
               var display = document.getElementById("display");
               if (request == "success") {
                  display.innerHTML = "사용가능한 아이디입니다.";
               } else if (request == "fail") {
                  display.innerHTML = "이미 사용중인 아이디입니다.";
               }
            }

         });

      }

   }	
	
	
// $(function(){
//     $('#registerBtn').click(function(e){ 
//     	e.preventDefault();
    	
//     		/**아이디 체크*/
//            var registerId = $("#registerId").val();
//           if(registerId < 1){
//                swal({
//                     title: '아이디 미입력!',
//                     text: '아이디를 입력해주세요.',
//                     type: 'warning',
//                     confirmButtonText: '닫기'
//                   })
//               return false;
//             }
    
          
//            var registerPassword = $("#registerPassword").val();
//            var repassword = $("#repassword").val();
//           if (registerPassword < 1
//                   || repassword < 1) {
//                swal({
//                   title : '비밀번호 미입력',
//                   text : '비밀번호를 입력해주세요.',
//                   type : 'warning',
//                   confirmButtonText : '닫기'
//                })
//                $('#registerPassword').focus();
//                return false;

//             }


//             if ($('#registerPassword').val() != $('#repassword').val()) {
//                swal({
//                   title : '비밀번호 불일치',
//                   text : '비밀번호를 확인해주세요.',
//                   type : 'warning',
//                   confirmButtonText : '닫기'
//                })
//                $('#registerPassword').focus();
//                return false;
//             }
          
//           var registerName = $("#registerName").val();
//           if(registerName < 1){
//               swal({
//                    title: '이름 미입력!',
//                    text: '이름을 입력해주세요.',
//                    type: 'warning',
//                    confirmButtonText: '닫기'
//                  })
//              return false;
//            }
          
//           var registerPhone = $("#registerPhone").val();
//           if(registerPhone < 1){
//               swal({
//                    title: '전화번호 미입력!',
//                    text: '전화번호를 입력해주세요.',
//                    type: 'warning',
//                    confirmButtonText: '닫기'
//                  })
//              return false;
//            }	
          
//        $.ajax({
//        type : 'GET',
//        url : "/user/register",
//        data : {
    	   
//     	   registerId:registerId,
//     	   repassword:repassword,
//     	   registerPassword : registerPassword,
//     	   registerName:registerName,
//     	   registerPhone:registerPhone,
    	   
//        },
//        success : function(request) {
       
//           if (request == "success") {
   
//            swal(     
//            		 '환영합니다!',
//            	     '회원가입이 완료되었습니다.',
//            	     'success'
//            		)
   		
//           }     
//         }
//     });
          

          
//        });

// });


</script> 
  