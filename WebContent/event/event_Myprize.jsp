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

<%
	String id_s = (String)session.getAttribute("id");
	if (id_s == null || id_s.equals("")) {
		id_s = "0";
	}
	EventDTO dto1 = eDAO.event_MyPoint(id_s);
	if (dto1 == null) {
%>
<script>
	window.alert("로그인 하고 이용해주세요!")
	location.href = "event_Main.jsp";
</script>
<%
	return;
	}

	int totalCnt = eDAO.getTotalCnt(id_s); //총 게시글 수
	int listSize = 10; //보여줄 리스트의 수
	int pageSize = 5; //보여줄 페이지의 수

	String cp_s = request.getParameter("cp");
	if (cp_s == null || cp_s.equals("")) {
		cp_s = "1";
	}

	int cp = Integer.parseInt(cp_s); //현재 페이지

	int pageCnt = (totalCnt / listSize) + 1;
	if (totalCnt % listSize == 0) {
		pageCnt--;
	}

	int groupNumber = cp / pageSize;
	if (cp % pageSize == 0) {
		groupNumber--;
	}
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
				<tfoot>
					<tr align="center">
						<td colspan="4">
							<%
								if (groupNumber != 0) {
							%> <a
							href="event_Myprize.jsp?cp=<%=(groupNumber - 1) * pageSize + pageSize%>">&lt;&lt;</a>
							<%
								}
								for (int i = ((groupNumber * pageSize) + 1); i <= ((groupNumber * pageSize) + pageSize); i++) {
							%> <a href="event_Myprize.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;&nbsp;
							<%
								if (i == pageCnt)
										break;
								}
								if (groupNumber != ((pageCnt / pageSize) - (pageCnt % pageSize == 0 ? 1
										: 0))) {
							%><a
							href="event_Myprize.jsp?cp=<%=(groupNumber + 1) * pageSize + 1%>">&gt;&gt;</a>
							<%
								}
							%>
						</td>
					</tr>
				</tfoot>
				<tbody>
					<%
						ArrayList<EventDTO> arr = eDAO.event_MyPrizeList(id_s, cp, listSize);

						if (arr == null || arr.size() == 0) {
					%>
					<tr class="danger">
						<td colspan="4" align="center">현재 보유한 상품이 없습니다.</td>
					</tr>
					<%
						} else {
							for (int i = 0; i < arr.size(); i++) {
								String str = null;
								switch (i % 3) {
								case 0:
									str = "danger";
									break;
								case 1:
									str = "info";
									break;
								case 2:
									str = "success";
									break;
								}
					%>
					<tr class="<%=str%>">
						<td align="center"><%=arr.get(i).getRnum()%></td>
						<td><%=arr.get(i).getUser_prize()%></td>
						<td align="center"><%=arr.get(i).getUse()%></td>
						<td align="center">
							<div class="btn-group">
								<button type="button" class="btn btn-warning"  onclick="exshow('<%=arr.get(i).getIdx() %>','<%=arr.get(i).getUse()%>')">증정</button>
								<button type="button" class="btn btn-success"  onclick="reshow('<%=arr.get(i).getIdx() %>','<%=arr.get(i).getUse()%>','<%=arr.get(i).getUser_prize()%>')">취소</button>
								<button type="button" class="btn btn-primary"  onclick="deshow('<%=arr.get(i).getIdx() %>','<%=arr.get(i).getUse()%>')">삭제</button>
							</div>
						</td>


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