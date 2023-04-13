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
	background: #162938;
	color: white;
}
.mail-list{
padding: 10px;
}
.mail-detail {
padding :10px;
	background: #f1f1f1;
	color: black;
	
	margin: 5px;
}

a {
	margin-top :30px;
	border-radius: 5px;
	text-decoration: none;
	color: black;
	border: 1px solid blue;
}

#result3, .mail-detail {
	display: none;
}

button {
	height: 40px;
	width: 130px;
	background: #4fa96a;
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
#content {
width: 100%;
  padding: 12px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  background-color: #f8f8f8;
  font-size: 24px;
}

button:active {
	background: white;
	color: #162938;
}

#sedMailArea, #receiveMailArea {
	padding-top: 20px;
}

#re {
	background: #ffffff;
	padding: 10px;
	border-radius: 15px;
	/* border: 2px dotted red; */
	height: 900px;
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
	border-radius: 15px;
	width: 100%;
}

td {
	font-size: 18px;
	font-weight: bold;
	height: 30px;
}

.lefttd {
	width: 20%;
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


</style>
</head>
<body>

	
	<div id='re'>

		<button type="button" id='btn4' value='전체선택'>전체 선택</button>
		<button type="button" id='receiveMail' value='받은 메일함'>받은 메일함</button>
		<button type="button" id='sendMail' value='보낸 메일함'>보낸 메일함</button>
		<button type="button" id='btn3' value='삭제'>삭제</button>
		<button type="button" id='write' value='삭제'>이메일 작성</button>



		<div id='sedMailArea' class='mailarea'>
			<div class='mailTiel'>
				<table>
					<tr>
						<td>&nbsp;&nbsp;</td>
						<td>수신자</td>
						<td>날 짜</td>
						<td>제 목</td>
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
				<input type="checkbox" class='check'>&nbsp;&nbsp;
				<%=rvo.getEmp_mail()%>
				(<%=rvo.getEmp_name()%>) &nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;<%=vo.getEmail_date()%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%=vo.getEmail_title()%> 
				</div>
				<div class='mail-detail'>
					<%
					for (FileVO fvo : vo.getFiles()) {
					%>
					<a
						href="<%=request.getContextPath()%>/EmailFileDownload.do?file=<%=fvo.getFile_name()%>"><%=fvo.getFile_name()%></a><br>
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
						<td>&nbsp;&nbsp;</td>
						<td>발신자</td>
						<td>날 짜</td>
						<td>제 목</td>
					</tr>
				</table></div>
			<%
			List<EmailVO> receiveList = (List<EmailVO>) request.getAttribute("receive");
			for (EmailVO vo : receiveList) {
			%>
			<div class='mail-list'>
				<input type="checkbox" class='check'>&nbsp;&nbsp;
				<%=vo.getEmail_sender_mail()%>
				(<%=vo.getEmail_sender_name()%>)&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;<%=vo.getEmail_date()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;<%=vo.getEmail_title()%>
				<div class='mail-detail'>
					<%=vo.getEmail_content()%>&nbsp;&nbsp;
					<%
					for (FileVO fvo : vo.getFiles()) {
					%>
					<a
						href="<%=request.getContextPath()%>/EmailFileDownload.do?file=<%=fvo.getFile_name()%>"><%=fvo.getFile_name()%></a><br>
					<%
					}
					%>
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
						<td><input type="file" name='file' style="background: #f1f1f1"></td>
					</tr>
					<tr>
						<td align="center" class="lefttd" style="background: #f1f1f1  ; border-radius: 5px" ><span>내용</span></td>
						<td><textarea  id="content" rows="15" name='content'></textarea></td>
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