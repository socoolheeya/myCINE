<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="mDTO" class="mycine.member.MemberDTO"/>
<jsp:useBean id="mDAO" class="mycine.member.MemberDAO"/>
<jsp:setProperty property="*" name="mDTO" />
<jsp:useBean id="tDTO" class="mycine.timeline.TimeLineDTO" />
<jsp:useBean id="tDAO" class="mycine.timeline.TimeLineDAO" />
<jsp:setProperty property="*" name="tDTO" />
<div class="col-sm-4" style="background-color: #ffff99;">
	<form>
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>여기는 타임라인</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>홍길동 님께서 고스트맘마 영화를 요청하였습니다.</td>
					</tr>
					<tr>
						<td>lwh0102 님께서 로마의 휴일 영화를 요청하였습니다.</td>
					</tr>
					<tr>
						<td>babo 님께서 타이타닉 영화를 요청하였습니다.</td>
					</tr>
					<tr>
						<td>보희 님께서 올드보이 영화를 요청하였습니다.</td>
					</tr>
					<tr>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</div>
