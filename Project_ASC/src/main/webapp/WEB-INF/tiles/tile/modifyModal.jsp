<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib  prefix="m" uri="urlDecode"%> 

<style>
.regist_label {
	font-size: 14px;
}
.wen {width:80px; height:80px; border-radius:80px; margin:0 auto; overflow:hidden;}
.wen img {height:80px; width:80px;}
</style>


<script>
/**정보 수정 완료 alert*/
$(function(){
var message = $('#modifySuccess').val();
if (message == 'success') {
	swal(     
     		 '',
     	     '수정이 완료되었습니다.',
     	     'success'
     		)
}
});




</script> 

<!-- Modal -->
<input type="hidden" id="modifySuccess" value="${message}">
<input type="hidden" id="deleteSuccess" value="${message2}">
<input type="hidden" id="userNo" value="${login.userNo}">
<form action="/user/modify" method="post" enctype="multipart/form-data">
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
							<div class="imgPreview"><div class='wen'><img src='/resources/images/upload/${login.photo}'></div></div>
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
							<input type="text" class="form-control" id="name" name="name" value="${m:urlDecode(cookie.CookieForUser.value)}"placeholder="이름을 입력하세요" />
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label class="regist_label">휴대폰 번호</label>
						</div>
						<div class="col-xs-6 col-sm-6">
							<input type="tel" class="form-control placeholder" id="phone" name="phone" value="${login.phone}"placeholder="휴대폰 번호를 입력하세요" />
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label class="regist_label">사진</label>
						</div>
						<div class="col-xs-6 col-sm-6">
							<input id="mImgSelect" type="file" class="form-control placeholder" id="photo" name="fileupload" accept=".jpg,.jpeg,.png,.gif"/>
                            <input type="hidden"  id="mUuidName"  name="uuidName">
                            <input type="hidden"  id="mDisplayName"  name="displayName">						
                        </div>
						<div class="clearfix"></div>
					</div>
				</div>
				<br>
			</div>
 
			<div class="modal-footer">
				<div class="row">
					<div class="col-xs-2 col-xs-offset-3">
						<button type="submit" id="modifyBtn"class="btn btn-warning" style="width: 100%; font-size: 15px; font-weight: bold;">수정</button>
					</div>
					<div class="col-xs-2">
						<button type="button" id="deleteBtn" class="btn btn-danger" data-dismiss="modal" style="width: 100%; font-size: 15px;">탈퇴</button>
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

/** 파일 썸네일 띄우기*/
$("#mImgSelect").on("change", function(e) {
e.preventDefault();

var upload = $('#mImgSelect');
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
     
     $('#mUuidName').val(data);
     $('#mDisplayName').val("/project/displayFile?fileName="+data);
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


/** 비밀번호 일치 체크*/
function passwdCheck() {
    var password = $('#password').val();
    var repassword = $('#repassword').val();
    var passwdText = document.getElementById("info");
    if (password == repassword) {
       passwdText.innerHTML = "비밀번호가 일치합니다.";
       $("#info").css("color","blue");
    } else {
       passwdText.innerHTML = "비밀번호가 일치하지 않습니다.";
       $("#info").css("color","red");
    }

 }
 
 /** 정보 수정 유효성 검사*/
$(function(){
    $('#modifyBtn').click(function(e){ 
          var password = $("#password").val();
          var repassword = $("#repassword").val();
          if (password < 1
                  || repassword < 1) {
               swal({
                  title : '',
                  text : '비밀번호를 입력해주세요.',
                  type : 'warning',
                  confirmButtonText : '닫기'
               })
               $('#password').focus();
               return false;

            }


            if ($('#password').val() != $('#repassword').val()) {
               swal({
                  title : '비밀번호 불일치',
                  text : '비밀번호를 확인해주세요.',
                  type : 'warning',
                  confirmButtonText : '닫기'
               })
               $('#password').focus();
               return false;
            }
            
            
            if ($('#password').val().length < 4) {
                swal({
                   title : '',
                   text : '비밀번호는 4자 이상이여야합니다.',
                   type : 'warning',
                   confirmButtonText : '닫기'
                })
                $('#password').focus();
                return false;
             }  
          
          var patternEng = /^[A-za-z]/g;
          var patternKor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;
          var name = $("#name").val();
          if(name < 1){
              swal({
                   title: '',
                   text: '이름을 입력해주세요.',
                   type: 'warning',
                   confirmButtonText: '닫기'
                 })
             return false;
           }
          
          if(!(patternEng).test(registerName) && !(patternKor).test(name)){
              swal({
                   title: '',
                   text: '이름은 한글이나 영문자만 가능합니다.',
                   type: 'warning',
                   confirmButtonText: '닫기'
                 })
             return false;
           }
          
          var phone = $("#phone").val();
          if(phone < 1){
              swal({
                   title: '',
                   text: '전화번호를 입력해주세요.',
                   type: 'warning',
                   confirmButtonText: '닫기'
                 })
             return false;
           }
          
          var phonepattern = /^\d{3}-\d{3,4}-\d{4}$/;
          var phone = $("#phone").val();
          if(!(phonepattern).test(phone)){
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

/** 회원 탈퇴 */
$(function() {
   $('#deleteBtn').on('click', function() {
        var userNo = $('#userNo').val();
	    var password = $('#password').val();
	    $('#password').val("");
	    var repassword = $('#repassword').val();
	    $('#repassword').val("");
	    console.log("비번"+password);
	    console.log("비번확인"+repassword);
	    
        if (password < 1
                || repassword < 1) {
             swal({
                title : '',
                text : '비밀번호를 입력해주세요.',
                type : 'warning',
                confirmButtonText : '닫기'
             })
             $('#password').focus();
             return false;

          }
	    
        if ($('#password').val() != $('#repassword').val()) {
            swal({
               title : '비밀번호 불일치',
               text : '비밀번호를 확인해주세요.',
               type : 'warning',
               confirmButtonText : '닫기'
            })
            $('#password').focus();
            return false;
         }
        
      	 swal({
               title: '탈퇴 하시겠습니까?',
               text: "",
               type: 'warning',
               showCancelButton: true,
               confirmButtonColor: '#3085d6',
               cancelButtonColor: '#d33',
               confirmButtonText: 'YES',
               cancelButtonText: 'NO'
            }).then(function () {

                $.ajax({
                   type : 'GET',
                   url : "/user/delete",
                   data : {
                  	 
                   	userNo : userNo,
                   	password: password,
                   	repassword: repassword
                   	
                   },
                   success : function(request) {
                    if (request == 'fail') {
                  	  swal('', '가입한 비밀번호가 아닙니다!', 'warning')
                        return false;
                  	  
                      }else{
        				swal('탈퇴완료','같은아이디로 재가입 하실 수 없습니다.','success').then(function () {
                  			location.href = "/";
          				})
                	  
                      }
                   }
                });
            	
            	
            	
             })
	    

   });
});


</script>