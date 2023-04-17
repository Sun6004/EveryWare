<%@page import="groupware.email.vo.ReceiverVO"%>
<%@page import="groupware.email.vo.FileVO"%>
<%@page import="groupware.email.vo.EmailVO"%>
<%@page import="java.io.File"%>

<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.6.4.min.js"
	type="text/javaScript"></script>
<script src="http://localhost/EveryWare/js/summernote-lite.js"></script>
<script src="http://localhost/EveryWare/js/summernote-ko-KR.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

<script type="text/javascript">
	$(function() {
		$('#receiveMailArea').css('display', 'none');
		$('#receiveMail').css('display', 'none');
		$("#writerMail").css('display', 'none');
		
		$('#receiveMail').on("click", function() {
			$('#sedMailArea').css('display', 'none');
			$('#receiveMailArea').css('display', 'block');
			$("#writerMail").css('display', 'none');
			$('receiveMailArea .check').prop('checked', false)
			 $('.mail-detail').not($(this).find('.mail-detail')).hide();
			$('#receiveMail').css('display', 'none');
			$('#sendMail').css('display', 'inline-block');
		})

		$('#sendMail').on("click", function() {
			$('#sedMailArea').css('display', 'block');
			$('#receiveMailArea').css('display', 'none');
			$("#writerMail").css('display', 'none');
			$('.check').prop('checked', false)
			 $('.mail-detail').not($(this).find('.mail-detail')).hide();
			$('#sendMail').css('display', 'none');
			$('#receiveMail').css('display', 'inline-block');
		})
		
		 $("#write").on('click',function(){
			$("#writerMail").css('display', 'block');
			$('#receiveMailArea').css('display', 'none');
			$('#sedMailArea').css('display', 'none');
		}) 

		$('#btn4').on("click", function() {			
			$('.check').prop('checked', true)
		})

		$('#btn3').click(function() {
			
			var checkedIds = ""; // 체크한 아이템들의 부모 아이디를 담을 배열
			
		    $('.mail-list input:checked').each(function() {
				if(checkedIds!="") checkedIds += "&" ;			    		    
		    	checkedIds += "checkedIds=" + $(this).closest('.mail-list').attr('id'); // 체크한 아이템의 부모 아이디를 배열에 추가
		    });
			console.log(checkedIds);
		 	$.ajax({
				url: "<%=request.getContextPath()%>/DeleteMail.do",
						data : checkedIds,
						type : "post",
						success : function(res) {
							 location.reload(); 
						},
						error : function(xhr) {
							alert(xhr.status);
						}
					})

				});

		$('.mail-list').on('click', function(e) {//한번에 하지말고 누르면번호 추출해서 다른 컨트롤로 옴겨라 애니메이션 불어오기 그럼 상보기 
			//e.stopPropagation(); 
			mailId = $(this).attr('id');
			$(this).find('.mail-detail').toggle();
			//$(this).find('.mail-detail').css('display','block');
		});
		
		$('#summernote').summernote({
		      lang : 'ko-KR',              // default: 'en-US'
		      height: 520,                 // set editor height
		      minHeight: null,             // set minimum height of editor
		      maxHeight: null,             // set maximum height of editor
		      focus: true,                 // set focus to editable area after initializing summernote
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
<style type="text/css">
.mail-list, .mail-detail, .mailTiel {
	/* border: 1px solid blue; */
	margin: 5px;
	font-size: 24px;
	font-weight: bold;
	border-radius: 5px
}

.mail-list, .mailTiel {
	
	color: black;
}
.mail-list{
padding: 3px;
}
.mail-detail {
padding :10px;
	background: #f1f1f1;
	color: black;
	
	margin: 5px;
}

#result3, .mail-detail {
	display: none;
}

button {
	height: 40px;
	width: 130px;
	background: #04AA6D;
	color: white;
	border-radius: 10px;
	border: 0;
	font-size: 18px;
	overflow: hidden;
	font-weight: bold;
}

input[type="text"] {
	width: 100%;
	padding: 12px;
	margin: 8px 0;
	box-sizing: border-box;
	border: 2px solid #ccc; border-radius : 4px;
	background-color: #f8f8f8;
	font-size: 16px;
	border-radius: 4px;
}

button:active {
	background: white;
	color: #162938;
}
h1{
font-size : 50px;
}



#sedMailArea, #receiveMailArea {
	padding-top: 20px;
}



.check {
	width: 20px;
	height: 20px;
	border: 1px solid #ccc;
	background-color: #fff;
	outline: none;
	cursor: pointer;
}

textarea {
	resize: none;
}

table {
	border-radius: 5px;
	width: 100%;
	border-collapse : collapse;
}

td {
	width : 25%;
	/* text-align: center; */
    border: 1px solid #f1f1f1;
	font-size: 24px;
	font-weight: bold;
	height: 30px;
}

.lefttd {
	width: 2%;
	height: 30px;
	font-size: 24px;
	font-weight: bold;
}

td input, textarea {
	width: 100%;
	border: none;
	background-color: transparent;
	outline: none;
}
.menu{
 width : 25%;
 background: #F3F3F3;
    border: 1px solid lightgray;
   height: 30px;
   padding: 0.5em;
   text-align: center;
}
.fileLink{
	margin-top :30px;
	border-radius: 5px;
	text-decoration: none;
	background: #04AA6D;
	color: white;
	/* border: 1px solid blue; */
}
</style>
</head>
<body>

		<button type="button" id='btn4' value='전체선택'>전체 선택</button>
		<button type="button" id='receiveMail' value='받은 메일함'>받은 메일함</button>
		<button type="button" id='sendMail' value='보낸 메일함'>보낸 메일함</button>
		<button type="button" id='btn3' value='삭제'>삭제</button>
		<button type="button" id='write' value='삭제'>이메일 작성</button>
		


		<div id='sedMailArea' class='mailarea'>
			<div class='mailTiel'>
				<table border="0">
					
					<tr>
						<!-- <td>&nbsp;&nbsp;</td> -->
						<td class ="menu">수신 이메일</td>
						<td class ="menu">제 목</td>
						<td class ="menu" style="width: 10px">수신자</td>
						<td class ="menu">날 짜</td>
					</tr>
				</table>
				
			</div>
			<%
			List<EmailVO> sendList = (List<EmailVO>) request.getAttribute("send");
			for (EmailVO vo : sendList) {
				for (ReceiverVO rvo : vo.getReceivers()) {
			%>
			<!-- <input type="checkbox" class='check'> Test<br> -->
			<div class='mail-list' id="<%=vo.getEmail_id()%>">
			<div class="onoff">
				
				<table>
				<tr>
				<td align="center"><input type="checkbox" class='check' style="float: left">
				<%=rvo.getEmp_mail()%></td> 
				<td align="center"><%=vo.getEmail_title()%></td>
				<td align="center"><%=rvo.getEmp_name()%></td> 
				<td align="center"><%=vo.getEmail_date()%></td> 
				</tr>
				</table>
				
				</div>
				
				<div class='mail-detail'>
					<%
					for (FileVO fvo : vo.getFiles()) {
					%>
					<a class="fileLink"
						href="<%=request.getContextPath()%>/EmailFileDownload.do?file=<%=fvo.getFile_name()%>"><ion-icon name="download-outline"></ion-icon> <%=fvo.getFile_name()%></a><br>
					<%
					}
					%>
					<%=vo.getEmail_content().replaceAll("\\n", "<br>")%><br>
				</div>
			</div>
			<%
			}
			%>

			<%
			}
			%>

		</div>

		<div id='receiveMailArea' class='mailarea'>
			<div class='mailTiel'><table>
					<tr>
						<td class ="menu" >발신자 이메일</td>
						<td class ="menu" >제 목</td>
						<td class ="menu" >발신자</td>
						<td class ="menu" >날 짜</td>
					</tr>
				</table></div>
			<%
			List<EmailVO> receiveList = (List<EmailVO>) request.getAttribute("receive");
			for (EmailVO vo : receiveList) {
			%>
			<div class='mail-list' id="<%=vo.getEmail_id()%>">
			<table>
			<tr>
				<td align="center"><input type="checkbox" class='check' style="float: left">
				
				<%=vo.getEmail_sender_mail()%></td>
				<td align="center"><%=vo.getEmail_title()%></td>
				<td align="center"><%=vo.getEmail_sender_name()%></td> 
				<td align="center"> <%=vo.getEmail_date()%></td>
				
				</tr>
				</table>
				<div class='mail-detail'>
					<%
					for (FileVO fvo : vo.getFiles()) {
					%>
					<a class="fileLink" href="<%=request.getContextPath()%>/EmailFileDownload.do?file=<%=fvo.getFile_name()%>"><ion-icon name="download-outline"></ion-icon> <%=fvo.getFile_name()%></a><br>
					<%
					}
					%>
					<%=vo.getEmail_content()%>
				</div>
			</div>
			<%
			}
			%>
		</div>

		<br>
		<br>

		<div id="writerMail">
			<form action="<%=request.getContextPath()%>/SendMail.do"
				method="post" enctype="multipart/form-data">
				
				<br><br>
				<table >
					<tr>
						<td align="center" class="lefttd" style="background: #f1f1f1 ; border-radius: 5px"><span>받는 사람</span></td>
						<td><input type="text" name="email"></td>

					</tr>

					<tr>
						<td align="center" class="lefttd" style="background: #f1f1f1 ;  border-radius: 5px"><span >제목</span></td>
						<td><input type="text" name="subject"></td>
					</tr>

					<tr>
						<td align="center" class="lefttd" style="background: #f1f1f1 ;  border-radius: 5px"><span>파일첨부</span></td>
						<td><input type="file" name='file' ></td>
					</tr>
					<tr>
						<td align="center" class="lefttd" style="background: #f1f1f1  ; border-radius: 5px" ><span>내용</span></td>
						<td align="left"><textarea id="summernote" class="content" rows="15" name='content' "></textarea></td>
					</tr>

				</table>
				<div style="float: right">
				<button type="submit">전송</button>
				<button type="reset">초기화</button>
				</div>
			</form>
		</div>


	</div>
</body>
</html>