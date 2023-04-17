<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
<title>EveryWare</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js"
	integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF"
	crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<link rel="stylesheet" href="../css/MainsPgaetyle.css" />
<link rel="stylesheet" href="../weather/css/weatherstyle.css">
<script src="../js/jquery-3.6.4.min.js"></script>

<!-- <script src="../js/MainScripy.js"></script> -->

<script>
$(function() {
	$(".Everyware-logo").on("click", () => {
		
		setTimeout(function() {
			$(".rightcolumn .card").show()
		}, 200);
		setTimeout(function() {
			$(".comp").removeClass("open");
		}, 50);
		setTimeout(function() {
		$(".card.clo").removeClass("clo");
		
		}, 300);
	});
/*---------------- 메뉴 버튼 눌렀을 때 iframe 링크 부여하는 곳 ---------------  */
	$.MovePage = function( move ) {
		setTimeout(function() {
     		$(".rightcolumn .card").addClass("clo");
     		$(".comp").removeClass("open");
   		}, 100);
	
   		setTimeout(function() {
     		$(".comp").addClass("open");
     		$(".comp").attr("src", move);
     		$(".rightcolumn .card").css("display","none");
   		}, 400);
  	} 

  	$("#open-schedule").on("click", function() {
  		$.MovePage("../schedule/Scheduler.jsp");
  	<%-- location.href="<%=request.getContextPath()%>/schedule/Scheduler.jsp"; --%>
  	});

  	$("#open-posts").on("click", function() {
  		$.MovePage("<%=request.getContextPath()%>/postList.do");
  	});
  
 	$("#open-menu3").on("click", function() {
  		$.MovePage("../project/LoginPage.jsp");
  	});
  
  	$("#open-email").on("click", function() {
  		$.MovePage("<%=request.getContextPath()%>/emailList.do");
  	});
  
  	$("#open-menu5").on("click", function() {
  		$.MovePage("../project/LoginPage.jsp");
  	});
  	
	$("#open-admin").on("click", function() {
  		$.MovePage("../project/LoginPage.jsp");
  	});
/*---------------------------------------------------------------------------  */
    $("#alarmbtn").click(function() {
		if($("#alarm-modal").css("display") === "none" ) {
			$("#alarm-modal").show();
		} 
	}) 
	
	$(document).mouseup(function(e) {
		container = $('#alarm-modal');
		
		if(container.has(e.target).length === 0) {
			container.css('display','none');
		}
	})
});
function getCurrentTime() {
	var now = new Date();
  	var hours = now.getHours();
  	var minutes = now.getMinutes();
  	var seconds = now.getSeconds();

	if (hours < 10) {
    	hours = "0" + hours;
  	}
	
  	if (minutes < 10) {
    	minutes = "0" + minutes;
  	}
  	
  	if (seconds < 10) {
    	seconds = "0" + seconds;
  	}

  	var timeString = hours + ":" + minutes + ":" + seconds;
  	return timeString;
}

// 1초마다 현재 시간을 업데이트하는 함수
function updateTime() {
  	var currentTimeString = getCurrentTime();
	//document.getElementById("current-time").textContent = currentTimeString;
}

// 1초마다 updateTime 함수를 호출하여 현재 시간을 업데이트합니다.
setInterval(updateTime, 1000);

/* -----------------------------------원형 차트-------------------------------------------- */
 // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['출퇴근', 3],
          ['지각', 1],
          ['휴가', 1],
          ['병가', 1],
          ['기타', 1]
        ]);

        // Set chart options
        var options = {
                       'width':400,
                       'height':240};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
 /* -----------------------------------원형 차트 끝------------------------------------------ */
