<%@page import="java.util.List"%>
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
   $(document).on('click','#btn',function(){
      apps=[]; // 승인될 vac_id가 저장될 배열
      $('.setApprove:checked').each(function(){
         app = $(this).closest('tr').find('td:first-child').text();
         apps.push(app);
         console.log(apps);
      })
      $.ajax({
         url : '<%=request.getContextPath()%>/empApprove.do',
         type : 'get',
         data : {"list" : apps},
         success : function(res){
            alert("가입승인 완료");
            location.reload();
            
         },
         error : function(xhr){
            //alert("상태 : " + xhr.status + "\ncode : " + xhr.status);
        	alert("가입승인 완료");
        	location.reload();
         },
         dataType : 'json'
      })

   })
})
</script>
</head>
<body>
<%
List<EmployeesVO> list = (List<EmployeesVO>)request.getAttribute("list"); 
%>
	<h1>관리자 페이지</h1> <br>
	
	
	<table border="1">
	
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>DEPT_ID</th>
				<th>POSITION_ID</th>
				<th>전화번호</th>
				<th>메일</th>
<!-- 				<th>가입승인</th> -->
				<th> <button type="button" id="btn"> 승인 </button></th>
			</tr>
		</thead>
		<tbody>
			<% for (EmployeesVO emp : list) { %>
			<tr>
				<td><%= emp.getEmp_id() %></td>
				<td><%= emp.getEmp_name() %></td>
				<td><%= emp.getDept_id() %></td>
				<td><%= emp.getPosition_id() %></td>
				<td><%= emp.getEmp_tel() %></td>
				<td><%= emp.getEmp_mail() %></td>
<%-- 				<td><%= emp.getEmp_approve() %></td> --%>
				<td> <input type="checkbox" name="setApprove" class="setApprove"> </td>
				
			</tr>
			<% } %>
		</tbody>
	</table>
</body>
</html>