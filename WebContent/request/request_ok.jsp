<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rDAO" class="mycine.rboard.RequestBoardDAO" />
<jsp:useBean id="rDTO" class="mycine.rboard.RequestBoardDTO" />
<jsp:setProperty property="*" name="rDTO" />
<%
	String movieName = request.getParameter("searchword");
	String id = (String)session.getAttribute("id");
	boolean result = rDAO.movieCheck(movieName);
	if(result) {
		%>
		<script>
		alert("이미 존재하는 영화입니다.");
		location.href="request.jsp";
		</script>
		<%
	} else {
		out.println(movieName);
		out.println("id:"+id);
		int count = rDAO.request(id, movieName);
		out.print(count);
		if(count > 0) {
			%>
			<script>		
			alert("요청이 성공하였습니다.");
			self.close();
			opener.document.requestListForm.moviename.value = "<%=movieName%>";
			</script>
			<%
		}
	}
	
%>