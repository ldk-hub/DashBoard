$(function(){
    $(document).ready(function(){
        // modal 공통 스크립트
        var btn = $('#openModal');
        
        btn.click(function(e) {
            showModal(true, '');
            e.preventDefault();
        });
        
        // header 뒤로 가기 스크립트
        $('body').find('.btn_back a, a.btn_back').click(function(e){
            location.href ="gotoback:";
            
            /*
            alert(parent.history.length);
            
            token = window.Android.getToken();
            alert(token);
            
            window.Android.goToBack();
            
            if(parent.history.length == 1){
                location.href = "gotologin:";
            }else{
                parent.history.go(-1);
                //parent.history.back();
            }
            */
            e.preventDefault();
        });
        
        // 메인 네비게이션(nav) 열기
        var $nav = $('header').find('nav');
        var $nav_bg = $('header').find('.nav_bg');
        var $btn_collapse = $('header').find('#collapse');
        var $gnb = $nav.find('#gnb');
        
        $('header').find('.btn_nav a').click(function(e){
            $('html, body, #wrapper, #wrapper_main').addClass('noscroll');
            $nav.toggleClass('open');
            $nav_bg.toggleClass('open');
            $btn_collapse.toggleClass('open');
            e.preventDefault();
        });
        
        // 메인 네비게이션(nav) 닫기
        $('#collapse, .nav_bg').click(function(e) {
            if($(this).hasClass('open')) {
                $nav.removeClass('open');
                $nav_bg.removeClass('open');
                $btn_collapse.removeClass('open');
                $('html, body, #wrapper, #wrapper_main').removeClass('noscroll');
            }
            
            e.preventDefault();
        });
        
        // 회원가입 공간 선택 취소시 체크 해제 후 이미지 변경
        $('.select_space .md_close').click(function(e) {
            /* checked box 해제하는 건 의미없음.
            $('.slst li').each(function() {
                var $chk = $(this).find('input:checkbox');
                var $img = $(this).find('img');
                
                if($img.length > 0) {
                    var $originSrc = $img.attr('src').replace('_on.png', '.png');
                    
                    if($chk.prop('checked')) {
                        $chk.prop('checked', false);
                        $img.attr('src', $originSrc);
                    }
                }
            });
            */
            
            $('select_space').filter(':not(:animated)').animate({opacity:'hide'}, 250);
            
            e.preventDefault();
        });
        
        $(".slst li").on("click", function() {
            var $spc_slt   = $(this).find("input:checkbox");
            var $img       = $(this).find("img");
            
            var $originSrc = "";
            var $chkSrc    = "";
            
            if($img.length > 0) {
                if($img.attr("src").indexOf("_on.png") !== -1) {
                    $originSrc = $img.attr("src").replace("_on.png", "_off.png");
                } else if($img.attr("src").indexOf("_off.png") !== -1) {
                    $chkSrc = $img.attr("src").replace("_off.png", "_on.png");
                }
                if($spc_slt.prop("checked")) {
                    $img.attr("src", $chkSrc).parent();
                } else {
                    $img.attr("src", $originSrc).parent();
                }
            }
        });
        
        // 메인화면 슬라이더, 메뉴 높이 수정
        var resizeMainHeight = function() {
            if($('.main_body').length !== 0) {
                var $snb = $('.snb');
                var $li = $('.snb > li');
                var $main_height = $(window).height() - ($('header').height() + $('.main_footer').height());
                
                if($main_height > 366) {
                    $('.side, .slider').css({'height' : $main_height + 'px'});
                } else {
                    $('.side, .slider').css({'height' : '366px'});
                }
            }
        };
        
        resizeMainHeight();
        
        $(window).resize(function() {
            resizeMainHeight();
        });
        
        /*
        // 서비스 만족도 조사 별점 스크립트
        $('.stars li').find('input').click(function() {
            $rating = $(this).attr('id');
            $starImg = "url('/common/images/mobile/icon_" + $rating + ".png')";
            $('.stars > ul').css('background-image', $starImg);
        });
        
        // 서비스 만족도 조사 form 넘기기
        $('#frating').submit(function(e) {
            if($(':radio[name="rating_num"]:checked').size() === 0) {
                alert('별을 눌러 서비스 만족도를 선택해주세요!');
                return false;
            } else {
                alert('서비스 만족도 조사 form 넘겨서 완료되면\n 메인 페이지로 이동');
                var $rating_num = $('input[name="rating_num"]:checked').val();
                var $rating_opinion = $('textarea[name="rating_opinion"]').val();
                return;
            }
            
            e.preventDefault();
        });
        */
        
        // 메인 슬라이더(owl-carousel) 호출
        if($('.slider').length !== 0) {
            $('.owl-carousel').owlCarousel({
                items: 1,
                loop: true,
                autoWidth: false,
                dotsEach: true,
                autoplay: true,
                autoplayHoverPause: true,
                navigation : true,
                slideSpeed : 300,
                paginationSpeed : 400,
                singleItem: true,
                rewindSpeed: 500
            });
        }
    });
});


