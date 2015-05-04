<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function login() {
		window
				.open("/myCINE/member/login.jsp", "login",
						"width=600 height=400");
	}
</script>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a href="/myCINE/index.jsp"><img src="/myCINE/image/logo.jpg" id="logo" /></a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<li><a href="#">회사소개</a></li>
				<li><a href="#">영화리뷰</a></li>
				<li><a href="/myCINE/request/requestList.jsp">영화요청</a></li>
				<li><a href="/myCINE/qna/QnAList.jsp">QnA</a></li>
				<li><a href="/myCINE/event/event_Main.jsp">이벤트</a></li>
			</ul>
			<div class="pull-right">
				<ul class="nav navbar-nav">
					<li>
						<div class="col-sm-12"
							style="padding-bottom: 8px; padding-top: 8px;">
							<form action="">
								<table>
									<tr>
										<td><input type="text" class="form-control"
											placeholder="search"></td>
										<td><a href="#" class="btn btn-info btn"><span
												class="glyphicon glyphicon-search" data-toggle="tooltip"
												title="검색"></span> Search</a></td>
									</tr>
								</table>
							</form>
						</div>
					</li>
				</ul>
			</div>
			<%
				String id = (String) session.getAttribute("id");
				if (id == null || id.equals("")) {
			%>
			<div class="pull-right">
				<ul class="nav navbar-nav">
					<li><a href="javascript:login()"> <span
							class="glyphicon glyphicon-user" data-toggle="tooltip"
							title="로그인"></span>
					</a></li>
					<li><a href="/myCINE/member/join.jsp"><span
							class="glyphicon glyphicon-plus" data-toggle="tooltip"
							title="회원가입"></span></a></li>
				</ul>
			</div>
			<%
				} else {
			%>
			<div class="pull-right">
				<ul class="nav navbar-nav">
					<li><a href="/myCINE/member/memberInfo.jsp" id="logining"><%=id %>님 로그인중</a></li>
					<li><a href="/myCINE/member/logout.jsp"><span
							class="glyphicon glyphicon-off" data-toggle="tooltip"
							title="로그이웃"></span></a></li>
				</ul>
			</div>
			<%
				}
			%>

		</div>
	</div>
</nav>