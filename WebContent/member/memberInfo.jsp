<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="dto" value="${requestScope.dto }" />
<c:set var="id" value="${sessionScope.id }" />
<c:set var="zipcode" value="${param.zipcode }" />
<c:set var="addr" value="${param.addr }" />
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>${id }님의정보 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script type="text/javascript">
	function searchAddr() {
		window.open("/myCINE/updateSearchAddrForm.do", "updateSearchAddr",
				"width=800 height=500 left=200 top=100");
	}
	function memberDelete() {
		window.open("/myCINE/memberDeleteForm.do", "memberDelete",
				"width=350 height=200 left=500 top=150");
	}
	function email_change() {
		if (document.memberInfo.email2.options[document.memberInfo.email2.selectedIndex].value == '0') {
			document.memberInfo.email3.disabled = true;
			document.memberInfo.email3.value = "";
		}
		if (document.memberInfo.email2.options[document.memberInfo.email2.selectedIndex].value == '9') {
			document.memberInfo.email3.disabled = false;
			document.memberInfo.email3.value = "";
			document.memberInfo.email3.focus();
		} else {
			document.memberInfo.email3.disabled = true;
			document.memberInfo.email3.value = document.memberInfo.email2.options[document.memberInfo.email2.selectedIndex].value;
		}
	}
	function cancel() {
		location.href = "/myCINE/main.do";
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<header>
			<div class="row">
				<span class="col-sm-2"></span> <span class="col-sm-8"
					style="background-color: #ffcc00;"> <a
					href="/myCINE/main.do"><img src="/myCINE/image/logo.jpg" /></a>
				</span> <span class="col-sm-2"></span>
			</div>
		</header>
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8" style="background-color: lavenderblush;">
				<section>
					<article>
						<h2 style="font-size: 40px; font-weight: bold;">회원 정보 수정</h2>
						<form name="memberInfo" action="memberInfo_ok.jsp">
							<div class="form-group">
								<table class="table table-bordered">
									<tr>
										<td width="130px" style="font-size: 19px; font-weight: bold;">아이디(ID)</td>
										<td><div class="col-xs-3">
												<input type="text" class="form-control" name="id"
													value=${id } readonly="readonly" required="required">
											</div>
									</tr>
									<tr>
										<td style="font-size: 19px; font-weight: bold;">비밀번호</td>
										<td><div class="col-xs-3">
												<input type="password" class="form-control" name="pwd"
													value=${dto.pwd } placeholder="비밀번호 입력">
											</div></td>
									</tr>
									<tr>
										<td style="font-size: 19px; font-weight: bold;">이름</td>
										<td><div class="col-xs-3">
												<input type="text" class="form-control" name="name"
													value=${dto.name } readonly="readonly">
											</div></td>
									</tr>

									<tr>
										<td style="font-size: 19px; font-weight: bold;">Email</td>
										<td><span class="col-xs-4"> <input type="text"
												class="form-control" name="email1" onfocus="this.value='';"
												value=${dto.email1 } placeholder="예)example">
										</span> <span class="col-xs-1">@</span> <span class="col-xs-3">
												<input type="text" class="form-control" name="email3"
												value=${dto.email2 } disabled="disabled"
												placeholder="naver.com">
										</span> <span class="col-xs-3"> <select class="form-control"
												name="email2" onchange="email_change()">
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
										<td><input type="text" name="tel1" size="3"
											style="height: 30px;" value=${dto.tel1 }> - <input
											type="text" name="tel2" size="3" style="height: 30px;"
											value=${dto.tel2 }> - <input type="text" name="tel3"
											size="3" style="height: 30px;" value=${dto.tel3 }></td>
									</tr>
									<tr>
										<td style="font-size: 19px; font-weight: bold;">생년월일</td>
										<td><select name="birthday1" style="height: 30px;">
												<option value=${dto.birthday1 }>${dto.birthday1 }</option>
												<c:forEach var="i" begin="1950" end="2015" step="1">
													<option value="${i }">${i }</option>
												</c:forEach>
										</select> 년 <select name="birthday2" style="height: 30px;">
												<option value=${dto.birthday2 }>${dto.birthday2 }</option>
												<c:forEach var="i" begin="1" end="12" step="1">
													<option value="${i }">${i }</option>
												</c:forEach>
										</select> 월 <select name="birthday3" style="height: 30px;">
												<option value=${dto.birthday3 }>${dto.birthday3 }</option>
												<c:forEach var="i" begin="1" end="31" step="1">
													<option value="${i }">${i }</option>
												</c:forEach>
										</select> 일</td>
									</tr>
									<tr>
										<td style="font-size: 19px; font-weight: bold;">우편번호</td>
										<td><input type="text" name="zipcode1"
											value=${dto.zipcode1 } readonly="readonly" size="3"
											value=${dto.zipcode1 }>- <input type="text"
											name="zipcode2" value=${dto.zipcode2 } readonly="readonly"
											size="3"></td>
									</tr>
									<tr>
										<td rowspan="2" style="font-size: 19px; font-weight: bold;">주소</td>
										<td><div class="col-xs-7">
												<input class="form-control" type="text" name="addr1"
													value=${dto.addr1 } readonly="readonly" size="40">
											</div>
											<button type="button" class="btn btn-primary"
												onclick="searchAddr()">검색</button></td>
									</tr>
									<tr>
										<td><div class="col-xs-7">
												<input class="form-control" type="text" name="addr2"
													size="40" value=${dto.addr2 } placeholder="나머지 주소 입력">
											</div></td>
									</tr>
									<tr>
										<td colspan="2">
									</tr>
									<tr>
										<td colspan="2" align="right">
											<button class="btn btn-warning" type="button"
												onclick="cancel()">취소</button>
											<button class="btn btn-success" type="reset">다시수정</button>
											<button class="btn btn-primary" type="submit">수정하기</button>
										</td>
									</tr>
									<tr>
										<td colspan="2" align="right">
											<button class="btn btn-danger" type="button"
												onclick="memberDelete()">회원탈퇴</button>
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