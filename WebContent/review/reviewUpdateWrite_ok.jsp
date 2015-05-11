<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="reDAO" class="mycine.review.ReviewDAO" scope="session"/>
<jsp:useBean id="reDTO" class="mycine.review.ReviewDTO" scope="page"/>
<jsp:setProperty property="*" name="reDTO"/>
<% 
int result=reDAO.reviewUpdateWrite(reDTO);
String msg=result>0?"수정완료":"수정실패";
%>
<script>
window.alert("<%=msg%>");
location.href="reviewList.jsp";
</script>