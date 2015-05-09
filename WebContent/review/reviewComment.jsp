<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mycine.review.*"%>
<%@ page import="mycine.reviewComment.*" %>
<jsp:useBean id="cmtDAO" class="mycine.review.ReviewDAO" scope="session"/>
<link rel="stylesheet" href="/myCINE/css/rating-star.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
<%
	String loginedID = (String) session.getAttribute("id");
	String contentIdx = request.getParameter("idx");
%>

<div class="row">
	<div class="col-sm-2"></div>
	<div class="col-sm-8"></div>
	<div class="col-sm-2"></div>
</div>
<div class="row">
	<div class="col-sm-2"></div>
	<div class="col-sm-8">
		<form name="commentForm" action="reviewComment_ok.jsp">
			<table class="table table-bordered">
				<thead>
					<tr>
						<%
							if (loginedID == null) {
						%>

						<td style="margin: 0px auto;"><input type="text"
							name="commentID" style="width: 130px;"><input
							type="hidden" name="idx" value="<%=contentIdx%>"></td>
						<%
							} else {
						%>
						<th style="margin: 0px auto;"><%=loginedID%><input
							type="hidden" name="writer_cmt" value="<%=loginedID%>"></th>
						<%
							}
						%>
						<td colspan="6"><textarea name="content_cmt" rows="2"
								cols="63"></textarea></td>
					</tr>
				</thead>
				<tbody>		
					<tr>
						<td colspan="8" align="right">
							<button class="btn btn-warning" type="reset">리셋</button>
							<button class="btn btn-success" type="submit">등록</button>
						</td>
					</tr>			
				</tbody>
			</table>
		</form>
		<hr>
	</div>
	<div class="col-sm-2"></div>
</div>