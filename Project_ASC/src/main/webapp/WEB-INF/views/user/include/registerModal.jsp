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
						<div class="col-xs-3 col-sm-3 text-center">
							<label for="id" class="regist_label">아이디</label>
						</div>
						<div class="col-xs-6 col-sm-6">
							<input type="email" class="form-control onlyAlphabetAndNumber" id="registerId" name="id" placeholder="이메일 형식으로만 입력 가능" maxlength="30" onkeyup="idCheck()">
						</div>
                        <div class="col-xs-3 col-sm-3" style="font-size:small">
                          <label id="display">(영문소문자/숫자, 이메일 형식)</label>
                        </div>
            
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label for="pw" class="regist_label">비밀번호</label>
						</div>
						<div class="col-xs-6 col-sm-6">
							<input type="password" class="form-control" id="registerPassword" name="password" placeholder="비밀번호를 입력하세요" >
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
							<input type="password" class="form-control" id="repassword" name="repassword" placeholder="비밀번호를 한 번 더 입력하세요" onkeyup="passwdCheck();" >
						</div>
                        <div class="col-md-3 col-sm-3" style="font-size:small">
                          <label id="info"></label>
                        </div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label class="regist_label">이름</label>
						</div>
						<div class="col-xs-6 col-sm-6">
							<input type="text" class="form-control" id="registerName" name="name" placeholder="이름을 입력하세요" />
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label class="regist_label">휴대폰 번호</label>
						</div>
						<div class="col-xs-6 col-sm-6 ">
							<input type="tel" class="form-control placeholder" id="registerPhone" name="phone" placeholder="휴대폰 번호를 입력하세요" />
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label class="regist_label">프로필 사진</label>
						</div>
							<div class="col-xs-2 col-sm-2 ">
                            <div class="imgPreview"><div class='wen'><img src="/resources/images/upload/noimage.png"/></div></div>
							</div>

							<div class="col-xs-4 col-sm-4">
								<input id="imgSelect" type="file" class="form-control placeholder" name="fileupload" />
                                <input type="hidden"  id="uuidName"  name="uuidName">
                                <input type="hidden"  id="displayName"  name="displayName">
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


	/** 파일 썸네일 띄우기*/
	   $("#imgSelect").on("change", function(e) {
      e.preventDefault();
      
      var upload = $('#imgSelect');
      console.log(upload);
      // 전달된 파일 데이터를 가져오는 부분
      var file = upload[0].files[0];
      console.log(file);
      
      var formData = new FormData();
      
      formData.append("file", file);
      
      $.ajax({
         url: '/project/uploadAjax',
         data : formData,
         dataType: 'text',
         processData: false,
         contentType: false,
         type: 'POST',
         success: function(data) {
            var str ="";

            if (checkImageType(data)) {
               str ="<div class='wen'><img src='/project/displayFile?fileName="+data+"'/></div>"
             } else {
               str ="<div>"
                  + "<img src='/resources/images/file.png'/>"
                  + getOriginalName(data) 
                  + "<small data-src=" + data +" class='delbtn'> <i class='fa fa-fw fa-remove'></i> </small>"
                  +"</div>";
            }
            
            $('#uuidName').val(data);
            $('#displayName').val("/project/displayFile?fileName="+data);
            $(".imgPreview").html(str);
         }
      });
   });
	
		/** 파일의 확장자가 존재하는지 검사 */
		function checkImageType(fileName) {
			var pattern = /jpg|gif|png|jpeg/i;	// i는 대소문자 구분 없음을 의미
			
			return fileName.match(pattern);
		}
		
		/** uuid로 인해 길어진 파일 이름 줄여주는 기능*/
		function getOriginalName (fileName) {
			if (checkImageType(fileName)) {
				return;
			}
			
			var idx = fileName.indexOf("_")+1;	// 원본 파일 이름만 추출
			
			return fileName.substr(idx);
		}
		
		/** 이미지 파일의 원본 파일 찾기 */
		function getImageLink(fileName) {
			if (!checkImageType(fileName)) {
				return;
			}
			
			var front = fileName.substr(0, 5);	// /asc 경로 추출
			var end = fileName.substr(7); 	// s_ 제거
			
			return front + end;
		}
	
	
	
	/** 아이디 중복체크 */
   function idCheck() {
   	  var emailpattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
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
                  display.innerHTML = "사용가능합니다.";
                  $("#display").css("color", "blue");
               } else if (request == "fail") {
                  display.innerHTML = "이미 사용중입니다.";
                  $("#display").css("color", "red");
               }
            }

         });

      }

   }	
   
   
   /** 비밀번호 일치 체크*/
  function passwdCheck() {
      var registerPassword = $('#registerPassword').val();
      var repassword = $('#repassword').val();
      var passwdText = document.getElementById("info");
      if (registerPassword == repassword) {
         passwdText.innerHTML = "비밀번호가 일치합니다.";
         $("#info").css("color","blue");
      } else {
         passwdText.innerHTML = "비밀번호가 일치하지 않습니다.";
         $("#info").css("color","red");
      }
  
   }
	
