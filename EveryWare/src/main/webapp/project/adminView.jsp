<%@page import="groupware.emp.vo.EmployeesVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script
	src="<%=request.getContextPath()%>/js/jquery-3.6.4.min.js"
	type="text/javascript"></script>
<title>Insert title here</title>
	<script type="text/javascript">
$(function(){
	//회원가입승인
   $(document).on('click','#btn',function(){
      apps=[]; // 승인될 vac_id가 저장될 배열
      $('.setApprove:checked').each(function(){
         app = $(this).closest('tr').find('td:first-child').text();
         apps.push(app);
         //console.log(apps);
      })
      $.ajax({
         url : '<%=request.getContextPath()%>/empApprove.do',
         type : 'get',
         data : {"list" : apps},
         success : function(res){
            location.reload();
            
         },
         error : function(xhr){
            //alert("상태 : " + xhr.status + "\ncode : " + xhr.status)
        	location.reload();
         },
         dataType : 'json'
      })

   }) //회원가입승인
   
//    // 직급변경
//    $(document).on('click', '#btn3', function(){
// 	   $.ajax({
<%-- 		   url : '<%=request.getContextPath()%>/SetPosi.do', --%>
// 		   type : 'post',
// 		   data : {}
// 	   })
//    })
 
// 	  $.ajax({
// 	    type: 'POST',
// 	    url: 'servlet_url',
// 	    data: { emp_id: emp_id, emp_name: emp_name, dept_id: dept_id, emp_tel: emp_tel, emp_mail: emp_mail },
// 	    success: function(response) {
// 	      alert('수정이 완료되었습니다.');
// 	      location.reload();
// 	    },
// 	    error: function(xhr, status, error) {
// 	      console.log(xhr.responseText);
// 	    }
// 	  });
	  
})
	// 사원정보를 수정하는 modal 창을열고 해당사원의 id값을 가져옴
	$(document).ready(function(){
		  $("a[data-id]").click(function(){
		    var id = $(this).data('id');
		    $('#modalValue').text("회원 아이디: "+id);

		    $(document).on('click', '#btn-set', function(){
			   $.ajax({
				   url : '<%=request.getContextPath()%>/SetPosi.do',
				   type : 'post',
				   data : $('#form').serialize() + '&id=' + id,
				   success : function(res){
					   console.log(res);
					   alert("전송이 완료되었습니다.");
					   $('#myModal').modal('hide');
				   },
				   error: function(xhr){
					   console.log("상태: "+ xhr.status);
				   },
				   dataType: 'json'
			   })
		   })
		   $('#myModal').on('hidden.bs.modal', function () {
			      alert('모달이 닫혔습니다.');
			  });
		  });	 
	});
</script>
<style>
	input[type="checkbox"]{
        display: none;
      }
	input[type="checkbox"] + label{
        display: inline-block;
        width: 25px;
        height: 25px;
        border:2px solid rgb(32, 148, 250);
        position: relative;
      }
	input[id^="ck"]:checked + label::after{
	    content:'✔';  
        font-size: 25px;
        width: 30px;
        height: 30px;
        position: absolute;
        text-align: center;
        left: -3px;
        right : -5px;
        top:-10px;
        bottom: 0px;
      }
	.empId{
		font: bo
	}
</style>
</head>
<body>
<% int i = 1; %>
<%
   List<EmployeesVO> list = (List<EmployeesVO>)request.getAttribute("list"); 
 %> 
	<h1>관리자 페이지</h1> <br>

		<div class="container">
			<h2>회원가입 신청자 목록</h2>
			<p></p>            
			  <table class="table table-dark table-hover">
			    <thead>
			      <tr>
			        <th>아이디</th>
					<th>이름</th>
					<th>부서</th>
					<th>전화번호</th>
					<th>메일</th>
