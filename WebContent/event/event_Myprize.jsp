<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="dto" value="${requestScope.dto }"/>
<c:set var="pageLogic" value="${requestScope.pageLogic }"/>
<c:set var="arr" value="${requestScope.arr }"/>
<c:set var="str" value="${requestScope.str }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<title>내 이벤트 페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>

<script>
	function exshow(idx, use) {
		var ex = window.confirm("교환권을 사용하시겠습니까?");
		if (ex) {
			location.href = "event_Exprize.jsp?idx=" + idx + "&use=" + use;
		} else {
			window.alert("취소되었습니다.");
		}
	}
	function deshow(idx, use) {
		var de = window.confirm("교환권을 삭제하시겠습니까?");
		if (de) {
			location.href = "event_Deprize.jsp?idx=" + idx + "&use=" + use;
		} else {
			window.alert("취소되었습니다.");
		}
	}
	function reshow(idx,use,user_prize){
		var ex=window.confirm("교환권 구매를 취소하시겠습니까?");
		if(ex){
			location.href="event_Reprize.jsp?idx="+idx+"&use="+use+"&user_prize="+user_prize;
		}else{
			window.alert("취소되었습니다.");
		}
	}
</script>

<c:if test=${empty dto }>
<script>
	window.alert("로그인 하고 이용해주세요!")
	location.href = "event_Main.jsp";
</script>
</c:if>
</head>
<body>
	<%@include file="../header.jsp"%>
	<div class="row">
		<div class="col-sm-3"
			style="border: 1px solid #cccccc; margin: 10px; padding: 10px;">
			<ul>
				<li><a href="event_Main.jsp">포인트 사용안내</a></li>
				<li><a href="event_Exchange.jsp">상품 교환</a></li>
				<li><a href="event_Mypoint.jsp">내 포인트 조회</a></li>
				<li>내가 보유한 상품</li>
			</ul>
		</div>
		<div class="col-sm-7"
			style="border: 1px solid #cccccc; margin: 10px; padding: 10px;">
			<legend>
				<span class="glyphicon glyphicon-ok"></span>내가 보유한 상품
			</legend>
			<table class="table table-stripe">
				<thead style="background-color: #ffcc00;">
					<tr>
						<th style="text-align: center;">번호</th>
						<th style="text-align: center;">상품명</th>
						<th style="text-align: center;">사용여부</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty arr }">
						<tr class="danger">
							<td colspan="4" align="center">현재 보유한 상품이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test=${not empty arr }>
						<tr class="${str }">
						<c:forEach var="dto" items="${arr }">
							<td align="center">${dto.rnum}</td>
							<td>${dto.user_prize}</td>
							<td align="center">${dto.use}</td>
							<td align="center">
								<div class="btn-group">
									<button type="button" class="btn btn-warning"  onclick="exshow('${dto.idx}','${dto.use}')">증정</button>
									<button type="button" class="btn btn-success"  onclick="reshow('${dto.idx}','${dto.use}','${dto.user_prize}')">취소</button>
									<button type="button" class="btn btn-primary"  onclick="deshow('${dto.idx}','${dto.use}')">삭제</button>
								</div>
							</td>
						</c:forEach>
						</tr>
					</c:if>
				</tbody>
				<tfoot>
					<tr align="center">
						<td colspan="4">
							${requestScope.pageLogic }
						</td>
					</tr>
				</tfoot>
				
			</table>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>