/** 회원가입 유효성 검사*/
$(function(){
    $('#registerBtn').click(function(e){ 
    	
          var registerId = $("#registerId").val();
          if(registerId < 1){
               swal({
                    title: '',
                    text: '아이디를 입력해주세요.',
                    type: 'warning',
                    confirmButtonText: '닫기'
                  })
              return false;
            }
    
          if (registerId.length < 4) {
              swal({
                 title : '',
                 text : '아이디는 4자 이상이여야합니다.',
                 type : 'warning',
                 confirmButtonText : '닫기'
              })
              $('#registerId').focus();
              return false;
           }	
          
          if ($('#display').text() == "이미 사용중인 아이디입니다.") {
              swal({
                 title : '아이디 중복',
                 text : '다른 아이디를 입력해주세요.',
                 type : 'warning',
                 confirmButtonText : '닫기'
              })
              $('#registerId').focus();
              return false;
           }
          
          
          var registerPassword = $("#registerPassword").val();
          var repassword = $("#repassword").val();
          if (registerPassword < 1
                  || repassword < 1) {
               swal({
                  title : '',
                  text : '비밀번호를 입력해주세요.',
                  type : 'warning',
                  confirmButtonText : '닫기'
               })
               $('#registerPassword').focus();
               return false;

            }


            if ($('#registerPassword').val() != $('#repassword').val()) {
               swal({
                  title : '비밀번호 불일치',
                  text : '비밀번호를 확인해주세요.',
                  type : 'warning',
                  confirmButtonText : '닫기'
               })
               $('#registerPassword').focus();
               return false;
            }
            
            
            if ($('#registerPassword').val().length < 4) {
                swal({
                   title : '',
                   text : '비밀번호는 4자 이상이여야합니다.',
                   type : 'warning',
                   confirmButtonText : '닫기'
                })
                $('#registerPassword').focus();
                return false;
             }  
          
          var patternEng = /^[A-za-z]/g;
          var patternKor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;
          var registerName = $("#registerName").val();
          if(registerName < 1){
              swal({
                   title: '',
                   text: '이름을 입력해주세요.',
                   type: 'warning',
                   confirmButtonText: '닫기'
                 })
             return false;
           }
          
          if(!(patternEng).test(registerName) && !(patternKor).test(registerName)){
              swal({
                   title: '',
                   text: '이름은 한글이나 영문자만 가능합니다.',
                   type: 'warning',
                   confirmButtonText: '닫기'
                 })
             return false;
           }
          
          var registerPhone = $("#registerPhone").val();
          if(registerPhone < 1){
              swal({
                   title: '',
                   text: '전화번호를 입력해주세요.',
                   type: 'warning',
                   confirmButtonText: '닫기'
                 })
             return false;
           }
          
          var phonepattern = /^\d{3}-\d{3,4}-\d{4}$/;
          var registerPhone = $("#registerPhone").val();
          if(!(phonepattern).test(registerPhone)){
              swal({
                   title: 'EX)010-1234-1234',
                   text: '"-"를 포함해서 입력하세요.',
                   type: 'warning',
                   confirmButtonText: '닫기'
                 })
             return false;
           }	
		return true;
       });

});


</script>