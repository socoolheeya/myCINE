<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="zipcode1" value="${requestScope.zipcode1 }"/>
<c:set var="zipcode2" value="${requestScope.zipcode2 }"/>
<c:set var="addr" value="${requestScope.addr }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소검색</title>
</head>
<body>
	<c:if test="${empty addr }">
		<script>
			opener.document.memberInfo.addr1.value = "검색 결과 없습니다.";
			self.close();
		</script>
	</c:if>
	<c:if test="${not empty addr }">
		<script>
			opener.document.memberInfo.addr1.value = "${addr}";
			opener.document.memberInfo.zipcode1.value = "${zipcode1}";
			opener.document.memberInfo.zipcode2.value = "${zipcode2}";
			self.close();
		</script>
	</c:if>
</body>
</html>