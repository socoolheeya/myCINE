<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mycine.member.*" %>
<jsp:useBean id="mDAO" class="mycine.member.MemberDAO"/>
<jsp:useBean id="mDTO" class="mycine.member.MemberDTO"/>
<jsp:setProperty property="*" name="mDTO"/>
 <%
 	String id_s = (String)session.getAttribute("id");
 	MemberDTO mdto = mDAO.getMember(id_s);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=id_s %>님의 정보 페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 70%;
	margin: auto;
}
#logining{
	font-size: 12px;
}
</style>

</head>
<script type="text/javascript">
function searchAddr() {
	window.open("updateSearchAddr.jsp", "updateSearchAddr",
			"width=800 height=500 left=200 top=100");
}
function deletePro() {
	window.open("deletePro.jsp", "deletePro", "width=350 height=200");
}
	function email_change() {
		if (document.join.email3.options[document.join.email3.selectedIndex].value == '0') {
			document.join.email3.disabled = true;
			document.join.email3.value = "";
		}
		if (document.join.email3.options[document.join.email3.selectedIndex].value == '9') {
			document.join.email2.disabled = false;
			document.join.email2.value = "";
			document.join.email2.focus();
		} else {
			document.join.email2.disabled = true;
			document.join.email2.value = document.join.email3.options[document.join.email3.selectedIndex].value;
		}
	}
function cancel() {
		location.href = "/myCINE/index.jsp";
}
</script>
</head>
<body>
	<div class="container-fluid">
		<header>
			<div class="row">
				<span class="col-sm-2"></span> <span class="col-sm-8"
					style="background-color: #ffcc00;"> <a
					href="/myCINE/index.jsp"><img src="/myCINE/image/logo.jpg" /></a>
				</span> <span class="col-sm-2"></span>
			</div>
		</header>
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8" style="background-color: lavenderblush;">
				<section>
					<article>
						<h2 style="font-size: 40px; font-weight: bold;">회원 정보 수정</h2>
						<form name="join" action="memberInfo_ok.jsp">
							<div class="form-group">
								<table class="table table-bordered">
									<tr>
										<td width="130px" style="font-size: 19px; font-weight: bold;">아이디(ID)</td>
										<td><div class="col-xs-3">
												<input type="text" class="form-control" name="id" value="<%=id_s %>"
													readonly="readonly" required="required">
											</div>
									</tr>
									<tr>
										<td style="font-size: 19px; font-weight: bold;">비밀번호</td>
										<td><div class="col-xs-3">
												<input type="password" class="form-control" name="pwd" value="<%=mdto.getId() %>" placeholder="비밀번호 입력">
											</div></td>
									</tr>
									<tr>
										<td style="font-size: 19px; font-weight: bold;">이름</td>
										<td><div class="col-xs-3">
												<input type="text" class="form-control" name="name" value="<%=mdto.getName()%>" readonly="readonly">
											</div></td>
									</tr>

									<tr>
										<td style="font-size: 19px; font-weight: bold;">Email</td>
										<td><span class="col-xs-4"> <input type="text"
												class="form-control" name="email1" onfocus="this.value='';" placeholder="예)example" value="<%=mdto.getEmail1()%>">
										</span> <span class="col-xs-1">@</span> <span class="col-xs-3">
												<input type="text" class="form-control" name="email2" 
												disabled="disabled" placeholder="naver.com">
										</span> <span class="col-xs-3"> <select class="form-control"
												name="email3" onchange="email_change()">
													<option value="0">선택하세요</option>
													<option value="9">직접입력</option>
													<option value="naver.com">naver.com</option>
													<option value="nate.com">nate.com</option>
													<option value="hanmail.net">hanmail.net</option>
													<option value="paran.com">paran.com</option>
													<option value="hotmail.com">hotmail.com</option>
													<option value="gmail.com">gmail.com</option>
											</select>
										</span></td>
									</tr>
									<tr>
										<td style="font-size: 19px; font-weight: bold;">전화번호</td>
										<td><input type="text" name="tel1" size="3" style="height: 30px;" value="<%=mdto.getTel1()%>"> - <input
											type="text" name="tel2" size="3" style="height: 30px;" value="<%=mdto.getTel2()%>"> - <input
											type="text" name="tel3" size="3" style="height: 30px;" value="<%=mdto.getTel3()%>"></td>
									</tr>
									<tr>
										<td style="font-size: 19px; font-weight: bold;" >생년월일</td>
										<td><select
												name="birthday1"  style="height: 30px;">
													<option><%=mdto.getBirthday1() %></option>
													<%
														for (int i = 2015; i >= 1950; i--) {
													%>
													<option><%=i%></option>
													<%
														}
													%>
											</select> 년
												<select name="birthday2" style="height: 30px;">
													<option><%=mdto.getBirthday2() %></option>
													<%
														for (int i = 1; i <= 12; i++) {
													%>
													<option><%=i%></option>
													<%
														}
													%>
											</select> 월
												<select name="birthday3" style="height: 30px;">
													<option> <%=mdto.getBirthday3() %></option>
													<%
														for (int i = 1; i <= 31; i++) {
													%>
													<option value="<%=i%>"><%=i%></option>
													<%
														}
													%>
											</select>
									 일</td>
									</tr>
									<%
										String zipcode = request.getParameter("zipcode");

										String addr = request.getParameter("addr");
									%>
									<tr>
										<td style="font-size: 19px; font-weight: bold;">우편번호</td>
										<td><input type="text" name="zipcode1" value="<%=mdto.getZipcode1()%>"
											readonly="readonly" size="3" value="<%=mdto.getZipcode1()%>">- <input type="text"
											name="zipcode2" value="<%=mdto.getZipcode2()%>" readonly="readonly" size="3">
										</td>
									</tr>
									<tr>
										<td rowspan="2" style="font-size: 19px; font-weight: bold;">주소</td>
										<td><div class="col-xs-7">
												<input class="form-control" type="text" name="addr1"
													value=<%=mdto.getAddr1() %> readonly="readonly" size="40">
											</div>
											<button type="button" class="btn btn-primary"
												onclick="searchAddr()">검색</button></td>
									</tr>
									<tr>
										<td><div class="col-xs-7">
												<input class="form-control" type="text" name="addr2"
													size="40" value=<%=mdto.getAddr2() %> placeholder="나머지 주소 입력">
											</div></td>
									</tr>


									<tr>
										<td colspan="2">
									</tr>
									<tr>
										<td colspan="2" align="right">
											<button class="btn btn-danger" type="button" onclick="cancel()">취소</button>
											<button class="btn btn-warning" type="reset">다시수정</button>
											<button class="btn btn-success" type="submit">수정하기</button>
											<button class="btn btn-primary" type="button" onclick="deletePro()">회원탈퇴</button>	
										</td>
									</tr>
								</table>
							</div>
						</form>
					</article>
				</section>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
<%@include file="../footer.jsp"%>
</body>
</html>