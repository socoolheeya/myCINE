<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/myCINE/css/rating-star.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
<%
	String loginedID = (String)session.getAttribute("id");
%>

<div class="row">
	<div class="col-sm-2"></div>
	<div class="col-sm-8">
	</div>
	<div class="col-sm-2"></div>
</div>
<div class="row">
	<div class="col-sm-2"></div>
	<div class="col-sm-8">
		<table class="table table-bordered">
			<thead>
				<tr>
					<%
						if(loginedID == null) {
							%>
							<td style="margin: 0px auto;">
								<input type="text" name="commentID" style="width: 130px;">
							</td>
							<%
						} else {
							%>
							<th style="margin: 0px auto;"><%=loginedID %></th>
							<%
						}
					%>			
					<td colspan="6"><textarea rows="2" cols="63"></textarea></td>			
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="8" align="right">
						<button class="btn btn-warning" type="button">취소</button>
						<button class="btn btn-success" type="button">등록</button>
						<button class="btn btn-primary" type="button" name="comment" onclick="">추천하기</button>
					</td>
				</tr>
			</tbody>
		</table>
		<hr>
		<table class="table table-bordered">
			<tr>
				<td></td>
			</tr>
			<tr></tr>
		</table>
	</div>
	<div class="col-sm-2"></div>
</div>