</script>
</head>
<body>
	<%
	String id = "a001";
	%>
	<input type="hidden" value="<%=id%>" id="empid">
	<header id="every-top">

		<nav>
			<h2 class="Everyware-logo">EveryWare</h2>
		</nav>

		<nav class="navigation">
			<a><span class="icon"><ion-icon	name="partly-sunny-outline"></ion-icon></span></a>
			<jsp:include page="Alarm.jsp"></jsp:include>
			<a><span class="icon"><ion-icon	name="person-circle-outline"></ion-icon></span></a>
		</nav>
	</header>

	<div class="row">
		<div class="leftcolumn">
			<div class="card" style="height: 1500px">
				<!-- <h1 id="every-menu">MENU</h1> -->
				<!-- <div class="fakeimg" style="height: 750px"> -->
				<br />

				<p id="open-schedule" class='every-left'>
					&nbsp;
					<ion-icon name="calendar-outline"></ion-icon>
					회사 일정
				</p>
				<p id="open-posts" class='every-left'>
					&nbsp;
					<ion-icon name="laptop-outline"></ion-icon>
					회사 게시판
				</p>
				<p id="open-menu3" class='every-left'>
					&nbsp;
					<ion-icon name="card-outline"></ion-icon>
					회사 결재
				</p>
				<p id="open-email" class='every-left'>
					&nbsp;
					<ion-icon name="mail-outline"></ion-icon>
					회사 이메일
				</p>
				<p id="open-menu5" class='every-left'>
					&nbsp;
					<ion-icon name="file-tray-full-outline"></ion-icon>
					회사 내용
				</p>
				<p id="open-menu6" class='every-left'>
					&nbsp;
					<ion-icon name="time-outline"></ion-icon>
					H R
				</p>
				
				<p id="open-admin" class='every-left'>
					&nbsp;
					<ion-icon name="time-outline"></ion-icon>
					관리자(임시)
				</p>
				<!-- </div> -->
			</div>
			<!-- <div class="card">
          <button class="btn1">출근</button>
          <button class="btn1">퇴근</button>
          <div class="fakeimg op" style="height: 80px">
            <span id="current-time" class="navtime"></span>
          </div>
        </div> -->
		</div>

		<div class="rightcolumn">

			<!-- 날씨 시작--------------------------------------------------------------- -->
			<div class="card"
				style="padding: 10px; float:left; ; width: 40%; overflow: hidden;">

				<div style=" width: 100%" id="weatherdiv">

					<div class="container-fluid">

						<h1 class="city-title">
							<span class="material-icons">place</span> <span id="city"></span>
						</h1>
						<p id="ntime" class="text-center"></p>
						<div class="row col-9 margin-auto">
							<div class="col-6" id="iconbox">
								<img src="" alt="" id="icon" class="floating">
							</div>
							<div class="col-6" id="nowtemp"></div>
							<div class="col-12 text-center">
								<p id="maxmintemp"></p>
								<p id="desc"></p>
							</div>
						</div>

						<div class="row light-blue py-20">
							<div class="offset-1 col-5">
								<ul>
									<li><i class="wi wi-cloudy"></i> 구름 <span id="clouds"></span></li>
									<li><i class="wi wi-windy"></i> 바람 <span id="wind"></span></li>
								</ul>
							</div>
							<div class="col-5">
								<ul>
									<li><i class="wi wi-humidity"></i> 습도 <span id="humidity"></span></li>
									<li><i class="material-icons">accessibility</i> 체감 <span
										id="feels_like"></span></li>
								</ul>
							</div>
						</div>
					</div>


					<div class="container swiper-slide" id="wrapper">
						<ul id="swiper" class="row">
							<li>
								<div class="dayWeather">
									<p class="daydate"></p>
									<img src="" alt="">
									<p class="daytemp"></p>
									<p class="daydesc"></p>
								</div>
							</li>
						</ul>
					</div>
				</div>

			</div>
			<!-- 날씨 끝--------------------------------------------------------------- -->



			<div class="card" style="padding: 10px; float:left;">
				<h2>오늘의 일정</h2>
				<div class="fakeimg" style="height: 100px" id="schedulediv"></div>
			</div>
			
			<div class="card" style="padding: 10px; display: inline-block">
			<h3>EveryWare Commuting status</h3>
				  <div id="chart_div" style="display: inline;"></div>
			</div>
			<!-- <div class="card">
          <h3>Every 게시판</h3>
          <div class="fakeimg"><p>내용1</p></div>
          <div class="fakeimg"><p>내용1</p></div>
          <div class="fakeimg"><p>내용1</p></div>
        </div> -->

			<iframe class="comp" src="" frameborder="0" width="100%"
				height="1080px"></iframe>
		</div>
		<!-- rightcolumn끝 -->
	</div>

	<script type="text/javascript" src="../weather/js/weather.js"></script>
	<script type="text/javascript" src="../js/Main.js"></script>
	<script type="text/javascript">
    	$.scheduleList();
    </script>

</body>
</html>