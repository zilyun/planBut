<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date" %>
<%@include file="../header.jsp"%>
<style>
/* Set the size of the div element that contains the map */
#map {
	/* 지도 크기 지정 */
	height: 88vh;	/* 뷰포트 - 화면 높이의 88% 비율 */
	width: 100%;
}

#legend {
	font-family: Arial, sans-serif;
	background: #fff;
	padding: 10px;
	margin: 10px;
	border: 3px solid #000;
}

#legend h3 {
	margin-top: 0;
}

#legend img {
	vertical-align: middle;
}

div.row div {
padding-left: 0px  !important;
padding-right: 0px !important;
}


</style>

<!-- Contents -->

<div class="container-fluid non-scrollable-menu">
	<div class="row">


		<!-- 좌측 메뉴 -->
		<div class="sub-menu col-xs-4 col-md-3">
		
			<!-- 플래너 정보 출력 -->
			<ul class="list-group" style="margin-bottom: 0;">
				<li class="list-group-item">
					<h3>${article.subject }</h3>
					<span>여행 시작일: ${fn:substring(article.s_date, 0,10)}</span> 
					<span>인원: ${article.people }</span>
					<span>아이디: ${article.m_id }</span>
					<span>플래너코드: ${article.plan_code }</span>
				</li>
			</ul>
			
			<!-- 플래너 루트 리스트 -->
			<div class="scrollable-menu">
				<ul class="list-group">
				
					<c:forEach var="cp" items="${cplist }">
					<!-- cplist를 불러왔다면 주석을 보여주세요 -->
					<li class="list-group-item">
						
						
						<!-- 이동일 계산 -->
						
						<!-- 하루 단위 숫자 -->
						<fmt:parseNumber var="dayUnit" value="${1000*60*60*24 }" /> 
						<%--
						<c:set var="e_date" value="<%=new Date(new Date().getTime() + 1000*60*60*24) %>"/>
						<h5>${e_date }</h5>
						<h5>${dayUnit }</h5>
						--%>
						<!-- 시작일 -->
						<c:set var="s_date" value="${fn:substring(cp.s_date, 0,10)}" property="time" />
						<%--
						<h5>시작일: ${s_date }</h5>
						--%>
						<fmt:parseDate var="s_date" value="${s_date}" pattern="yyyy-MM-dd" /> <!-- String to Date -->
						<%--
						<h5>시작일(Date): ${s_date }</h5>
						<h5>시작일( time): ${s_date.time }</h5>
						<fmt:parseDate var="dayDate" value="${cp.day }" pattern="dd" />
						<h5>기간(Date): ${dayDate }</h5>
						<fmt:parseNumber var="dayNum" value="${dayUnit*cp.day }"/> <!-- Date to Number -->
						<h5>기간(Number): ${dayNum }</h5>
						<fmt:parseNumber var="sdateNum" value="${s_date.time / dayUnit}" integerOnly="true"/> <!-- Date to Number --> <!-- 일수 출력 -->
						<h5>시작일(Number): ${sdateNum }</h5>
						<fmt:parseNumber var="e_date" value="${(s_date.time + dayNum)/dayUnit}" integerOnly="true"/>						
						 --%>
						<%--<fmt:parseNumber var="e_date" value="<%=new Date((pageContext.getAttribute(s_date)).getTime() + 1000*60*60*24*3)) %>"/>--%>
						<%--
						<h5>이동일(Number): ${e_date }</h5>
						<fmt:parseDate var="e_date" value="${e_date}" pattern="yyyy-MM-dd" /> <!-- Date to String -->
						<h5>이동일(Date): ${e_date }</h5>
						 --%>
						
						<!-- 최종 포맷 -->
						<fmt:formatDate var="s_date" value="${s_date}" pattern="yyyy-MM-dd"  /> <!-- Date to String -->
						<%--
						<fmt:formatDate var="e_date" value="${e_date}" pattern="yyyy-MM-dd" /> <!-- Date to String -->
						<h4>시작일: ${s_date }</h4>
						<h4>이동일: ${e_date }</h4>
						 --%>
						<!-- 이동일 계산 -->
						
						
						<h3 class="root-city">${cp.city.ct_name }</h3> 
						<span class="root-day">${cp. day }박</span> 
						<span class="root-date">${fn:substring(s_date, 5,10)} ~ ${e_date} </span> 
						<span class="root-transport">${cp.trans }</span>
					</li>
					</c:forEach>
				
					<!-- 샘플 -->
					<li class="list-group-item">
						<h3 class="root-city">런던</h3> 
						<span class="root-day">3박</span> 
						<span class="root-date">MM-DD ~ MM-DD</span> 
						<span class="root-transport"></span>
					</li>
					<li class="list-group-item">
						<h3 class="root-city">파리</h3> 
						<span class="root-day">3박</span> 
						<span class="root-date">MM-DD ~ MM-DD</span> 
						<span class="root-transport">[기차 이동]</span>
					</li>
					<li class="list-group-item">
						<h3 class="root-city">뮌헨</h3> 
						<span class="root-day">3박</span> 
						<span class="root-date">MM-DD ~ MM-DD</span> 
						<span class="root-transport">[항공 이동]</span>
					</li>
					<li class="list-group-item">
						<h3 class="root-city">베를린</h3> 
						<span class="root-day">3박</span> 
						<span class="root-date">MM-DD ~ MM-DD</span> 
						<span class="root-transport">[버스 이동]</span>
					</li>
					<li class="list-group-item">
						<h3 class="root-city">프라하</h3> 
						<span class="root-day">3박</span> 
						<span class="root-date">MM-DD ~ MM-DD</span> 
						<span class="root-transport">[기차 이동]</span>
					</li>
				</ul>
			</div>


			<!-- 경로 부분 sample -->
			<div id="cityblock1" class="cityblock" style="position: relative; top: 0px; left: 0px;">
				<p class="trsinfo">
				<div style="padding-top: 0px; padding-bottom: 0px">
					<div style="float: left; width: 29px; height: 40px; border-right: 3px solid #3ad195;">&nbsp;</div>
					<div style="float: left; width: 150px; height: 40px; padding-top: 10px; margin-left: -25px;">
						<div
							style="border-radius: 3px; display: inline-block; text-align: center; padding-top: 2px; padding-bottom: 2px; margin-right: 3px; width: 50px; background: #3ad195; cursor: pointer;"
							class="div_btnTrsTool" onclick="showTrsTool('181071004','181071001','2019-05-22',1)">
							<font style="font-size: 9pt; color: #fff" id="trstype_txt_1">버스 <i class="fa fa-chevron-circle-down"></i></font>
						</div>
						&nbsp;<font style="font-size: 8pt; color: #c0c0c0"></font>
					</div>
					<div style="clear: both"></div>
				</div>
				</p>
				<div class="cityinfo">
					<div style="width: 29px; border-right: 3px solid #3ad195; height: 7px;"></div>
					<input type="hidden" class="cityserial" value="181071001">
					<div width="100%;overflow-x:hidden">
						<div
							style="float: left; width: 53px; height: 53px; padding-left: 7px; background: #fff; padding-top: 13px; border-radius: 100px; border: 3px solid #3ad195; cursor: pointer"
							class="div_mngSlp" onclick="mngSlp('아부다비','181071001',0,1)">
							<a class="a_mngSlp" href="javascript:mngSlp('아부다비','181071001',0,1)"><font style="color: #696969; font-size: 10pt; font-weight: bold"
								class="nights">1박 <i class="fa fa-angle-down"></i></font></a>
						</div>
						<div style="float: left; width: 215px; padding-left: 10px; padding-top: 7px;">
							<div style="float: left; width: 148px">
								<div>
									<font class="stubby_s_black"> 아부다비</font>&nbsp;<a class="btnDel" href="javascript:delCity(1)"><font
										style="font-size: 9pt; color: #c0c0c0"><i class="fa fa-times-circle"></i></font></a>
								</div>
								<div class="date_in_out">5월23일(목)~24일(금)</div>
							</div>
							<div style="float: left; padding-right: 5px; width: 57px;">
								<div id="cp_0"
									style="height: 52px; margin-top: -8px; text-align: center; padding-top: 3px; padding-bottom: 3px; border: 1px solid #efefef; background: #fff; border-radius: 8px;"
									onclick="showBucketList('0','아부다비','181071001',0)">
									<div>
										<font style="font-size: 19pt; color: #3ad195" id="cp_heart_0"><i class="fa fa-info-circle" aria-hidden="true"></i></font>
									</div>
									<div style="margin-top: -8px;">
										<span id="span_schd_cnt_0" style="font-size: 8pt; display: none;">0</span>
									</div>
								</div>
							</div>
						</div>
						<div style="clear: both"></div>
					</div>
					<div style="width: 29px; border-right: 3px solid #3ad195; height: 7px;"></div>
				</div>
			</div>


		</div>	<!-- 좌측메뉴 end -->

		<!-- 우측 컨텐츠 -->
		<div class="row-fluid col-xs-8 col-md-9">
		
			<!-- 상단 메뉴 -->
			<div class="btn-group btn-group-justified" role="group" aria-label="Justified button group">
				<a href="${pageContext.request.contextPath}/plan/plan.do?plan_code=${article.plan_code}" class="btn btn-default" role="button">루트</a>
				<a href="${pageContext.request.contextPath}/plan/calendar.do?plan_code=${article.plan_code}" class="btn btn-default" role="button">일정</a> 
				<a class="btn btn-default" role="button"></a>
				<a href="${pageContext.request.contextPath}/plan/create.do?plan_code=${article.plan_code}" class="btn btn-success" role="button">저장</a>
				<a href="${pageContext.request.contextPath}/plan/course.do?plan_code=${article.plan_code}" class="btn btn-info" role="button">다음단계로</a>
			</div>

			<!-- 버튼 형태 상단 메뉴 -->
			<!-- 
			<div class="btn-group btn-group-justified" role="group" aria-label="Justified button group">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default">
						<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">루트</font></font>
					</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default">
						<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">일정</font></font>
					</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default">
						<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">저장</font></font>
					</button>
				</div>
			</div>
			-->

			<!-- 컨텐츠 -->
			<div class="contents">

				<!-- Maps -->

				<div id="map"></div>
				<div id="legend">
					<h3>Legend</h3>
				</div>
				
				<!-- Maps end -->

			</div>
		</div>
	</div>
