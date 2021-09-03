<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="vo.PhoneBookVO"%>
<%@page import="java.util.List"%>

<%
//요청 객체에서 list 속성 받아오기
List<PhoneBookVO> list = (List<PhoneBookVO>) request.getAttribute("list");
String strsearch = String.valueOf(request.getAttribute("search"));
boolean checkform = true;

%>

<jsp:include page="/WEB-INF/views/header.jsp">
	<jsp:param value="메인페이지" name="message" /></jsp:include>

<body>
	<%
	if (strsearch == "") {
	%>
	<h2>목록</h2>
	<%
	} else {
	%>
	<h2>
		목록 (검색어:
		<%=strsearch%>)
	</h2>
	<%
	}
	%>

	<form action="<%=request.getContextPath()%>/con" method="post">
		<label>검색어 </label>
		<input type="text" name="search" id="search" style="margin: 0px">
		<input type="hidden" name="a" value="search">
		<input type="submit" VALUE="검색" style="margin: 0px">
		<!-- 리셋 버튼  -->
		<a href="<%=request.getContextPath()%>/con?a=reset"> >> Show All</a>
	</form>

	<br>
	<table border="1">
		<thead>
			<tr bgcolor="lightGrey">
				<th width="100" align="center">이름</th>
				<th width="150" align="center">휴대전화</th>
				<th width="150" align="center">집전화</th>
				<th width="100" align="center">도구</th>
			</tr>
		</thead>
		<%
		for (PhoneBookVO vo : list) {
		%>
		<tbody>
			<tr>
				<td align="center"><%=vo.getName()%></td>
				<td align="center"><%=vo.getHp()%></td>
				<td align="center"><%=vo.getTel()%></td>
				<td width="50" align="center">
					<form action="<%=request.getContextPath()%>/con" method="post">
						<input type="hidden" name="a" value="delete">
						<input type="hidden" name="id" value="<%=vo.getId()%>" />
						<button type="submit" class="btn btn-secondary btn-sm">삭제</button>

					</form>
				</td>
			</tr>
		</tbody>
		<%
		}
		%>
	</table>
	<br />


	<button id="signbtn" class="btn btn-primary" data-toggle="modal" data-target="#loginDialog">Sign in</button>

	<div class="modal" role="dialog" id="loginDialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Sign in</h5>
					<button class="close" data-dismiss="modal" aria-label="close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- form 컴포넌트 사용 -->
					<form id="joinform" action="<%=request.getContextPath()%>/con" method="post" onsubmit="return checkForm()">
						<input type="hidden" value="add" name="a" />
						<!-- form row -->
						<div class="form-row row">
							<label for="name">이름</label>
							<input type="text" class="form-control" id="name" name="name">
						</div>
						<div class="form-row row">
							<label for="hp">휴대전화</label>
							<input type="text" class="form-control" id="hp" name="hp">
						</div>
						<div class="form-row row">
							<label for="tel">집전화</label>
							<input type="text" class="form-control" id="tel" name="tel">
						</div>
						<div class="modal-footer">
							<button class="btn btn-secondary" data-dismiss="modal">close</button>
							<button type="submit" class="btn btn-primary">submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>



	<!--  
	<p>
		<a href="<%=request.getContextPath()%>/con?a=insert">새 주소 추가</a>
	</p>-->

</body>
</html>