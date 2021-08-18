<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
    
<jsp:include page="/WEB-INF/views/header.jsp">
	<jsp:param value="메인페이지" name="message"/></jsp:include>
<body>
	<h3>새 주소 등록</h3>
		<form action="<%=request.getContextPath()%>/con" method="post" accept-charset="euc-kr">
		<input type="hidden" value="add" name="a"/>
		
		<table border="1">
			<tr >
				<th width="120">이   름</th>
				<td><input = type="text" name="name"	id="name"></td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td><input type="text" name="hp" id="hp"></td>
			</tr>
			<tr>			
				<th>집전화</th>
				<td><input type="text" name="tel" id="tel"></td>
			</tr>
		</table>
			<!-- 전송 버튼 -->
			<input type="submit" value="등록">	
		</form>


</body>
</html>