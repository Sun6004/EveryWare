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
		  var empId = $('#empId').val(); // 입력한 아이디
		  var empPass = $('#empPass').val(); // 입력한 비밀번호
		  if (empId === 'admin' && empPass === '1234') { // 입력한 아이디와 비밀번호가 admin과 1234인 경우
		        window.location.href = '<%=request.getContextPath()%>/AdminView.do'; // 관리자 페이지로 이동
		    } else { // 입력한 아이디와 비밀번호가 admin과 1234가 아닌 경우
			    $.ajax({
			      type: 'POST',
			      url: '<%=request.getContextPath()%>/login.do',
			      data: $('#form').serialize(),
			      success: function(res) {
			    	  console.log(res);
			        if (res == null) {
			        	alert('로그인 실패. 아이디와 비밀번호를 확인해주세요');
			        } else {
			        	if (res.emp_approve == 1) {
			                alert('로그인에 성공했습니다. 인증된 회원입니다.');
		 	                window.location.href = 'main.html';
			            } else {
			                alert('가입 승인되지 않은 회원입니다.');
			            }		        
			      }
			      },
			      error: function() {
			        alert('로그인 실패. 아이디와 비밀번호를 확인해주세요');
			      },
			      dataType: 'json'
			    });
	  }
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
		
		$('#join').on('click', function(){
			 window.location.href = 'join.jsp';
		})
		
		//비밀번호 찾기
		$('#find').on('click', function(){
			window.location.href = 'find.jsp';
		})

	}) //function
</script>
</head>
<body>

	<h1>로그인</h1>
	<form method="post" id="form">
		<p>
		
			<label for="empId">아이디:</label> 
			<input type="text" id="empId" name="empId" required>
			<input class="form-check-input" type="checkbox" name="remember"> 아이디 기억하기
		</p>

		<p>
			<label for="empPass">비밀번호:</label> <input type="password"
				id="empPass" name="empPass" required>
		</p>
		<p>
			<button type="button" id="logIn">로그인</button>
			<button type="button" id="logOut">로그아웃</button>
			<button type="button" id="join">회원가입</button>			
			<button type="button" id="find">비밀번호찾기</button>			
		</p>
		
	</form>
	
		
</body>