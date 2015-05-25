<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="check" value="${requestScope.check }"/>
<html>
<head>
<title>회원탈퇴</title>
</head>
<c:if test="${check ==1 }">
<meta http-equiv="Refresh" content="3;url=/myCINE/main.do">
<body>
	<div>
		<font size="5" face="바탕체"> 회원정보가 삭제되었습니다.<br> 3초후에 메인 페이지로
			이동합니다. <script>
				opener.location.href = "/main.do";
				window.self.close();
			</script>
		</font>
	</div>
</c:if>
<c:if test="${check != 1 }">
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
</c:if>
</body>
</html>