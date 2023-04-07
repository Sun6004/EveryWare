<%@page import="everyware.vo.EmployeesVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	EmployeesVO vo = (EmployeesVO)request.getAttribute("empVo");
%>

<p><%=vo.getEmp_id()%></p>
<p><%=vo.getEmp_pass()%></p>
<p><%=vo.getEmp_name()%></p>
<p><%=vo.getEmp_no()%></p>
<p><%=vo.getDept_id()%></p>
<p><%=vo.getPosition_id()%></p>
<p><%=vo.getEmp_idno()%></p>
<p><%=vo.getEmp_tel()%></p>
<p><%=vo.getEmp_addr()%></p>
<p><%=vo.getEmp_mail()%></p>
<p><%=vo.getEmp_remain_vac()%></p>
<p><%=vo.getEmp_date()%></p>
<p><%=vo.getEmp_date()%></p>

</body>
</html>