<!-- 				<th>가입승인</th> -->
					<th><button type="button" id="btn" class="btn btn-primary">승인</button> </th>
			      </tr>
			    </thead>
			    <tbody>
			<% for (EmployeesVO emp : list) { %>
			 <tr>
			       	<td><%= emp.getEmp_id() %></td>
					<td><%= emp.getEmp_name() %></td>
					<td>
					<% 
    					String dept2 = emp.getDept_id();
     					if(dept2.equals("D001")) {
       					 %>
       					 <%= "인사팀" %>
       					 <%
    					 } else if(dept2.equals("D002")) {
   	  					   %>
        				<%= "총무팀" %>
        				<%
     					} else if(dept2.equals("D003")) {
      					  %>
        				<%= "재정팀" %>
      					  <%
     					} else if(dept2.equals("D004")) {
      					  %>
       					 <%= "개발팀" %>
       					 <%
    					}else if(dept2.equals("D005")){
    					 %>
    	       			 <%= "영업팀" %>
    	       			<%
    					}else {
        				out.print(dept2);
    					 }
  						%></td>
					<td><%= emp.getEmp_tel() %></td>
					<td><%= emp.getEmp_mail() %></td>
					<td> 
						<input type="checkbox" name="setApprove" class="setApprove" id="ck<%= i %>" > 
						<label for="ck<%= i %>"></label>
					</td>
			      </tr>	      
			    </tbody>
			<% i++; %>
			<% } %>
		</table>
		</div>
		<br><br>

		
	<!-- --------------------------------------------------------------------------------------------- -->
	
	<%
	List<EmployeesVO> list2 = (List<EmployeesVO>)request.getAttribute("list2"); 
	%>
	<% int j = 1; %>
		<table class="table table-dark table-hover">
		<h2>사원관리</h2></tr>		
		<tr>
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>부서</th>
				<th>직급</th>
			</tr>
		</thead>
		<tbody>
			<% for (EmployeesVO emp2 : list2) { %>
			<tr>
				<td>
<%-- 					<a data-toggle="modal" href="#myModal" id="modal<%= j %>"><%=emp2.getEmp_id()%></a> --%>
					<a data-toggle="modal" href="#myModal" id="modal<%= j %>" data-id="<%=emp2.getEmp_id()%>"><%=emp2.getEmp_id()%></a> 
				</td>
				<td><%= emp2.getEmp_name() %></td>				
				<!-- 부서 -->
				<td>  <% 
    					String dept = emp2.getDept_id();
     					if(dept.equals("D001")) {
       					 %>
       					 <%= "인사팀" %>
       					 <%
    					 } else if(dept.equals("D002")) {
   	  					   %>
        				<%= "총무팀" %>
        				<%
     					} else if(dept.equals("D003")) {
      					  %>
        				<%= "재정팀" %>
      					  <%
     					} else if(dept.equals("D004")) {
      					  %>
       					 <%= "개발팀" %>
       					 <%
    					}else if(dept.equals("D005")){
    					 %>
    	       			 <%= "영업팀" %>
    	       			<%
    					}else {
        				out.print(dept);
    					 }
  						%></td>	
  					
  					<!-- 직급 -->
  					<td><%
						String posi2 = emp2.getPosition_id();
						if(posi2.equals("P001")) {
  						 %>
  						 <%= "대표" %>
  						 <%
						 } else if(posi2.equals("P002")) {
	  					 %>
   						<%= "부장" %>
   						<%
						} else if(posi2.equals("P003")) {
 						 %>
   						<%= "차장" %>
 					 	 <%
						} else if(posi2.equals("P004")) {
 					 	 %>
  					 	<%= "과장" %>
  					 	<%
						}else if(posi2.equals("P005")){
					 	%>
	       			 	<%= "대리" %>
	       				<%
						}else if(posi2.equals("P006")){
					 	%>
	       			 	<%= "사원" %>
	       				<%
						}else {
   						out.print(posi2);
						 }
						%></td>					
					</tr>
					<% j++; %>
				<% } %>
		</tbody>
	</table>
	
	<div class="container">

  <!-- The Modal -->
	  <div class="modal fade" id="myModal">
	    <div class="modal-dialog modal-dialog-centered">
	      
	      <div class="modal-content">
	      	
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">사원 정보 수정</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <form method="post" id="form">
	        <div class="modal-body">
	          <p id="modalValue"> 사원의 정보 수정</p>
	          	<select name="dept" id="dept" >
	          		<option value="null">부서 수정</option>
					<option value="D001">인사팀</option>
					<option value="D002">총무팀</option>
					<option value="D003">재정팀</option>
					<option value="D004">개발팀</option>
					<option value="D005">영업팀</option>					
				</select>
				<br><br>
	          	<select name="posi" id="posi" >
	          		<option value="null">직급 수정</option>
					<option value="P002">부장</option>
					<option value="P003">차장</option>
					<option value="P004">과장</option>
					<option value="P005">대리</option>
					<option value="P006">사원</option>
				</select>
				<br><br>
				<input type="text" required id="empMail" name="empMail"/>
           		<label for="">이메일</label>
	        </div>
	           
	        <!-- Modal footer -->
	        <div class="modal-footer">
	        	<button type="submit" id="btn-set">수정완료</button>
	          	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        </div>
	        </form>
	      </div>
	    </div>
	  </div>  
	</div>
	
</body>
</html>