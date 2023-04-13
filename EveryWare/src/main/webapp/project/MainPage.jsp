<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=0.8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
<title>EveryWare</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF" crossorigin="anonymous"></script>

<link rel="stylesheet" href="../css/MainsPgaetyle.css" />
<link rel="stylesheet" href="../weather/css/weatherstyle.css">
<script src="../js/jquery-3.6.4.min.js"></script>

<!-- <script src="../js/MainScripy.js"></script> -->

<script>

$(function() {
	$(".logo").on("click", () => {
		$(".card.clo").removeClass("clo");
		$(".comp").removeClass("open");
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
   		}, 400);
  	} 

  	$(".open-schedule").on("click", function() {
  		//$.MovePage("../schedule/Scheduler.jsp");
  		location.href="<%=request.getContextPath()%>/schedule/Scheduler.jsp";
  	});

  	$(".open-menu2").on("click", function() {
  		$.MovePage("../project/LoginPage.jsp");
  	});
  
 	$(".open-menu3").on("click", function() {
  		$.MovePage("../project/LoginPage.jsp");
  	});
  
  	$(".open-email").on("click", function() {
  		$.MovePage("<%=request.getContextPath()%>/emailList.do");
  	});
  
  	$(".open-menu5").on("click", function() {
  		$.MovePage("../project/LoginPage.jsp");
  	});
/*---------------------------------------------------------------------------  */
     $("#alarmbtn").click(function() {
		if($("#alarm-modal").css("display") === "none" ) {
			$("#alarm-modal").show();
		} else {
			$("#alarm-modal").hide();
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
</script>
</head>
  <body>
    <header>
      <nav>
        <h2 class="logo">EveryWare</h2>
      </nav>
      <nav class="navigation">
        <a><span class="icon"><ion-icon name="partly-sunny-outline"></ion-icon></span></a>
        <jsp:include page="Alarm.jsp"></jsp:include>
        <a><span class="icon"><ion-icon name="person-circle-outline"></ion-icon></span></a>
      </nav>
    </header>

    <div class="row">
      <div class="leftcolumn">
        <div class="card" style="height: 1500px">
          <!-- <h1 id="every-menu">MENU</h1> -->
          <!-- <div class="fakeimg" style="height: 750px"> -->
          <br />

          <p class="open-schedule">&nbsp;<ion-icon name="calendar-outline"></ion-icon> 회사 일정</p>
          <p class="open-menu2">&nbsp;<ion-icon name="laptop-outline"></ion-icon> 회사 게시판</p>
          <p class="open-menu3">&nbsp;<ion-icon name="card-outline"></ion-icon> 회사 결재</p>
          <p class="open-email">&nbsp;<ion-icon name="mail-outline"></ion-icon> 회사 이메일</p>
          <p class="open-menu5">&nbsp;<ion-icon name="file-tray-full-outline"></ion-icon> 회사 내용</p>
          <p class="open-menu6">&nbsp;<ion-icon name="time-outline"></ion-icon> H R</p>
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
        <!-- <div class="ca">우선 만들어둠 아직 미정</div>
        <div class="ca">우선 만들어둠 아직 미정</div> -->
        
        <!-- 메인 페이지에 있는 편의 기능들 다시 정리 할거에요. 원하시는 부분에 넣고 싶으면 넣으셔도 되요 -->
        <div class="card" style="width: 18%; display: inline-block; padding: 10px; margin: auto 0">
          <h2>Email</h2>
          <div class="fakeimg" style="height: 50px"></div>
        </div>
        
        <div class="card" style="width: 18%; display: inline-block; padding: 10px; margin-right: 1%">
          <h2>Board</h2>
          <div class="fakeimg" style="height: 50px"></div>
        </div>
        
        <div class="card" style="width: 18%; display: inline-block; padding: 10px; margin-right: 1%">
          <h2>Work</h2>
          <div class="fakeimg" style="height: 50px"></div>
        </div>
        
        <div class="card" style="width: 18%; display: inline-block; padding: 10px; margin-right: 1%">
          <h2>good</h2>
          <div class="fakeimg" style="height: 50px"></div>
        </div>
        
        <div class="card" style="width: 18%; display: inline-block; padding: 10px; margin-right: 1%">
          <h2>content</h2>
          <div class="fakeimg" style="height: 50px"></div>
        </div>
        
        <!-- 날씨 시작--------------------------------------------------------------- -->
			<div class="card"
				style="width: 40%; display: inline-block; padding: 10px">
				<h2>Today</h2>
				<div class="fakeimg" style="height: 200px" id="weatherdiv">

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
								<p id="desc">Every day, good day!</p>
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
        
        <div class="card" style="width: 59%; display: inline-block; padding: 10px">
          <h2>content</h2>
          <div class="fakeimg" style="height: 200px"></div>
        </div>

        <div class="card" style="width: 99%; display: inline-block; padding: 10px">
          <h2>content</h2>
          <div class="fakeimg" style="height: 200px"></div>
        </div>

        <!-- <div class="card">
          <h3>Every 게시판</h3>
          <div class="fakeimg"><p>내용1</p></div>
          <div class="fakeimg"><p>내용1</p></div>
          <div class="fakeimg"><p>내용1</p></div>
        </div> -->

        <iframe class="comp" src="" frameborder="0" width="100%" height="960px"></iframe>
      </div>
    </div>
    
    <script type="text/javascript" src="../weather/js/weather.js"></script>
  </body>
</html>