<%@page import="everyware.vo.EmployeesVO"%>
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
		//로그인
	  $('#logIn').on('click', function() {
	    $.ajax({
	      type: 'POST',
	      url: '<%=request.getContextPath()%>/login.do',
	      data: $('#form').serialize(),
	      success: function(res) {
	    	  console.log(res);
	        if (res == null) {
	        	alert('로그인에 실패했습니다.');
	        } else {
	         	alert('로그인에 성공했습니다. 환영합니다.');
	         // Ajax 요청 - getApprove
	            $.ajax({
	                type: 'POST',
	                url: '<%=request.getContextPath()%>/loginCheck.do',
	                data: {emp_id: res.emp_id},
	                success: function(res) {
	                console.log(res);
	                // 여기에서 emp_approve 값을 이용하여 다음 동작 수행
	                },
	                error: function() {
	                    alert('emp_approve 값을 가져오는데 실패하였습니다.');
	                },
	                dataType: 'json'
	            });
	         	window.location.href = 'main.html';
	        }
	      },
	      error: function() {
	        alert('로그인 요청 실패');
	      },
	      dataType: 'json'
	    })
	    
	  })//로그인
	  
	  //로그아웃
	   $('#logOut').on('click', function() {
	    $.ajax({
	      type: 'POST',
	      url: '<%=request.getContextPath()%>/logout.do',
				success : function(res) {
					alert(res);
					location.reload(); // 페이지 새로고침
				},
				error : function() {
					alert('로그아웃 요청 실패');
				},
				dataType : 'json'
			})
		}) //로그아웃

	}) //function
</script>
</head>
<body>

	<h1>로그인</h1>
	<form method="post" id="form">
		<p>
			<label for="empId">아이디:</label> <input type="text" id="empId"
				name="empId" required>
		</p>
		<p>
			<label for="empPass">비밀번호:</label> <input type="password"
				id="empPass" name="empPass" required>
		</p>
		<p>
			<button type="button" id="logIn">로그인</button>
			<button type="button" id="logOut">로그아웃</button>
		</p>
	</form>
</body>