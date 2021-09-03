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
	<div class="container">
		<div class="row">
			<div class="col-6">
				<%	if (strsearch == "") {
					%>
				<h2>index</h2>
				<%
				} else {
				%>
				<h2>
					index (search:
					<%=strsearch%>)
				</h2>
				<%
				}
				%>
			</div>
			<div class="col" align="right">
				<form action="<%=request.getContextPath()%>/con" method="post">
					<label>search </label>
					<input type="text" name="search" id="search" style="margin: 1px">
					<input type="hidden" name="a" value="search">
					<button class="btn btn-info btn-sm" type="submit" style="margin: 0px">search</button>

				</form>

			</div>
		</div>
		<!-- 리셋 버튼  -->
		<div class="row">
			<div class="col" align="right"></div>
			<div class="col" align="right">
				<a href="<%=request.getContextPath()%>/con?a=reset"> ShowAll</a>
				<button id="signbtn" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#loginDialog">Sign in</button>
			</div>

			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col" class="text-center">name</th>
						<th scope="col" class="text-center">Phone</th>
						<th scope="col" class="text-center">Tel</th>
						<th scope="col" class="text-center">tool</th>
					</tr>
				</thead>
				<%
		for (PhoneBookVO vo : list) {
		%>


				<tbody>
					<tr>
						<td scope="row" align="center"><%=vo.getName()%></td>
						<td align="center"><%=vo.getHp()%></td>
						<td align="center"><%=vo.getTel()%></td>
						<td align="center">
							<form action="<%=request.getContextPath()%>/con" method="post">
								<input type="hidden" name="a" value="delete">
								<input type="hidden" name="id" value="<%=vo.getId()%>" />
								<button type="submit" class="btn btn-danger btn-sm">delete</button>

							</form>
						</td>
					</tr>
				</tbody>
				<%
		}
		%>
			</table>

			<jsp:include page="/WEB-INF/views/modal.jsp" />

			<!--  
	<p>
		<a href="<%=request.getContextPath()%>/con?a=insert">새 주소 추가</a>
	</p>-->
		</div>
</body>
</html>