<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="point" value="${requestScope.point }"/>
<c:set var="usepoint" value="${requestScope.usepoint }"/>
<c:set var="count1" value="${requestScope.count1 }"/>
<c:set var="count2" value="${requestScope.count2 }"/>
<c:set var="prize" value="${requestScope.prize }"/>
<c:if test="${point - usepoint < 0 }">
	<script>
	   window.alert("포인트가 부족합니다.")
	   location.href="/myCINE/eventMypoint.do";
	</script>
</c:if>
<c:if test="${point - usepoint >= 0 }">
	<c:if test="${count1 > 0 && count2 > 0 }">
		<script>
			var ok=window.confirm(${usepoint}+"p를 사용하여 ${prize}(으)로 교환되었습니다.\n보관함으로 이동하시겠습니까?");
			if (ok) {
				location.href = "/myCINE/eventMyprize.do";
			} else {
				location.href = "/myCINE/eventExchange.do";
			}
		</script>
	</c:if>
	<c:if test="${count1 <= 0 || count2 <= 0 }">
		<script>
			window.alert("결제를 실패하였습니다.");
			location.href = "/myCINE/eventMyprize.do";
		</script>
	</c:if>
</c:if>