/*******************************************************
 * 리스트 패턴 첫번째 : 타이틀에 이벤트 주기 !!
 * 
 * @param N/A
 * @returns N/A
 * @description 리스트 패턴 첫번째 : 타이틀에 이벤트 주기 [공지사항, 알람, 수리요청 미리보기]
 *******************************************************/
function gf_listEventPatternFirst(){
    var $lstHref = $(".lst li").find("a[id=listTitle]");
    
    $lstHref.unbind("click");
    
    $lstHref.click(function(e){
        var $this = $(this);
        var $detail = $this.next(".detail");
        
        $(".lst .detail").slideUp();
        
        if (!$this.hasClass("active")) {
            $detail.slideDown(function() {
                $lstHref.removeClass("active");
                $this.addClass("active");
            });
        } else {
            $detail.slideUp(function() {
                $this.removeClass("active");
            });
        }
        
        e.preventDefault();
    });
}

/*******************************************************
 * Mobile Dialog 창 열기 !!
 * 
 * @param {object} opt
 * @returns N/A
 * @description Mobile Dialog 창 열기 !!
 *******************************************************/
function gf_openMobileModal() {
    var args = gf_openMobileModal.arguments;
    
    var opt = args.length > 0 ? args[0] : {};
    
    var targetId = opt.targetId == null ? "openMobilePop" : opt.targetId;    // target Id
    
    gf_showMobileModal(true, targetId);
}

/*******************************************************
 * Mobile Dialog 창 닫기 !!
 * 
 * @param {object} opt
 * @returns N/A
 * @description Mobile Dialog 창 닫기 !!
 *******************************************************/
function gf_closeMobileModal(){
    var args = gf_closeMobileModal.arguments;
    
    var opt = args.length > 0 ? args[0] : {};
    
    var targetId   = opt.targetId;
    var targetType = opt.targetType;
    
    var targetObj = $("#" + targetId);
    
    if(targetType == "animate"){
        targetObj.filter(':not(:animated)').animate({opacity:'hide'}, 250);
    } else {
        targetObj.hide();
    }
}

/*******************************************************
 * Mobile Dialog 창 열기 !!
 * 
 * @param {object} opt
 * @returns N/A
 * @description Mobile Dialog 창 열기 !!
 *******************************************************/
function gf_showMobileModal(flag, targetId) {
    var targetObj = $("#" + targetId);
    
    if(flag) {
        targetObj.filter(':not(:animated)').animate({opacity:'toggle'}, 250);
        
/*        targetObj.find('.md_bg').click(function() {
            targetObj.filter(':not(:animated)').animate({opacity:'hide'}, 250);
        });
*/        
        targetObj.find('.md_bg').bind('touchmove', function(e) {
        	e.preventDefault();
        });
        
        $('.md_close').click(function(e) {
            targetObj.filter(':not(:animated)').animate({opacity:'hide'}, 250);
            e.preventDefault();
        });
        
        $('.md_close_space').click(function(e) {
            targetObj.filter(':not(:animated)').animate({opacity:'hide'}, 250);
            e.preventDefault();
        });
        
        $('#clear_canvas').click(function(e) {
            // 취소 버튼 클릭시 서명 지우기
            var canvas = document.getElementById('drawSignature');
            var context = canvas.getContext('2d');
            
            context.clearRect(0, 0, canvas.width, canvas.height);
            var w = canvas.width;
            canvas.width = 1;
            canvas.width = w;
            context.strokeStyle = "#000000";
            context.lineWith = 2;
            
            targetObj.filter(':not(:animated)').animate({opacity:'hide'}, 250, function(){
                document.getElementById('help_txt').style.visibility = "visible";
            });
            e.preventDefault();
        });
    }
}

