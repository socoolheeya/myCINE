<%@page import="mycine.timeline.TimeLineDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@page import="mycine.rboard.RequestBoardDTO"%>
<jsp:useBean id="tDTO" class="mycine.timeline.TimeLineDTO" />
<jsp:useBean id="tDAO" class="mycine.timeline.TimeLineDAO" />
<jsp:setProperty property="*" name="tDTO" />
<jsp:useBean id="rDAO" class="mycine.rboard.RequestBoardDAO" />
<jsp:useBean id="rDTO" class="mycine.rboard.RequestBoardDTO" />
<jsp:setProperty property="*" name="rDTO" />

<div class="col-sm-4">
	<form name="timeLineForm">
		<div class="responsive">
			<table class="table">
				<thead>
					<tr>
						<th>여기는 타임라인</th>
					</tr>
				</thead>
				<tbody
					style="overflow: scroll; height: 500px; width: 100%; position: absolute;">
					<%
						String logined = (String) session.getAttribute("id");
						ArrayList<TimeLineDTO> timeArr = tDAO.getTimeLineEvent(logined);

						for(int i = 0; i < timeArr.size(); i++) {
					%>
					<tr>
						<td><%=logined%><span><%=timeArr.get(i).getSubject()%></span>
						<span style="font-size: 10px; color: gray;"><%=timeArr.get(i).getDateTime()%></span></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</form>
</div>
