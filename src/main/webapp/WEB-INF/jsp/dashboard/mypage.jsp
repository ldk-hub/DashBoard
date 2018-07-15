<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- page content -->
        <div class="right_col" role="main">
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>회원 프로필 </h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <div class="col-md-3 col-sm-3 col-xs-12 profile_left">
                      <div class="profile_img">
                        <div id="crop-avatar">
                          <!-- Current avatar -->
                          <img class="img-responsive avatar-view" src="/static/images/picture.png" alt="Avatar" title="Change the avatar">
                        </div>
                      </div>
                      <h3><sec:authentication property="principal.username" /></h3>

                      <ul class="list-unstyled user_data">
                        <li><i class="fa fa-map-marker user-profile-icon"></i> 경기도 파주시 와동동 
                        </li>

                        <li>
                          <i class="fa fa-briefcase user-profile-icon"></i> JAVA개발자
                        </li>

                        <li class="m-top-xs">
                          <i class="fa fa-external-link user-profile-icon"></i>
                          <a href="https://github.com/leedongok" target="_blank">github.com/leedongok</a>
                        </li>
                      </ul>
					<button type="button" class="btn btn-success"
							data-toggle="modal" data-target="#updateUsermodal">회원 정보등록</button>
                      <br />

                    

                    </div>
                    <div class="col-md-9 col-sm-9 col-xs-12">
                      <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">참여 프로젝트</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">방명록</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">업무 역량</a>
                          </li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
							<!-- start user projects -->
                            <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
                                  <th>순번</th>
                                  <th>프로젝트명</th>
                                  <th>계약 업체</th>
                                  <th>개발시간(Hour)</th>
                                  <th>프로젝트기여도</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td>1</td>
                                  <td>프로시저개발 및 웹 시스템 개발</td>
                                  <td>LG Display</td>
                                  <td class="hidden-phone">890</td>
                                  <td class="vertical-align-mid">
                                    <div class="progress">
                                      <div class="progress-bar progress-bar-success" data-transitiongoal="35"></div>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>2</td>
                                  <td>시스템 유지보수</td>
                                  <td>LG electronics</td>
                                  <td class="hidden-phone">450</td>
                                  <td class="vertical-align-mid">
                                    <div class="progress">
                                      <div class="progress-bar progress-bar-danger" data-transitiongoal="15"></div>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>3</td>
                                  <td>프로젝트 수행사 </td>
                                  <td>비즈테크파트너스</td>
                                  <td class="hidden-phone">2000</td>
                                  <td class="vertical-align-mid">
                                    <div class="progress">
                                      <div class="progress-bar progress-bar-success" data-transitiongoal="75"></div>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>4</td>
                                  <td>시스템 개발 및 인프라 유지보수</td>
                                  <td>한국상조공제조합</td>
                                  <td class="hidden-phone">3000</td>
                                  <td class="vertical-align-mid">
                                    <div class="progress">
                                      <div class="progress-bar progress-bar-success" data-transitiongoal="90"></div>
                                    </div>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                            <!-- end user projects -->
                          
                          </div>
                          <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
  							<!-- start recent activity -->
                            <ul class="messages">
                              <li>
                                <img src="/static/images/user.png" class="avatar" alt="Avatar">
                                <div class="message_date">
                                  <h3 class="date text-info">24</h3>
                                  <p class="month">May</p>
                                </div>
                                <div class="message_wrapper">
                                  <h4 class="heading">Desmond Davison</h4>
                                  <blockquote class="message">Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua butcher retro keffiyeh dreamcatcher synth.</blockquote>
                                  <br />
                                </div>
                              </li>
                              <li>
                                <img src="/static/images/user.png" class="avatar" alt="Avatar">
                                <div class="message_date">
                                  <h3 class="date text-error">21</h3>
                                  <p class="month">May</p>
                                </div>
                                <div class="message_wrapper">
                                  <h4 class="heading">Brian Michaels</h4>
                                  <blockquote class="message">Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua butcher retro keffiyeh dreamcatcher synth.</blockquote>
                                  <br />
                                </div>
                              </li>
                              <li>
                                <img src="/static/images/user.png" class="avatar" alt="Avatar">
                                <div class="message_date">
                                  <h3 class="date text-info">24</h3>
                                  <p class="month">May</p>
                                </div>
                                <div class="message_wrapper">
                                  <h4 class="heading">Desmond Davison</h4>
                                  <blockquote class="message">Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua butcher retro keffiyeh dreamcatcher synth.</blockquote>
                                  <br />
                                </div>
                              </li>
                              <li>
                                <img src="/static/images/user.png" class="avatar" alt="Avatar">
                                <div class="message_date">
                                  <h3 class="date text-error">21</h3>
                                  <p class="month">May</p>
                                </div>
                                <div class="message_wrapper">
                                  <h4 class="heading">Brian Michaels</h4>
                                  <blockquote class="message">Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua butcher retro keffiyeh dreamcatcher synth.</blockquote>
                                  <br />
                                </div>
                              </li>

                            </ul>
                         <!-- end recent activity -->

						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="clearfix"></div>
							<div class="x_content">
								<div id="alerts"></div>
								<div class="btn-toolbar editor" data-role="editor-toolbar"
									data-target="#editor-one">
									<div class="btn-group">
										<a class="btn dropdown-toggle" data-toggle="dropdown"
											title="Font"><i class="fa fa-font"></i><b
											class="caret"></b></a>
										<ul class="dropdown-menu">
										</ul>
									</div>

									<div class="btn-group">
										<a class="btn dropdown-toggle" data-toggle="dropdown"
											title="Font Size"><i class="fa fa-text-height"></i>&nbsp;<b
											class="caret"></b></a>
										<ul class="dropdown-menu">
											<li><a data-edit="fontSize 5">
													<p style="font-size: 17px">Huge</p>
											</a></li>
											<li><a data-edit="fontSize 3">
													<p style="font-size: 14px">Normal</p>
											</a></li>
											<li><a data-edit="fontSize 1">
													<p style="font-size: 11px">Small</p>
											</a></li>
										</ul>
									</div>

									<div class="btn-group">
										<a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i
											class="fa fa-bold"></i></a> <a class="btn" data-edit="italic"
											title="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a>
										<a class="btn" data-edit="strikethrough"
											title="Strikethrough"><i class="fa fa-strikethrough"></i></a>
										<a class="btn" data-edit="underline"
											title="Underline (Ctrl/Cmd+U)"><i
											class="fa fa-underline"></i></a>
									</div>

									<div class="btn-group">
										<a class="btn" data-edit="insertunorderedlist"
											title="Bullet list"><i class="fa fa-list-ul"></i></a> <a
											class="btn" data-edit="insertorderedlist"
											title="Number list"><i class="fa fa-list-ol"></i></a> <a
											class="btn" data-edit="outdent"
											title="Reduce indent (Shift+Tab)"><i
											class="fa fa-dedent"></i></a> <a class="btn"
											data-edit="indent" title="Indent (Tab)"><i
											class="fa fa-indent"></i></a>
									</div>

									<div class="btn-group">
										<a class="btn" data-edit="justifyleft"
											title="Align Left (Ctrl/Cmd+L)"><i
											class="fa fa-align-left"></i></a> <a class="btn"
											data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i
											class="fa fa-align-center"></i></a> <a class="btn"
											data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i
											class="fa fa-align-right"></i></a> <a class="btn"
											data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i
											class="fa fa-align-justify"></i></a>
									</div>

									<div class="btn-group">
										<a class="btn dropdown-toggle" data-toggle="dropdown"
											title="Hyperlink"><i class="fa fa-link"></i></a>
										<div class="dropdown-menu input-append">
											<input class="span2" placeholder="URL" type="text"
												data-edit="createLink" />
											<button class="btn" type="button">Add</button>
										</div>
										<a class="btn" data-edit="unlink" title="Remove Hyperlink"><i
											class="fa fa-cut"></i></a>
									</div>
								</div>
								<div id="editor-one" class="editor-wrapper"></div>
								<textarea name="descr" id="descr" style="display: none;"></textarea>
								<br />
								<div class="ln_solid"></div>
							</div>
						</div>
					</div>
					
                          <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                              <!-- start skills -->
		                      <h4>업무 역량</h4>
		                      <ul class="list-unstyled user_data">
		                        <li>
		                          <p>백엔드 개발 스킬</p>
		                          <div class="progress progress_sm">
		                            <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="70"></div>
		                          </div>
		                        </li>
		                        <li>
		                          <p>UI / UX 디자인 역량</p>
		                          <div class="progress progress_sm">
		                            <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="30"></div>
		                          </div>
		                        </li>
		                        <li>
		                          <p>프론트 개발 스킬</p>
		                          <div class="progress progress_sm">
		                            <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="60"></div>
		                          </div>
		                        </li>
		                        <li>
		                          <p>데이터 베이스 역량</p>
		                          <div class="progress progress_sm">
		                            <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="90"></div>
		                          </div>
		                        </li>
		                      </ul>
		                      <!-- end of skills -->
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- 회원정보 수정 모달 -->
				<div class="modal fade" id="updateUsermodal" tabindex="-1" role="dialog"
					aria-labelledby="ModalLabel" >
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">×</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="ModalLabel">상세 내역 등록</h4>
							</div>
							<div class="modal-body">
							<div class="modal-body">
									<label for="email_acc">거주지역</label> <input name="email_acc"
										id="passMail" value='' placeholder="사는지역 읍/면/동 또는 도로명 주소 기입" type="text"
										class="form-control" />
								</div>
								<div class="modal-body">
									<label for="userid_acc">업무 포지션 </label>
									<input name="userid_acc" value=''
										id="passId" placeholder="EX) 개발, 인사, 경영 등" type="text" class="form-control" />
								</div>
								<div class="modal-body">
									<label for="email_acc">개인 블로그</label> <input name="email_acc"
										id="passMail" value='' placeholder="URL 주소" type="text"
										class="form-control" />
								</div>
								<div class="modal-body">
									<label for="email_acc">프로젝트명</label> <input name="email_acc"
										id="passMail" value='' placeholder="프로젝트명 기입" type="text"
										class="form-control" />
								</div>
								<div class="modal-body">
									<label for="email_acc">계약업체</label> <input name="email_acc"
										id="passMail" value='' placeholder="회사명" type="text"
										class="form-control" />
								</div>
								<div class="modal-body">
									<label for="email_acc">개발시간</label> <input name="email_acc"
										id="passMail" value='' placeholder="EX)800시간 -> 800" type="text"
										class="form-control" />
								</div>
								<div class="modal-body">
									<label for="email_acc">프로젝트 기여도</label> <input name="email_acc"
										id="passMail" value='' placeholder="숫자만 기입" type="text"
										class="form-control" />
								</div>
								</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-warning" OnClick="">등록</button>
								<button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
        <!-- /page content -->