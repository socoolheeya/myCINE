<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="msg" value="${requestScope.msg }"/>
<script>
	window.alert("msg");
	location.href="/myCINE/reviewList.do";
</script>