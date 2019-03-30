<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- top navigation -->
<div class="top_nav">
    <div class="nav_menu">
        <nav>
            <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>

            <ul class="nav navbar-nav navbar-right">
                <li class="">
                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <img src="/static/images/user.png" alt=""><sec:authentication property="principal.username" />
                        <span class=" fa fa-angle-down"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                    	<li><a href="secondery"><i class="fa fa-tachometer pull-right"></i>실시간모니터링</a></li>
               			<li><a href="thirdy"><i class="fa fa-cogs pull-right"></i>실시간이벤트 관리</a></li>
                        <li><a href="mypage"><i class="fa fa-child pull-right"></i> 마이페이지</a></li>
                        <li><a href="logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!-- /top navigation -->

<script src="/static/vendors/jquery/dist/jquery.min.js"></script>


<script type="text/javascript">
/* 헤더로 축소시킬경우 시계 숨기기 */
$('#menu_toggle').click(function(){
	
	if($('#clock').is(':visible')){
		$('#clock').hide();
	}else{
		$('#clock').show();
	}
	
});
	
	
</script>
