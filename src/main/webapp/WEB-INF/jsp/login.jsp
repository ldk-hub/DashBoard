<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>통계정보사이트 </title>
    <!-- Bootstrap -->
    <link href="/static/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/static/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/static/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="/static/vendors/animate.css/animate.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="/static/css/custom.min.css" rel="stylesheet">
    
    <!-- 비밀번호 이메일 찾기 -->
	<script type="text/javascript">	
		function passEmail(){
			var	passId = $('#passId').val(),
			passMail = $('#passMail').val();
			
			if(passId ==""){
				alert("아이디를 입력하시오.");
				passId.focus();
				return false;
			}else if(passMail ==""){
				alert("이메일 주소를 입력하시오.");
				passMail.focus();
				return false;
			}
			$.ajax({
					url : '/sendPw.do',
					data : {
						"userId" : passId,
						"email" : passMail
					},
					type : 'POST',
					success : function(data) {
						alert(data);
						alert("이메일 전송 완료");
						$('#PassModal').modal('hide')
					}
				});
		}
	</script>
  </head>
  <body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form>
              <h1>환영합니다.</h1>
              <div>
                <input type="text" class="form-control" placeholder="ID" required="" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Password" required="" />
              </div>
              <div>
                <a class="btn btn-default submit" href="dashboard">로그인</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">처음 방문이신가요?
                  <a href="#signup" class="to_register"> 회원가입 </a>
                </p>
				
                <div class="clearfix"></div>
                <br />
				<button type="button" class="btn btn-sm btn-success"
							data-toggle="modal" data-target="#PassModal">비밀번호 찾기</button>		 
                <div>
                  <h1><i class="fa fa-paw"></i>LeeDongOk`s Site</h1>
                  <p>©2018 All Rights Reserved. LeeDongOk Develop Site</p>
                </div>
              </div>
              
            </form>
          </section>
        </div>

        <div id="register" class="animate form registration_form">
          <section class="login_content">
             <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                     
              <h2>계정을 생성하세요.</h2>
              
               <div class="item form-group">
                	<input id="name" class="form-control" data-validate-length-range="14" data-validate-words="10" 
                	name="name" placeholder="아이디" required="required" type="text">
               </div>
                
                <div class="item form-group">
                 	<input id="password" type="password" name="password" placeholder="비밀번호" 
                 	 data-validate-length="6,14" class="form-control" required="required">
           	 	</div>
               <div class="item form-group">
	                <input id="password2" type="password" name="password2" placeholder="비밀번호 확인"
	                data-validate-linked="password" class="form-control" required="required">
               </div>
               
               <div class="item form-group">
                <input id="first-name" class="form-control" data-validate-length-range="14" data-validate-words="10" 
                	name="name" placeholder="가입자 성명" required="required" type="text">
               </div>
               
               <div class="form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12">성별</label>
                  <div class="col-md-9 col-sm-9 col-xs-12">
                    <div id="gender" class="btn-group" data-toggle="buttons">
                      <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                        <input type="radio" name="gender" value="male"> &nbsp; 남자 &nbsp;
                      </label>
                      <label class="btn btn-primary" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                        <input type="radio" name="gender" value="female"> &nbsp; 여자 &nbsp;
                      </label>
                    </div>
                  </div>
                </div>
               <div class="item form-group">
                      <input type="email" id="email" name="email" placeholder="이메일 주소" required="required" class="form-control">
               </div>
                
			  <div class="form-group">
                 <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                 	<button type="submit" class="btn btn-info" >가입</button>
                 	<button type="button" class="btn btn-info"  onclick = "location.href = '#signin' " >취소</button>
                 </div>
              </div>
              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">환영합니다.
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i>LeeDongOk`s Site</h1>
                  <p>©2018 All Rights Reserved. LeeDongOk Develop Site</p>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
     			<!-- 비밀번호 분실정보 모달 -->
				<div class="modal fade" id="PassModal" tabindex="-1" role="dialog"
					aria-labelledby="ModalLabel" >
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">×</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="ModalLabel">비밀번호 분실 찾기</h4>
							</div>
							<div class="modal-body">
								<div class="modal-body">
									<label for="userid_acc">아이디 </label>
									<input name="userid_acc" value=''
										id="passId" placeholder="ID" type="text" class="form-control" />
								</div>
								<div class="modal-body">
									<label for="email_acc">이메일</label> <input name="email_acc"
										id="passMail" value='' placeholder="E-Mail" type="text"
										class="form-control" />
								</div>
								</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-warning" OnClick="passEmail()">메일 보내기</button>
								<button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>

	<!-- ajax -->
	<script src="/static/vendors/jquery/src/ajax.js"></script>
    <!-- jQuery -->
    <script src="/static/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="/static/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="/static/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="/static/vendors/nprogress/nprogress.js"></script>
    <!-- validator -->
    <script src="/static/vendors/validator/validator.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="/static/js/custom.min.js"></script>
  </body>
</html>



