<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="reDAO" class="mycine.review.ReviewDAO"/>
<jsp:useBean id="reDTO" class="mycine.review.ReviewDTO"/>
<jsp:setProperty property="*" name="reDTO"/>
<%
int result=reDAO.reviewDel(reDTO);
String msg=result>0?"삭제되었습니다.":"삭제실패";
%>
<script>
window.alert("<%=msg%>");
window.self.close();
opener.location.href="reviewList.jsp";
location.reload();
</script>