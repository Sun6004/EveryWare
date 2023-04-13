<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script src="../js/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script type="text/javascript">
    
$(function(){
		//로그인
	  $('.btn').on('click', function() {
		  var empId = $('#empId').val(); // 입력한 아이디
		  var empPass = $('#empPass').val(); // 입력한 비밀번호
		  if (empId == 'admin' && empPass =='1234') { // 입력한 아이디와 비밀번호가 admin과 1234인 경우
			  	//alert("관리자 입니다.");
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

		 	                window.location.href = 'MainPage.jsp';
			            } else {
			            	 Swal.fire({
				        		  icon: 'error',
				        		  title: '인증되지 않은 회원입니다.',
				        		  text: '가입승이 완료된 후 시도해주세요.',
				        		  showConfirmButton: false,
				        		  timer: 1500
				        		})
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
// 	   $('#logOut').on('click', function() {
// 	    $.ajax({
// 	      type: 'POST',
<%-- 	      url: '<%=request.getContextPath()%>/logout.do', --%>
// 				success : function(res) {
// 					alert(res);
// 					location.reload(); // 페이지 새로고침
// 				},
// 				error : function() {
// 					alert('로그아웃 요청 실패');
// 				},
// 				dataType : 'json'
// 			})
// 		}) //로그아웃
		
// 		$('#join').on('click', function(){
// 			 window.location.href = 'join.jsp';
// 		})
		
		//비밀번호 찾기
		$('#passSearch').on('click', function(){
			window.location.href = 'find.jsp';
		})
	}) //function
		
	//회원가입 - 아이디 중복체크
	  $(document).ready(function() {
	    $("#newEmpId").blur(function() {
	      var id = $(this).val();
	      $.ajax({
	        url: "<%=request.getContextPath()%>/IdCheck.do",
	        type: "GET",
	        data: {newEmpId: id},
	        success: function(res) {
	          if(res == "ok") {
	        	  Swal.fire({
	        		  icon: 'success',
	        		  title: '사용 가능한 아이디 입니다.',
	        		  showConfirmButton: false,
	        		  timer: 1500
	        		})
	          } else {
	        	  Swal.fire({
	        		  icon: 'error',
	        		  title: '이미 존재하는 아이디 입니다.',
	        		  text: '다시 입력해 주세요',
	        		  showConfirmButton: false,
	        		  timer: 1500
	        		})
	          }
	        },
	        error: function() {
	          alert("서버와의 통신에 실패했습니다.");
	        }
	      });
	    });
	  });
</script>

    <title>EveryWare</title>
    <link rel="stylesheet" href="../css/LoginStyle.css" />
  </head>
  <body>
    <header>
      <h2 class="logo">EveryWare</h2>
      <nav class="navigation"></nav>
    </header>

    <div class="groupware" style="color: aliceblue">EveryWare</div>
    <div class="everyware" style="color: aliceblue">
      YOUR CREATION <br />
      STARTS HERE
    </div>

    <div class="wrapper">
      <div class="form-box login">
        <h2>Login</h2>
        <!-- 로그인 버튼 눌렀을 때 -->
        <form id="form" method="post">
          <div class="input-box">
            <span class="icon"><ion-icon name="person-outline"></ion-icon></span>
            <input type="emil" id="empId" name="empId" required />
            <label for="">아이디</label>
          </div>

          <div class="input-box">
            <span class="icon"><ion-icon name="lock-closed-outline"></ion-icon></span>
            <input type="password" required id="empPass" name="empPass" />
            <label for="">비밀번호</label>
          </div>
          <div class="remember-forgot">
            <label id="idSave"><input type="checkbox" />아이디 저장 </label>
            <label><a id="passSearch" style="float: right"> 비밀번호 찾기</a></label>
          </div>
          <br />
          <button type="button" class="btn">Login</button>
          <div class="login-register">
            <p><a href="#" class="register-link">회원가입</a></p>
          </div>
        </form>
      </div>

      <div class="form-box register">
        <h2>Registration</h2>
        <form action="<%=request.getContextPath()%>/addEmp.do" method="post" id="sign">
          <div class="input-box">
            <span class="icon"><ion-icon name="person-outline"></ion-icon></span>
            <input type="emil" required id="newEmpId" name="newEmpId"/>
            <label for="">아이디</label>
          </div>

          <div class="input-box">
            <span class="icon"><ion-icon name="lock-closed-outline"></ion-icon></span>
            <input type="password" required id="newEmpPass" name="newEmpPass"/>
            <label for="">비밀번호</label>
          </div>

          <div class="input-box">
            <span class="icon"><ion-icon name="person-outline"></ion-icon></span>
            <input type="emil" required id="empName" name="empName"/>
            <label for="">이 름</label>
          </div>

          <div class="input-box">
            <span class="icon"><ion-icon name="key-outline"></ion-icon></span>
            <input type="password" required id="idno" name="idno"/>
            <label for="">주민번호</label>
          </div>

          <div class="input-box">
            <select class="dept" name="dept" id="dept">
              <option value="#">부서 선택</option>
              <option value="D001">인사 팀</option>
              <option value="D002">총무 팀</option>
              <option value="D003">재정 팀</option>
              <option value="D004">개발 팀</option>
              <option value="D005">영업 팀</option>
            </select>
          </div>

          <div class="input-box">
            <span class="icon"><ion-icon name="call-outline"></ion-icon></span>
            <input type="password" required id="tel" name="tel"/>
            <label for="">전화번호</label>
          </div>
          <div class="input-box">
            <span class="icon"><ion-icon name="map-outline"></ion-icon></span>
            <input type="text" required id="addr" name="addr"/>
            <label for="">주 소</label>
          </div>

          <div class="remember-forgot"></div>
          <button type="submit" class="btn2" value="제출">Register</button>
          <div class="login-register">
            <p><a href="#" class="login-link">로그인</a></p>
          </div>
        </form>
      </div>
    </div>
    <script src="../js/Loginscript.js"></script>
  </body>
</html>