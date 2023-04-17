
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="everyware.posts.vo.PostsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
.move-board{
text-decoration: none;
color: black;

}
.subboard-title{
font-size: 18px;
font-weight: bold;
 background-color: #ddd;
   
}


.table-bordered>thead>tr>td{
border: 1px solid #06010152;
  
}
	button{
	color: white;
	background : #04AA6D ;
	border-radius : 10px;
	width: 130px;
	height: 40px;
	border: none;
	}
	button:active{
	background: white;
	color: #1286D7 ;
	
	}

/* td {
	text-decoration: underline;
} */

</style>
</head>
<body>
	<%
	List<PostsVO> list = (List<PostsVO>) request.getAttribute("PostsList");
	
	%>
	

	<div class="container-fluid text-center">
		<div class="row content">
		 	<div class="col-sm-2 sidenav">
				<p>
				<h2>
					<a href="<%=request.getContextPath()%>/postList.do">공지사항</a>
				</h2>
				</p>
				
				<p>
				<h2>
					<a href="<%=request.getContextPath()%>/Posts/post/FilePost.jsp">양식함</a>
				</h2>
			   </p>
			</div> 
			<div class="col-sm-8 text-left">
				<h1>게시판</h1>
				<hr>
				<h3>공지사항</h3>
				<table class="table table-bordered">
					<thead>
						<tr>
							<td class="subboard-title" align="center">번 호</td>
							<td class="subboard-title" align="center">제 목</td>
							<td class="subboard-title" align="center">날 짜</td>
						</tr>
					</thead>
					<tbody>
						<%
						if (list == null || list.size() == 0) {
						%>
						<tr>
							<td colspan="5" style="text-align: center;">저장된 게시글이 하나도 없습니다</td>
						</tr>

						<%
						} else {
										int count = 1;
										for (PostsVO vo : list) {
						%>
						<tr>
							<td align="center" style="font-size: 20px"><%=count++ %></td>
							<td style="font-size: 20px"><a class="move-board" href="<%=request.getContextPath()%>/NoticePost.do?postId=<%=vo.getPost_id()%>"><%=vo.getPost_title()%></a></td>
							<td align="center" style="font-size: 20px"><%=vo.getPost_date()%></td>
						</tr>
						<%
						}
						}
						%>
					</tbody>
				</table>
					<button type="button" style="float: right;" onclick="location.href='<%=request.getContextPath()%>/Posts/post/InsertPost.jsp'">글쓰기</button>
			</div>
		</div>
	</div>



</body>
</html>
