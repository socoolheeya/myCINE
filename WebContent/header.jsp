<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#profilePhoto{
	width: 15px;
	height: 15px;
}
</style>
<script>
	function login() {
		window.open("loginForm.do", "login",
						"width=400 height=400 left=500 top=100");
	}

</script>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a href="/myCINE/main.do"><img src="/myCINE/image/logo.jpg" id="logo" /></a>
		</div>
		<div>
			<div class="dropdown">
			<ul class="nav navbar-nav">
				<li><a href="/myCINE/company/companyMain.jsp">회사소개</a></li>
				<li><a href="/myCINE/reviewList.dp">영화리뷰</a></li>
				<li><a href="/myCINE/requestList.do">영화요청</a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="/myCINE/qna/QnAList.jsp">QnA<span class="caret"></span></a>
					 <ul class="dropdown-menu">
					 <li><a href="/myCINE/qna/FAQ.jsp">자주하는 질문(FAQ)</a></li>
					 <li><a href="/myCINE/qna/QnAList.jsp">질문하기</a></li>
					 </ul>
				</li>
				<li><a href="/myCINE/event/event_Main.jsp">이벤트</a></li>
			</ul>
			</div>
			<div class="pull-right">
				<ul class="nav navbar-nav">
					<li>
						<div class="col-sm-12"
							style="padding-bottom: 8px; padding-top: 8px;">
							<form action="/myCINE/search/search.jsp">
								<table>
									<tr>
										<td><input type="text" name="searchKeyword" class="form-control"
											placeholder="search"></td>
										<td><button type="submit" class="btn btn-info">
										<span class="glyphicon glyphicon-search" data-toggle="tooltip" title="검색"></span>검색
										</button></td>
									</tr>
								</table>
							</form>
						</div>
					</li>
				</ul>
			</div>
			<c:set var="id" value="${sessionScope.id }"/>
			<c:if test="${empty id }">
			<div class="pull-right">
				<ul class="nav navbar-nav">
					<li><a href="javascript:login()"> <span
							class="glyphicon glyphicon-user" data-toggle="tooltip"
							title="로그인"></span>
					</a></li>
					<li><a href="/myCINE/joinForm.do"><span
							class="glyphicon glyphicon-plus" data-toggle="tooltip"
							title="회원가입"></span></a></li>
				</ul>
			</div>
			</c:if>
			<c:if test="${not empty id }">
			<div class="pull-right">
				<ul class="nav navbar-nav">
					<li><a href="/myCINE/memberInfoForm.do" id="logining" title="${dto.point }P 보유중!" data-toggle="popover"  data-placement="bottom" data-content="">${id }님</a></li>
					<li><a href="/myCINE/logout.do"><span
							class="glyphicon glyphicon-off" data-toggle="tooltip"
							title="로그아웃"></span></a></li>
				</ul>
			</div>
			</c:if>
		</div>
	</div>
</nav>