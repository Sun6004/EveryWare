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
	//회원가입승인
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
            location.reload();
            
         },
         error : function(xhr){
            //alert("상태 : " + xhr.status + "\ncode : " + xhr.status)
        	location.reload();
         },
         dataType : 'json'
      })

   }) //회원가입승인
   
   // 직급변경
   $(document).on('click', '#btn3', function(){
	   $.ajax({
		   url : '<%=request.getContextPath()%>/SetPosi.do',
		   type : 'post',
		   data : {}
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
		<tr>가입승인 요청</tr>		
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>부서</th>
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

				<td> <input type="checkbox" name="setApprove" class="setApprove"> </td>
				
			</tr>
			<% } %>
		</table>
		<br><br>
			
<%
List<EmployeesVO> list2 = (List<EmployeesVO>)request.getAttribute("list2"); 
%>
		<table border="1">
		<tr>직위변경</tr>		
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>부서</th>
				<th> <button type="button" id="btn2"> 부서이동 </button></th>
				<th>직급</th>
				<th> <button type="button" id="btn3"> 직급변경 </button></th>
			</tr>
		</thead>
		<tbody>
			<% for (EmployeesVO emp2 : list2) { %>
			<tr>
				<td><%= emp2.getEmp_id() %></td>
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
  						<td>
						<select name="dept" id="dept" >
							<option value="D001">인사팀</option>
							<option value="D002">총무팀</option>
							<option value="D003">재정팀</option>
							<option value="D004">개발팀</option>
							<option value="D005">영업팀</option>
							
						</select>
						</td>
  					
  					<!-- 직급 -->
  					<td><%
						String posi = emp2.getPosition_id();
						if(posi.equals("P001")) {
  						 %>
  						 <%= "대표이사" %>
  						 <%
						 } else if(posi.equals("P002")) {
	  					 %>
   						<%= "부장" %>
   						<%
						} else if(posi.equals("P003")) {
 						 %>
   						<%= "차장" %>
 					 	 <%
						} else if(posi.equals("P004")) {
 					 	 %>
  					 	<%= "과장" %>
  					 	<%
						}else if(posi.equals("P005")){
					 	%>
	       			 	<%= "대리" %>
	       				<%
						}else if(posi.equals("P006")){
					 	%>
	       			 	<%= "사원" %>
	       				<%
						}else {
   						out.print(posi);
						 }
						%></td>		
						<td>
						<select name="posi" id="posi" >
							<option value="P001">대표이사</option>
							<option value="P002">부장</option>
							<option value="P003">차장</option>
							<option value="P004">과장</option>
							<option value="P005">대리</option>
							<option value="P006">사원</option>
						</select>
						</td>
					</tr>
				<% } %>
		</tbody>
	</table>
</body>
</html>