</div>




<!-- 플래너 생성 창 -->
<div id="plannermodal" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
		<h2>새 플래너 생성</h2>
		<form name="planFrm" method="post" action="${pageContext.request.contextPath}/plan/plan.do" onsubmit="return loginCheck(this)">
			<input type="hidden" name="m_id" value="${session_m_id }">
			<div>
				<label for="">플래너 명</label>&nbsp;<input type="text" name="subject" id="subject" placeholder="ex) 나의 여행 플래너" required>
			</div>
			<div>
				<label for="">여행 시작일</label>&nbsp;<input type="text" name="s_date" id="s_date" placeholder="ex) 2019-05-01" required>
			</div>
			<div>
				<label for="">인원</label>&nbsp;<input type="text" name="people" id="people" placeholder="ex) 1" required>
			</div>
			<p>
				<input type="submit" value="플래너 생성" style="cursor: pointer">
			</p>
		</form>
	</div>
</div>


<!-- Script 스크립트 -->


<script>
	var map;
	function initMap() {
		map = new google.maps.Map(document.getElementById('map'), {//지도에 띄우기
			zoom : 15,
			center : new google.maps.LatLng(-33.91722, 151.23064),
			mapTypeId : 'roadmap' //roadmap 기본값 생략 가능 roadmap,satellite,satellite,terrain  
		});

		var iconBase = 'https://maps.google.com/mapfiles/kml/shapes/';
		var icons = {// 아이콘 분류, 경로
			parking : {
				name : 'Parking',
				icon : iconBase + 'parking_lot_maps.png'
			},
			library : {
				name : 'Library',
				icon : iconBase + 'library_maps.png'
			},
			info : {
				name : 'Info',
				icon : iconBase + 'info-i_maps.png'
			}
		};

		var features = [ //각좌표에 아이콘 지정
		{
			position : new google.maps.LatLng(-33.91721, 151.22630),
			type : 'info'
		}, {
			position : new google.maps.LatLng(-33.91539, 151.22820),
			type : 'info'
		}, {
			position : new google.maps.LatLng(-33.91747, 151.22912),
			type : 'info'
		}, {
			position : new google.maps.LatLng(-33.91910, 151.22907),
			type : 'info'
		}, {
			position : new google.maps.LatLng(-33.91725, 151.23011),
			type : 'info'
		}, {
			position : new google.maps.LatLng(-33.91872, 151.23089),
			type : 'info'
		}, {
			position : new google.maps.LatLng(-33.91784, 151.23094),
			type : 'info'
		}, {
			position : new google.maps.LatLng(-33.91682, 151.23149),
			type : 'info'
		}, {
			position : new google.maps.LatLng(-33.91790, 151.23463),
			type : 'info'
		}, {
			position : new google.maps.LatLng(-33.91666, 151.23468),
			type : 'info'
		}, {
			position : new google.maps.LatLng(-33.916988, 151.233640),
			type : 'info'
		}, {
			position : new google.maps.LatLng(-33.91662347903106, 151.22879464019775),
			type : 'parking'
		}, {
			position : new google.maps.LatLng(-33.916365282092855, 151.22937399734496),
			type : 'parking'
		}, {
			position : new google.maps.LatLng(-33.91665018901448, 151.2282474695587),
			type : 'parking'
		}, {
			position : new google.maps.LatLng(-33.919543720969806, 151.23112279762267),
			type : 'parking'
		}, {
			position : new google.maps.LatLng(-33.91608037421864, 151.23288232673644),
			type : 'parking'
		}, {
			position : new google.maps.LatLng(-33.91851096391805, 151.2344058214569),
			type : 'parking'
		}, {
			position : new google.maps.LatLng(-33.91818154739766, 151.2346203981781),
			type : 'parking'
		}, {
			position : new google.maps.LatLng(-33.91727341958453, 151.23348314155578),
			type : 'library'
		} ];

		// Create markers.
		features.forEach(function(feature) {
			var marker = new google.maps.Marker({
				position : feature.position,// 위치 좌표
				icon : icons[feature.type].icon, //아이콘 경로
				map : map, //어느 지도에 띄울지 지정
				info : '말풍선 안에 들어갈 내용'
			});
			var infowindowCon = new google.maps.InfoWindow({
				content : '내용입니다'
			});
			marker.addListener('click', function() {//마커마다 클릭이벤트
				map.setCenter(marker.getPosition());
				infowindowCon.open(map, marker);
			});
		});

		var xy = {
			lat : -33.91722,
			lng : 151.23064
		};
		var marker = new google.maps.Marker({// 일반 마커용로 센터에 표시
			position : xy,
			map : map,
			info : '말풍선 안에 들어갈 내용',
			title : '제목(마우스오버하면 나옴)~' // 마우스 오버시에 나오는 이벤트
		});
		var content = "내용내용내용내용~"; // 말풍선 안에 들어갈 내용

		// 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
		var infowindow = new google.maps.InfoWindow({
			content : content
		});

		google.maps.event.addListener(marker, "click", function() {
			map.setCenter(marker.getPosition());
			infowindow.open(map, marker);
		});

		google.maps.event.addDomListener(window, 'load', initMap);

		var legend = document.getElementById('legend');
		for ( var key in icons) {
			var type = icons[key];
			var name = type.name;
			var icon = type.icon;
			var div = document.createElement('div');
			div.innerHTML = '<img src="' + icon + '"> ' + name;
			legend.appendChild(div);
		}

		map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(legend);
	}
</script>

<!-- api key --><!-- 사용할 때만 활성화 -->
<!-- 
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBM_-xOIwPL0F_UknEZ1m-uLVM28-Wt_Ao&callback=initMap">	
</script>
 -->


<script>

/* 플래너 추가 폼 (plannermodal) 동작 제어 */
$(function(){
	var plancode='${article.plan_code}';
	if(plancode==""){
		//$("#plannermodal").show();
		location.href="#plannermodal";
	}
});

/* 화면 스크롤 제거 */
$(function(){
	$("body").css("overflow", 'hidden');
});

</script>


<!-- end Contents -->


<%@include file="../footer.jsp"%>
