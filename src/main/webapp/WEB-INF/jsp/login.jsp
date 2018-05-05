<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
                  <a class="reset_pass" href="#"> 비밀번호 찾기</a>
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

        <div id="register" class="animate form registration_form">
          <section class="login_content">
             <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                     
              <h1>계정을 생성하세요.</h1>
              
               <div class="item form-group">
                <input id="name" class="form-control" data-validate-length-range="6" data-validate-words="2" 
                	name="name" placeholder="ID" required="required" type="text">
               </div>
              <div>
                <input type="text" class="form-control" placeholder="ID" required="true" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Password" required="true" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="PasswordConfirm" required="true" />
              </div>
              <div>
                <input type="text" class="form-control" placeholder="Email" required="true" />
              </div>
              <div>
                <input type="text" class="form-control" placeholder="Name" required="true" />
              </div>
             
			  <div class="form-group">
                 <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                   <a href="#" class="btn btn-info" role="submit">가입</a>
                   <a href="#signin" class="btn btn-info" role="button">취소</a>
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
    
    <!-- Parsley -->
    <script src="../vendors/parsleyjs/dist/parsley.min.js"></script>
    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- validator -->
    <script src="../vendors/validator/validator.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
  </body>
</html>



