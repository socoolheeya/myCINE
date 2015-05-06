<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="mycine.rboard.RequestBoardDTO"%>
<jsp:useBean id="tDTO" class="mycine.timeline.TimeLineDTO" />
<jsp:useBean id="tDAO" class="mycine.timeline.TimeLineDAO" />
<jsp:setProperty property="*" name="tDTO" />
<jsp:useBean id="rDAO" class="mycine.rboard.RequestBoardDAO" />
<jsp:useBean id="rDTO" class="mycine.rboard.RequestBoardDTO" />
<jsp:setProperty property="*" name="rDTO" />
<%
String logined = null;
ArrayList<RequestBoardDTO> arr = null;
if(session.getAttribute("id") == null || session.getAttribute("id").equals("")) {
	
} else {
	logined = (String)session.getAttribute("id");	
	arr = rDAO.getRequestEvent(logined);
}

%>
<div class="col-sm-4" style="background-color: #ffff99;">
	<form name="timeLineForm">
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>여기는 타임라인</th>
					</tr>
				</thead>
				<tbody>
				<%
					for(int i = 0; i < arr.size(); i++) {
						%>
						<tr>
							<td><%=logined%>님께서 <%=arr.get(i).getMovieName() %> 영화를 요청하였습니다. <span style="font-size: 10px; color: gray;"><%=arr.get(i).getWriteDate()%></span></td>
						</tr>
						<%
					}
				%>
				</tbody>
			</table>
		</div>
	</form>
</div>
