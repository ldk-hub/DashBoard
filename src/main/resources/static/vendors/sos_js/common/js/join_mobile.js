$(function() {
  $('.slt input').on('click', function() {
    if($(this).prop('checked', true)) {
      $(this).attr('checked', 'checked').addClass('on');
    } else {
      $(this).removeAttr('checked').removeClass('on');
    }
  });
  $('.view_terms span').on('click', function() {
    $(this).next('div').slideToggle();
  })

  // 이메일 직접입력 선택하면 input칸 열기
  $('#email_domain, #fmail_domain').change(function() {
    $selected = $(this).find('option:selected').text();
    if($selected === '직접입력') {
      $('.email_domain_typing').slideDown();
    } else {
      $('.email_domain_typing').slideUp();
    }
  });
  
  $('#email_domain_typing').change(function() {
    $edomain = $(this).val();
    if($edomain !== '') {
      if (validateEmail($edomain)) {
        $('#email_domain option:selected, #fmail_domain option:selected').val($edomain);
      } else {
        //alert('올바른 형식의 이메일을 입력해주세요!\n(@ 제외 입력)');
      }
    } else {
      $('#email_domain option:selected, #fmail_domain option:selected').val('');
      //alert('직접입력시 @을 제외한 이메일 도메인을 반드시 입력하셔야 합니다!');
      $(this).focus();
    }
  });
  
  // 이메일 .com, .net 형식으로 받기
  function validateEmail(email) {
    var re = /^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9]\.[a-zA-Z]{2,}$/;
    return re.test(email);
  }
});

function fjoin_userSelect(f) {
  var userType = f.userType.value;
  switch (userType) {
    // 개인회원(userType == 'p')일 때는 03.html로 이동
    case 'p':
      var joinURL = '03.html';
      break;
    // 벤더회원(userType == 'c')일 때는 06.html로 이동
    case 'c':
      var joinURL = '06.html';
      break;
    default:
      var joinURL = '03.html';
  }
  window.location.href = joinURL;
  return false;
}

function fjoin_submit(f) {
  alert('가입완료 form 넘겨서 완료되면 showModal 호출');
  showModal(true, 'join_complete');

  document.getElementById("btn_submit").disabled = "disabled";
  return false;
}

function ffind_submit(f, findType) {
  if(findType == 'id') {
    // 아이디 찾기 완료되면 아이디 확인 페이지 09.html로 이동
    alert('아이디 찾기 form 넘겨서 아이디 검색 완료되면\n아이디 확인 페이지 09.html로 이동');
    window.location.href = '09.html';
  } else {
    alert('비밀번호 찾기 form 넘겨서 이메일 발송 완료되면 showModal 호출');
    showModal(true, 'find_pw_complete');
  }

  document.getElementById("btn_submit").disabled = "disabled";
  return false;
}