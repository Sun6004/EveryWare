<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="../css/alarm-style.css" rel="stylesheet">
<script type="text/javascript" src="../js/alarm.js"></script>

<script type="text/javascript">
mypath = '<%= request.getContextPath() %>';
$(function() {
	$(document).on('click', '.action', function() {
		vidx = $(this).attr('idx');
		console.log(vidx);
		$.updateStatus(this);
	})
	
	$('#allRead').on('click', function() {
		$.updateAll();
	})
})
</script>
</head>
<body>

	<a><span class="icon"><ion-icon name="notifications-outline" id="alarmbtn"></ion-icon></span></a>
	<div id="alarm-count"></div>
		
	<div class="alarm" id="alarm-modal">
		<div class="al-header">
			<span>알림</span>
			<button id="allRead" title="모두 읽음 처리">
				<span class="material-icons"> 모두 확인 </span>
			</button>
		</div>
		<div class="al-body" id="alarmBody"></div>
	</div>
	
	
<script type="text/javascript">
eid = $('#empid').val();
$(function() {
	$.alarmCount();
	//console.log(eid);
	//$.alarmView();
})

$('#alarmbtn').on('click', function() {
	$.alarmView();
})
</script>
</body>
</html>