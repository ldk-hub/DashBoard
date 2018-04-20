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
            <form>
              <h1>계정을 생성하세요.</h1>
              <div>
                <input type="text" class="form-control" placeholder="ID" required="" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Password" required="" />
              </div>
              <div>
                <input type="email" class="form-control" placeholder="Email" required="" />
              </div>
              <div>
                <input type="text" class="form-control" placeholder="Name" required="" />
              </div>
              <div>
                <a class="btn btn-default submit" href="#">확인</a>
                 <a class="btn btn-default submit" href="#">취소</a>
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
  </body>
</html>