/*******************************************************
 * Common Alert Mobile Dialog 창 열기 !!
 * 
 * @param {string} msg
 * @param {string} opt
 * @returns N/A
 * @description Common Alert Mobile Dialog 창 열기 !!
 *******************************************************/
function gf_openCommAlertModal(){
    var args = gf_openCommAlertModal.arguments;
    
    var msg = args[0];
    var opt = args.length > 1 ? args[1] : "text";
    
    // Message Setting !!
    var divObj = $("#chkAlert");
    
    var msgObj = $("#md_body_txt", divObj);
    
    if(opt == "html"){
        msgObj.html(msg);
    } else {
        msgObj.text(msg);
    }
    
    gf_openMobileModal({targetId:"chkAlert"});
}

/*******************************************************
 * Common Alert Mobile Dialog 창 열기 : 확인에 대한 Event !!
 * 
 * @param {string} msg
 * @param {string} opt
 * @returns N/A
 * @description Common Alert Mobile Dialog 창 열기 : 확인에 대한 Event !!
 *******************************************************/
function gf_openCommAlertEvtModal(){
    var args = gf_openCommAlertEvtModal.arguments;
    
    var msg   = args[0];
    var evt   = args.length > 1 ? args[1] : null;
    var param = args.length > 2 ? args[2] : null;
    var opt   = args.length > 3 ? args[3] : "text";
    
    var divObj = $("#chkAlertEvt");
    
    // Message Setting !!
    var msgObj = $("#md_body_txt", divObj);
    
    if(opt == "html"){
        msgObj.html(msg);
    } else {
        msgObj.text(msg);
    }
    
    // Event 지우기 처리 !!
    $("a", divObj).unbind("click");
    
    // Event 처리 !!
    $("a", divObj).on("click", function(e){
        e.preventDefault();
        
        if(typeof(evt) == "function") {
            if(param != null){
                evt(param);
            } else {
                evt();
            }
        }
    });
    
    gf_openMobileModal({targetId:"chkAlertEvt"});
}

/*******************************************************
 * Common Confirm Mobile Dialog 창 열기 !!
 * 
 * @param {string} msg
 * @param {string} evt
 * @param {string} opt
 * @returns N/A
 * @description Common Confirm Mobile Dialog 창 열기 !!
 *******************************************************/
function gf_openCommConfirmModal(){
    var args = gf_openCommConfirmModal.arguments;
    
    var msg   = args[0];
    var evt   = args.length > 1 ? args[1] : null;
    var param = args.length > 2 ? args[2] : null;
    var opt   = args.length > 3 ? args[3] : "text";
    
    // Message Setting !!
    var divObj = $("#chkConfirm");
    
    var msgObj = $("#md_body_txt", divObj);
    
    if(opt == "html"){
        msgObj.html(msg);
    } else {
        msgObj.text(msg);
    }
    
    // Event 지우기 처리 !!
    $("a:eq(1)", divObj).unbind("click");
    
    // Event 처리 !!
    $("a:eq(1)", divObj).on("click", function(e){
        e.preventDefault();
        
        if(typeof(evt) == "function") {
            if(param != null){
                evt(param);
            } else {
                evt();
            }
        }
    });
    
    gf_openMobileModal({targetId:"chkConfirm"});
}

/*******************************************************
 * Common Search Mobile Dialog 창 열기 !!
 * 
 * @param {string} msg
 * @param {string} evt
 * @param {string} opt
 * @returns N/A
 * @description Common Search Mobile Dialog 창 열기 !!
 *******************************************************/
