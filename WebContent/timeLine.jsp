<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
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
ArrayList<Date> arr2 = null;
if(session.getAttribute("id") == null || session.getAttribute("id").equals("")) {
	
} else {
	logined = (String)session.getAttribute("id");	
	arr = rDAO.getRequestEvent(logined);
}

%>
<div class="col-sm-4">
	<form name="timeLineForm">
		<div class="responsive">
			<table class="table">
				<thead>
					<tr>
						<th>여기는 타임라인</th>
					</tr>
				</thead>
				<tbody style="overflow: scroll; height: 500px; width: 100%; position: absolute;">
				<%	
					Date temp1, temp2, temp3;
				SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd:hh:si");
					for(int i = 0; i < arr.size(); i++) {
						for(int j = 0; j < i; j++) {
							if(arr.get(i).getWriteDate().compareTo(arr.get(j).getWriteDate()) > 0){
								temp2 = arr.get(i).getWriteDate();
								temp3 = arr.get(j).getWriteDate();
								temp1 = temp2;
								temp2 = temp3;
								temp3 = temp1;
								
								
							%>
							<tr>
								<td><%=logined%>님께서 <%=arr.get(i).getMovieName() %> 영화를 요청하였습니다. <span style="font-size: 10px; color: gray;"><%=format.format(arr.get(i).getWriteDate())%></span></td>
							</tr>
							<%
							}
						}
					}
				%>
				</tbody>
			</table>
		</div>
	</form>
</div>
