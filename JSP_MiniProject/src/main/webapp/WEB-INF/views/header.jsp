<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
<!-- 부트스트랩 css 사용 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<!--  부트스트랩 js 사용 -->
<!--  부트스트랩 js 사용 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<script>
	function checkForm() {
		const form = document.getElementById("joinform")
		console.log(form);
		
		// 이름 검증
		let userid = form.name.value.trim();
		if (userid.length < 4 ||  userid.length > 10) {
          //  검증 실패
          alert("사용자 아이디는 4자 이상, 10자 이하로 해 주세요");
          form.name.focus(); //  포커스 부여
        return false;
        }
		
		let userhp = form.hp.value.trim();
		if (userhp.length < 4 ||  userhp.length > 10) {
          //  검증 실패
          alert("핸드폰 번호를 정확히 입력해주세요.");
          form.hp.focus(); //  포커스 부여
        return false;
        }
		
		let usertel = form.tel.value.trim();
		if (usertel.length < 4 ||  usertel.length > 10) {
          //  검증 실패
          alert("전화번호를 정확히 입력해주세요.");
          form.tel.focus(); //  포커스 부여
        return false;
        }
		return true;
	}
</script>

<style>
div h5 {
	font-family: 맑은고딕, 굴림체, sans-serif;
	font-weight: 1.5em;
}
</style>

</head>
<body>
	<h1>주소록 Servlet</h1>

</body>
</html>