function gf_openCommSearchModal(){
    var args = gf_openCommSearchModal.arguments;
    
    var evt   = args[0];
    var param = args.length > 1 ? args[1] : null;
    var opt   = args.length > 2 ? args[2] : "text";
    
    // Title Setting !!
    var divObj = $("#commSearchModalPop");
    
    // 검색 팝업 Title : V_COMM_SEARCH_TITLE 함수는 각 검색 페이지에서 설정 해줌.
    var commSearchTitle = typeof V_COMM_SEARCH_TITLE == "undefined" ? "공통 검색" : V_COMM_SEARCH_TITLE;
    
    $(".md_header", divObj).text(commSearchTitle);
    
    // Event 지우기 처리 !!
    $("button", divObj).unbind("click");
    
    // Event 처리 !!
    $("button", divObj).on("click", function(e){
        e.preventDefault();
        
        if(typeof(evt) == "function") {
            if(param != null){
                evt(param);
            } else {
                evt();
            }
        }
    });
    
    gf_openMobileModal({targetId:"commSearchModalPop"});
}

/*******************************************************
 * Common Search 초기 페이지 설정 !!
 * 
 * @param {string} __userType
 * @returns N/A
 * @description Common Search 초기 페이지 설정 !!
 * : 개인[PC] 일 경우 기업승인[01], 기업 반려[02] 는 remove()
 *******************************************************/
function gf_initPageCommSearchSetting(__userType, pageName){
    $("#commSearchModalPop #pSvcStat option").each(function(idx){
        $(this).show();
    });
    
    
    if(__userType == "PC"){
        $("#commSearchModalPop #pSvcStat option").each(function(idx){
            if($(this).val() == "01" || $(this).val() == "02"){
                $(this).hide();
            }
        });
    } else if(__userType == "VW" || __userType == "PW"){
        if(pageName == "repairList"){
            $("#commSearchModalPop #pSvcStat option").each(function(idx){
                if($(this).val() == "01" || $(this).val() == "02"){
                    $(this).hide();
                }
            });
        } else if(pageName == "wkasList"){
            $("#commSearchModalPop #pSvcStat option").each(function(idx){
                if(idx > 0 && !($(this).val() == "20" || $(this).val() == "30")){
                    $(this).hide();
                }
            });
        }
    }
}

/*******************************************************
 * 달력 !!
 * 
 * @param {string} targetId
 * @param {string} opt [dynamic/static] : 동적으로 달력을 적용할 경우 처리
 * @description 달력
 *******************************************************/
function gf_setCalendarMobile(){
    var args = gf_setCalendarMobile.arguments;
    
    var targetId = args[0];
    var opt      = args.length > 0 ? args[1] : "static";
    
    
    $("#" + targetId + " .date_picker").each(function() {
        // 동적으로 달력을 추가할 경우 Class를 지우고 들어감.
        if(opt == "dynamic"){
            $(this).removeClass("hasDatepicker");
        }
        
        $(this).datepicker({
           /* Button으로 설정시
            showOn: "button"
           ,buttonImage: "images/btn_cal.png"
           ,buttonImageOnly: true
           ,buttonText: "날짜 선택"
           ,buttonClass: "find_date"
           */
            dateFormat: "yy-mm-dd"
           ,dayNames: ["sun", "mon", "tue", "wed", "thu", "fri", "sat"]
           ,dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"]
           ,dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"]
           ,monthNames: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
           ,monthNamesShort: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
           ,changeMonth: true 
           ,changeYear: true
           ,prevText: "이전달"
           ,nextText: "다음달"
           ,showOtherMonths: true
           ,showMonthAfterYear: true
            
           ,beforeShowDay: function (day,year) {
                var result;
                
                switch (day.getDay()) {
                    case 0: // 일요일?
                        result = [true, "ui-date-sunday"];
                        break;
                    case 6: // 토요일?
                        result = [true, "ui-date-saturday"];
                        break;
                    default:
                        result = [true, ""];
                        break;
                }
                
                return result;
            }
           ,onSelect: function (dateText, obj) {
                if(typeof(gf_onSelectCalendar) == "function") {
                    gf_onSelectCalendar(dateText, obj);
                }
            }
        });
        
        $(".ui-datepicker-calendar > thead td.ui-datepicker-week-end:last-child a").addClass("ui-date-saturday");
    });
}