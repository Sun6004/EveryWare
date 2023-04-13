
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery-3.6.4.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		//비밀번호찾기 실행
		$('#check').on('click', function(){
			$.ajax({
				type: 'POST',
				url: '<%=request.getContextPath()%>/FindPass.do',
				data : $('#form').serialize(),
				success: function(res){
					if(res == "null"){
						alert("존재하지 않는 회원입니다.");
					}else{
						alert("당신의 비밀번호는: "+res +"입니다.");
					}
				},
				error : function(xhr){
					alert("에러: "+xhr.xhr.status);
				},
				dataType: 'json'
			});
		})
		
		//로그인 페이지로 이동
		$('#logIn').on('click', function(){
			window.location.href = 'Login.jsp';
		})
		//회원가입 페이지로 이동
		$('#join').on('click', function(){
			window.location.href = 'join.jsp';
		})
	})
</script>
</head>
<body>
	<h3>비밀번호 찾기</h3>
	<form method="post" id="form">
		<p>
			<label for="empId">아이디:</label> <input type="text" id="empId"
				name="empId" required>
		</p>
		<p>
			<label for="empName">이름:</label> <input type="text"
				id="empName" name="empName" required>
		</p>
		
		
		<p>
			<button type="button" id="check"> 제출</button>
			<button type="button" id="logIn">로그인</button>
			<button type="button" id="join">회원가입</button>					
		</p>
		
	</form>
</body>
</html>