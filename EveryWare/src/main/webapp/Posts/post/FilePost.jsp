<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- <script language="javascript">
	function handleOnChange(e) {
		// 선택된 데이터의 텍스트값 가져오기
		const text = e.options[e.selectedIndex].text;

		console.log(e.options);

		// 선택한 텍스트 출력
		document.getElementById('result').innerText = text;
	}
</script> -->





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
	width: 110px;
}

#form-group {
	width: 65px;
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
 .ids{
    background-color: #ddd;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#downloadFile").on('click', function() {
			var selectedOption = $('#choiceFile').find('option:selected').val();
			console.log(selectedOption);
			if(selectedOption!=0){
			var link = document.createElement('a');
			link.href = " ../downloadFiles/" + selectedOption;
			link.download = selectedOption;
			link.click();
			}
			
	})
	
	 $('#choiceFile').on('change', function() {
	      var selectedOption = $(this).find('option:selected');
	      var selectedValue = selectedOption.val();
	      console.log(selectedOption);
	      $('#result').text(selectedValue);
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
					<h2>
						</p>
			</div>

			<div class="col-sm-8 text-left">
				<h2>게시판</h2>
				<p>양식함</p>
				<table class="table table-bordered">

					<tbody>
						<tr>
							<td class="ids" align="center" style="width: 20%;">문서 양식 선택</td>
							<td style="width: 20%;">
							<select id="choiceFile" style="width: 100%;text-align: center;">
									<option value=0 selected>- 양식선택 -</option>
									<option value="인사.doc">인사</option>
									<option value="품질관리.doc">품질관리</option>
									<option value="휴가.doc">휴가</option>
							</select>
							</td>
								<td class="ids"  align="center" style="width: 10%;">파 일</td>
							<td><div id='result' style="display: inline;"></div>
							<button type="button" id="downloadFile" style="float: right;">다운로드</button>
							</td>
							
						</tr>
					
						<tr>
							<td class="ids" align="center" style="width: 40px;">기안자</td>
							<td colspan="3">EveryWare  인사팀</td>
						</tr>
						<tr>
							<td align="center" colspan="4" style="height: 400px">
							해당 문서는 EVERY WARE에 저작물 입니다.
					
							</td>
							
						</tr>
					</tbody>
				</table>
			</div>

			
		</div>
	</div>





</body>
</html>
