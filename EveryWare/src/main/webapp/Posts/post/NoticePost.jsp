<%@page import="everyware.posts.vo.PostsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<script src="http://localhost/Posts/Posts/js/summernote-lite.js"></script>
<script src="http://localhost/Posts/Posts/js/summernote-ko-KR.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">

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

th {
	width: 65px;
}

#form-group {
	width: 65px;
}

.form-control {
	width: 950px;
}

.ts {
	font-size: 18px;
	width: 8%;
	background-color: #ddd;
}

#board-memo {
	width: 100%;
	height: 540px;
	background-color: #fff;
	overflow-Y: scroll;
}

button {
	color: white;
	background: #04AA6D;
	border-radius: 10px;
	width: 130px;
	height: 40px;
	border: none;
}

button:active {
	background: white;
	color: #1286D7;
}

.table>tbody>tr>td {
	border: 1px solid #06010152;
}
</style>

<script type="text/javascript">
	$(function() {

		$("delete_btn").on('click', function() {

		})
		$('#summernote')
				.summernote(
						{
							lang : 'ko-KR', // default: 'en-US'
							height : 800, // set editor height
							minHeight : null, // set minimum height of editor
							maxHeight : null, // set maximum height of editor
							focus : true, // set focus to editable area after initializing summernote
							width : 820,
							toolbar : [
									[ 'fontname', [ 'fontname' ] ],
									[ 'fontsize', [ 'fontsize' ] ],
									[
											'style',
											[ 'bold', 'italic', 'underline',
													'clear' ] ],
									[ 'color', [ 'color' ] ],
									[ 'table', [ 'table' ] ],
									[ 'para', [ 'paragraph' ] ],
									[ 'insert', [ 'picture', 'link', 'video' ] ],
									[ 'view', [ 'codeview' ] ] ],
							fontNames : [ '맑은 고딕', '굴림', '돋움', '궁서', '바탕',
									'HY견고딕', '휴먼둥근헤드라인', 'Arial',
									'Arial Black', 'Comic Sans MS',
									'Courier New', 'Helvetica neue',
									'Helvetica', 'Impact' ],
							fontNamesIgnoreCheck : [ '맑은 고딕', '굴림', '돋움', '궁서',
									'바탕', 'HY견고딕', '휴먼둥근헤드라인', 'Arial',
									'Arial Black', 'Comic Sans MS',
									'Courier New', 'Helvetica neue',
									'Helvetica', 'Impact' ],
							lineHeights : [ '0.2', '0.3', '0.4', '0.5', '0.6',
									'0.8', '1.0', '1.2', '1.4', '1.5', '2.0',
									'3.0' ]
						});
	})
</script>
</head>
<body>
	<%
	PostsVO vo = (PostsVO) request.getAttribute("subtitle");
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

					<%
					if (vo == null) {
					%>
					<tr>
						<td colspan="5" style="text-align: center">저장된 회원이 하나도 없습니다</td>
					</tr>
					<%
					} else {
					%>
					<tr>
						<td class="ts" align="center">제목</td>
						<td><%=vo.getPost_title()%></td>
						<td class="ts" align="center">소제목</td>
						<td colspan="3"><%=vo.getPost_subtitle()%></td>
					</tr>

					<tr>
						<td class="ts" align="center">글쓴이</td>
						<td><%=vo.getEmp_id()%></td>
						<td class="ts" align="center">날 짜</td>
						<td><%=vo.getPost_date()%></td>
						<td class="ts" align="center">조회수</td>
						<td align="center"><%=vo.getPost_cnt()%></td>
					</tr>
				</table>
				<table class="table table-bordered">
					<tr>
						<td class="ts" style="width: 55px">내용</td>
						<td><div id="board-memo"><%=vo.getPost_content()%></div></td>
					</tr>

				</table>

				<form action="<%=request.getContextPath()%>/DeletePost.do">
					<input type="hidden" name="postId" value="<%=vo.getPost_id()%>">
					<table style="width: 100%">
						<tr style="border: none">
							<td colspan="2" align="right">
								<!-- <button type="button" id='modity_btn'>수정</button> -->
								<button type="submit" id='delete_btn'>삭제</button>
								<button type="button" class="btn btn-primary"
									data-bs-toggle="modal" data-bs-target="#myModal">수정</button>
							</td>
						</tr>
					</table>
				</form>

				<!-- The Modal -->
				<div class="modal" id="myModal">
					<div class="modal-dialog" style="position: fixed; left: 25%">
						<div class="modal-content"
							style="width: 1080px; height: 840px; overflow-Y: scroll;">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">Modal Heading</h4>
								<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
							</div>

							<!-- Modal body -->
							<div class="modal-body">
								<form action="<%=request.getContextPath()%>/UpdateRePosts">
								<input type="hidden" name="updatePostId" value="<%=vo.getPost_id()%>">
									<table class="table table-bordered">
										<tr>
											<td class="ts" align="center">제목</td>
											<td><input type="text" id="title" name="title" value="<%=vo.getPost_title()%>"></td>
											<td class="ts" align="center">소제목</td>
											<td><input type="text" id="subtitle" name="subtitle" value="<%=vo.getPost_subtitle()%>"></td>
										</tr>
										<tr>
											<td style="width: 50px">내용</td>
											<td colspan="4" align="left"><textarea class="board-memo"
													name="content" id="summernote" ><%=vo.getPost_content()%></textarea>

												<button type="submit" style="float: right;">수 정 </button></td>
										</tr>
									</table>
								</form>
							</div>

						

						</div>
					</div>
				</div>

				<%
				}
				%>


			</div>

		</div>
	</div>



</body>
</html>
