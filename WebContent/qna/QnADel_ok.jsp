<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="result" value="${requestScope.result }"/>
<c:set var="idx" value="${requestScope.idx }"/>
<c:if test="${result > 0 }">
	<script>
		window.alert("삭제되었습니다!");
		location.href="/myCINE/qnaList.do";
	</script>
</c:if>
<c:if test="${result <= 0 }">
	<script>
		window.alert("비밀번호가 틀렸습니다! 다시입력해주세요");
		location.href="/myCINE/qnaDel.do?q_idx=${idx}";
	</script>
</c:if>