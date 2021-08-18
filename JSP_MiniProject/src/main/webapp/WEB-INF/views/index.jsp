<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="vo.PhoneBookVO"%>
<%@page import="java.util.List"%>

<%
//요청 객체에서 list 속성 받아오기
List<PhoneBookVO> list = (List<PhoneBookVO>) request.getAttribute("list");
%>

<jsp:include page="/WEB-INF/views/header.jsp">
	<jsp:param value="메인페이지" name="message" /></jsp:include>

<body>
	<h2>목록</h2>

	<label>검색어   </label>
	<input = type="text" name="search"	id="search" style="margin:0px">	
	<form action="<%=request.getContextPath()%>/con" method="post"  >
		<input type="hidden" name="a" value="search"> 
		<input type="submit" VALUE="검색"style="margin:0px ">
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
					<td align="center"><%=vo.getHp() %></td>
					<td align="center"><%=vo.getTel()%></td>
					<td width="50" align="center">
					<form action="<%=request.getContextPath()%>/con" method="post">
						<input type="hidden" name="a" value="delete"> 
						<input type="hidden" name="id" value="<%=vo.getId()%>"/>
						<input type="submit" VALUE="삭제">
					</form>
					</td>
				</tr>
			</tbody>
			<%
			}
			%>		
	</table>
	<br />
	<p>
		<a href="<%=request.getContextPath()%>/con?a=insert">새 주소 추가</a>
	</p>

</body>
</html>