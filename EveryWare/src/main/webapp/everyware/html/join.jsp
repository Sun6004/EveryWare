<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="<%=request.getContextPath()%>/everyware/js/jquery-3.6.4.min.js"
	type="text/javascript"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$('#idCheck').on('click', function(){
			var id = $('#empId').val();
			if(id == ""){
				alert("id를 입력하세요.");
				return;
			}
			
			$.ajax({
				url : '<%=request.getContextPath()%>/IdCheck.do',
				data : {"empId" : id},
				dataType : 'json',
				success : function(res) {
					if(res == "ok"){
						$('#res').html("사용가능한 아이디 입니다.");
					}else{
						$('#res').html("중복된 아이디입니다.");
					}
				},
				error :function(xhr){
					alert("에러: " + xhr.status);
				}
			})
		});
	})
</script>
</head>
<body>
	<h3>회원가입</h3>
	<form action="<%=request.getContextPath()%>/addEmp.do" method="post" id="form">

		<div class="input-box">
			<span class="icon"> <ion-icon name="mail-outline"></ion-icon>
			</span> <input type="emil" required id="empId" name="empId"/> <label for="">아이디</label>
			<input type="button" id="idCheck" value="중복확인">
			<span id="res"></span>
		</div>

		<div class="input-box">
			<span class="icon"><ion-icon name="lock-closed-outline"></ion-icon></span>
			<input type="password" required id="password" name="password"/> <label for="">비밀번호</label>
		</div>

		<div class="input-box">
			<span class="icon"><ion-icon name="person-outline"></ion-icon></span>
			<input type="emil" required id="empName" name="empName"/> <label for="">이름</label>
		</div>

		<div class="input-box">
			<select name="dept" id="dept" >
				<option value="D001">인사팀</option>
				<option value="D002">총무팀</option>
				<option value="D003">재정팀</option>
				<option value="D004">개발팀</option>
			</select>
		</div>

		<div class="input-box">
			<span class="icon"><ion-icon name="business-outline"></ion-icon></span>
			<input type="text" required id="idno" name="idno" /> <label for="">주민등록번호</label>
		</div>

		<div class="input-box">
			<span class="icon"><ion-icon name="calendar-number-outline"></ion-icon></span>
			<input type="text" required id="tel" name="tel"/> <label for="">전화번호</label>
		</div>

		<div class="input-box">
			<span class="icon"><ion-icon name="addr-outline"></ion-icon></span> <input
				type="text" required id="addr" name="addr"/> <label for="">주소</label>
		</div>

		<div class="input-box">
			<span class="icon"><ion-icon name="mail-outline"></ion-icon></span> <input
				type="email" required id="email" name="email"/> <label for="">이메일</label>
		</div>

		<div class="remember-forgot"></div>
		<input type="submit" value="제출">
<!-- 		<button type="button" class="btn" id="ok">제출</button> -->

		<div class="login-register">
			<p>
				<a href="Login.jsp" class="login-link">로그인</a>
				<a href="find.jsp" class="find-link">비밀번호 찾기</a>
			</p>
		</div>
	</form>
</body>