<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- top navigation -->
<div class="top_nav">
    <div class="nav_menu" style="background:#363636">
        <nav>
            <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>

            <ul class="nav navbar-nav navbar-right">
                <li class="">
                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="color:#5197fd">
                        <img src="/static/images/user.png" alt="">
				     <span style="color:#fff">
					<!-- 로그아웃, 회원정보 기능 -->
					<sec:authorize access="isAuthenticated()">
					<!-- 인증이 완료되지 않으면 Null들어감 인증완료후에 호출해야됨 -->
						<sec:authentication property="principal.username" var="user_id"/>${user_id}
					</sec:authorize>
				    </span>
                        <span class=" fa fa-angle-down" style="color:#FF8000"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-usermenu pull-right">
	                    <li><a href="dashboard"><i class="fa fa-desktop pull-right"></i>통합정보</a></li>
	                    <li><a href="hyopage"><i class="fa fa-bar-chart-o pull-right"></i>데이터차트</a></li>
	                    <li><a href="calendar"><i class="fa fa-calendar pull-right"></i>일정표</a></li>
                    	<li><a href="secondery"><i class="fa fa-tachometer pull-right"></i>모니터링</a></li>
               			<li><a href="thirdy"><i class="fa fa-cogs pull-right"></i>이벤트관리</a></li>
               			<li><a href="tradeService"><i class="fa fa-btc pull-right"></i> 거래소</a></li>
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
	/* 헤더로 축소시킬경우 시계 숨기기 그리드 초기화 */
 $('#menu_toggle').click(function() {
	if($('#clock').is(':hidden') == 'true'){ 
		$('#clock').show();
		grid1.refreshLayout();
	}else{
		$('#clock').hide();
		grid1.refreshLayout();
	}
});
	
</script>
