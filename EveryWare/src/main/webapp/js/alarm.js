$.alarmView = function() {
	$.ajax({
		url : `${mypath}/SelectAllAlarm.do`,
		type : "get",
		data : {"id" : eid},
		success : function(res) {
			code = `<div class="container mt-3"><div id="accordion">`;
			code = "";
			msg = "";
			$.each(res, function(i,v) {
				if(v.alarm_type == "이메일") {
					msg = "이메일이 왔습니다";
				} else if(v.alarm_type == "일정") {
					msg = "일정이 추가되었습니다";
				} else if(v.alarm_type == "결재") {
					msg = "결재할 문서가 있습니다";
				}
				
				code += 
				`<div class="card">
				 	<div class="card-header">
				 		<a class="btn action" idx="${v.alarm_id}" data-bs-toggle="collapse" href="#collapse${v.alarm_id}">${msg}</a>
				 	</div>
				 	<div id="collapse${v.alarm_id}" class="collapse" data-bs-parent="#accordion">
				  		<div class="card-body">
				 			<p class="alarm p1">
				 				<span id="alarmdate">날짜 : ${v.alarm_date}</span><br><br>
				 				<a href="http://www.naver.com" id="alarmurl">바로가기 : ${v.alarm_url}</a>
				 			</p>
				 		</div>
				 	</div>
				  </div>`;
			})
			code += `</div></div>`;
			$('#alarmBody').html("");
			$('#alarmBody').html(code);
		},
		error : function(xhr) {
			alert(xhr.status);
		},
		dataType : "json" 
	})
}

$.alarmCount = function() {
	$.ajax({
		url : `${mypath}/SelectCount.do`,
		type : "get",
		data : {"id" : eid},
		success : function(res) {
			if(res > 0) {
				$("#alarm-count").text(res);
				$("#alarm-count").css("display", "inline-flex");
			} else {
				$("#alarm-count").hide();
			}
		},
		error : function(xhr) {
			alert(xhr.status);
		},
		dataType : "json"
	})
}

$.updateStatus = function(target) {
	$.ajax({
		url : `${mypath}/UpdateStatus.do`,
		type : "get",
		data : { "id" : vidx },
		success : function(res) {
			if(res > 0) {
				/*$(target).parents('#accordion .card').remove();*/
				/*$.alarmView();*/
				$.alarmCount();
			}
		},
		error : function(xhr) {
			alert(xhr.status);
		},
		dataType : "json"
	})
}

$.updateAll = function() {
	$.ajax({
		url : `${mypath}/UpdateAll.do`,
		type : "get",
		data : { "empid" : eid },
		success : function(res) {
			if(res > 0) {
				$("#alarmBody *").remove();
				$("#alarm-count").hide();
			}
		},
		error : function(xhr) {
			alert(xhr.status);
		},
		dataType : "json"
	})
}