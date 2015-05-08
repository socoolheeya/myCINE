<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="mycine.event.*"%>
<jsp:useBean id="eDAO" class="mycine.event.EventDAO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<title>내 이벤트 페이지</title>
<style>
a {
	text-decoration: none;
}
legend{
	font-size: 30px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>

<script>
					function exshow(idx,use){
						var ex=window.confirm("교환권을 사용하시겠습니까?");
						if(ex){
							location.href="event_Exprize.jsp?idx="+idx+"&use="+use;
						}else{
							window.alert("취소되었습니다.");
						}
					}
					function deshow(idx,use){
						var de=window.confirm("교환권을 삭제하시겠습니까?");
						if(de){
							location.href="event_Deprize.jsp?idx="+idx+"&use="+use;
						}else{
							window.alert("취소되었습니다.");
						}
					}
					</script>

<%
	String id_s = (String)session.getAttribute("id");
	if (id_s == null || id_s.equals("")) {
		id_s = "0";
	}
	EventDTO dto1 = eDAO.eventMypoint(id_s);
	if (dto1 == null) {
%>
<script>
	window.alert("로그인 하고 이용해주세요!")
	location.href = "event_Main.jsp";
</script>
<%
	return;
	}
	ArrayList<EventDTO> arr = eDAO.prizeList(id_s);
%>
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
			<legend><span class="glyphicon glyphicon-ok"></span>내가 보유한 상품</legend>
			<table class="table">
				<thead>
					<tr>
						<th style="text-align: center;">번호</th>
						<th style="text-align: center;">상품명</th>
						<th style="text-align: center;">사용여부</th>
						<th>&nbsp;</th>
					</tr>
				</thead>

				<tbody>
					<%
						for (int i = 0; i < arr.size(); i++) {
							if (arr == null || arr.equals("")) {
					%>
					<tr>
						<td colspan="3" style="text-align: center;">현재 보유한 상품이 없습니다.</td>
					</tr>
					
					<%
						} else {
							String str = null;
								switch(i%3){
								case 0:
									str = "success";
									break;
								case 1:
									str = "danger";
									break;
								case 2:
									str = "info";
									break;
								}							
					%>
					<tr class="<%=str%>">
 						<td style="margin: 10px; padding: 6px; text-align: center;"><%=i+1%></td>
						<td style="text-align: center;"><%=arr.get(i).getUser_prize()%></td>
						<td style="text-align: center;"><%=arr.get(i).getUse()%></td>
						<td><button class="btn btn-warning" type="button" name="ex<%=i+1 %>" onclick="exshow('<%=arr.get(i).getIdx() %>','<%=arr.get(i).getUse()%>')">수령</button>
						<button class="btn btn-danger" type="button" name="de<%=i+1 %>" onclick="deshow('<%=arr.get(i).getIdx() %>','<%=arr.get(i).getUse()%>')">삭제</button></td>
					</tr>
					<%
						}
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>