<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="reDAO" class="mycine.review.ReviewDAO" scope="session"/>
<jsp:useBean id="reDTO" class="mycine.review.ReviewDTO" scope="page"/>
<jsp:setProperty property="*" name="reDTO"/>
<% 
int result=reDAO.reviewWrite(reDTO);
String msg=result>0?"작성 성공":"작성 실패";
%>
<script>	
window.alert("<%=msg%>");
location.href="reviewList.jsp";
</script>