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

<script src="http://localhost/Posts/Posts/js/summernote-lite.js"></script>
<script src="http://localhost/Posts/Posts/js/summernote-ko-KR.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

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
}

.board-memo {
	font-size: 18px;
	width: 100%;
	height: 320px;
 	resize: none;
 	/* outline: none; */
/*	pointer-events: none;
	background-color: #eee; */
}
#title , #subtitle{
width: 100%;
}


</style>

<script type="text/javascript">
$(function(){
	$('#summernote').summernote({
	      lang : 'ko-KR',              // default: 'en-US'
	      height: 800,                 // set editor height
	      minHeight: null,             // set minimum height of editor
	      maxHeight: null,             // set maximum height of editor
	      focus: true,                 // set focus to editable area after initializing summernote
	      width: 820,
	      toolbar: [
	         ['fontname', ['fontname']],
	         ['fontsize', ['fontsize']],
	         ['style', ['bold', 'italic', 'underline', 'clear']],
	         ['color', ['color']],
	         ['table', ['table']],
	         ['para', ['paragraph']],
	         ['insert', ['picture', 'link', 'video']],
	         ['view', ['codeview']]
	      ],
	      fontNames: [ '맑은 고딕', '굴림', '돋움', '궁서', '바탕', 'HY견고딕', '휴먼둥근헤드라인', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Helvetica neue', 'Helvetica', 'Impact'],
	      fontNamesIgnoreCheck: [ '맑은 고딕', '굴림', '돋움', '궁서', '바탕', 'HY견고딕', '휴먼둥근헤드라인', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Helvetica neue', 'Helvetica', 'Impact'],
	      lineHeights: ['0.2', '0.3', '0.4', '0.5', '0.6', '0.8', '1.0', '1.2', '1.4', '1.5', '2.0', '3.0']
	   });

})
</script>
</head>
<body>


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
				
			<form action="<%=request.getContextPath()%>/InsertPost.do">
				<table class="table table-bordered">
					<tr>
						<td class="ts" align="center" >제목</td>
						<td><input type="text" id="title" name="title"></td>
						<td class="ts" align="center" >소제목</td>
						<td><input type="text" id="subtitle" name="subtitle"></td>
					</tr>
                     <tr>
						<td style="width: 50px" >내용</td>
						<td colspan="4"><textarea class="board-memo" name="content"id="summernote"></textarea>
						
						<button type="reset" style="float: right;">삭 제</button>
						<button type="submit" style="float: right;">저 장</button>
						</td>
					</tr>
				</table>
			</form>
			</div>

		</div>
	</div>

</body>
</html>