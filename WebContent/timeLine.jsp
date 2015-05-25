<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="timeArr" value="${requestScope.timeArr }"/>
<c:set var="id" value="${sessionScope.id }"/>
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
					<c:forEach var="dto" items="${timeArr }">
						<tr>
							<td>
								${id }님께서<span>${dto.subject }</span>
								<span style="font-size: 10px; color: gray;">${dto.dateTime }</span>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</form>
</div>