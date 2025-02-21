<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<html lang="zxx">

	<!-- breadcrumb part start-->
	<section class="breadcrumb_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<h2>주택 실거래가 조회</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb part end-->

	<!--================ confirmation part start =================-->

	<section class="confirmation_part section_padding">

		<!-- YSNO 시도구군동 선택 영역 추가 시작 -->
		<div class="container">
			<div class="col-md-12">
				<div class="form-group form-inline justify-content-center">
					<label class="mr-2" for="sido">시도 : </label> 
					<select
						class="form-control" id="sido">
						<option value="0">선택</option>
					</select>
					<label class="mr-2 ml-3" for="gugun">구군 : </label> 
					<select
						class="form-control" id="gugun">
						<option value="0">선택</option>
					</select> 
					<label class="mr-2 ml-3" for="dong">읍면동 : </label> 
					<select
						class="form-control" id="dong">
						<option value="0">선택</option>
					</select>
					<!-- <button type="button" id="aptSearchBtn">검색</button> -->
				</div>
			</div>
			<!-- YSNO 시도구군동 선택 영역 추가 끝 -->

			<div class="col-md-12">
				<div class="product_sidebar" >
					<div class="single_sedebar" >
						<form action="#">
							<input id="AptSearch" type="text" name="#" placeholder="아파트이름 검색"
								onkeyup='SearchApt()' style="background-color:lightblue"> <i class="ti-search"></i>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div id="map" style="width: 100%; height: 550px;"></div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div 
						style="width: 100%; height: 500px; overflow: auto; background-color:#ffffff;margin-top: 50px;">
						<h3>거래 정보</h3>
						<div class="form-check">
						  <input type="radio" class="form-check-input" id="radio1" name="optradio" value="price" onchange="sortAptResult(this)">거래액 ▼
						  <label class="form-check-label mr-4" for="radio1"></label>
					
						  <input type="radio" class="form-check-input" id="radio2" name="optradio" value="name" onchange="sortAptResult(this)">이름 ▼
						  <label class="form-check-label" for="radio2"></label>
						</div>
					    <!-- <div class="form-check">
						  <input class="form-check-input" type="checkbox" id="check1" name="option1" value="price" >
						  <label class="form-check-label mr-4">거래액</label>
						   &nbsp&nbsp&nbsp
						  <input class="form-check-input" type="checkbox" id="check2" name="option2" value="name" >
						  <label class="form-check-label">이름</label>
						</div> -->
					    
						<table class="table table-hover" id="aptTable" width="100%" cellspacing="0" cellpadding="0">
						<thead class="table-info">
							
								<th>번호</th>
								<th>거래액</th>
								<th>이름</th>
								<th>건축년도</th>
								<th>주소</th>
								<th>관심지역</th>
							
							</thead>
							<tbody id="Aptinfo"></tbody>
						</table>
					</div>
				</div>

			</div>
		</div>
		
			<!-- 
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="order_details_iner"
							style="width: 100%; height: 500px; overflow: auto">
							<h3>호흡기 진료 지정 의료기관</h3>
							<table width="100%" cellspacing="0" cellpadding="0">
								<tr>
									<th>병원이름</th>
									<th>주소</th>
									<th>RAT가능여부</th>
									<th>PCR가능여부</th>
									<th>전화번호</th>
								</tr>
								<tbody id="Hospitalinfo"></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
 			-->

	<div class="modal" id="aptDetailModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title" id="modal-title">아파트 거래 상세 정보</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <img src="${root}/img/apt.png" class="rounded" alt="Cinque Terre">
	        <div>
		        <div>
		        	<label id="apt-detail-aptName">이름 : </label>
		        </div>
		        <div>
		        	<label id="apt-detail-address">주소 : </label>
		        </div>
		        <div>
		        	<label id="apt-detail-buildYear">건축 년도 : </label>
		        </div>
		        <div>
		        	<label id="apt-detail-recentPrice">거래 가격 : </label>
		        </div>
		        <div>
		        	<label id="apt-detail-dealDate">거래 날짜 : </label>
		        </div>
		        <div>
		        	<label id="apt-detail-area">면적 : </label>
		        </div>
		        <div>
		        	<label id="apt-detail-floor">층 : </label>
		        </div>
	        </div>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
	      </div>
	
	    </div>
	  </div>
	</div>

	<script type="text/javascript" src="js/map.js"></script>
	<script>
	
	//table row click event 처리
	$(document.body).delegate('#aptTable tbody tr', 'click', function(event) {
		var tr = $(this);
		var td = tr.children();
        var recentPrice = td.eq(1).text();
        var aptName = td.eq(2).text();
        var buildYear = td.eq(3).text();
		if(event.target.id != 'like-btn'){
			// 테이블 행을 클릭했다면
			openAptDetailModal(recentPrice,aptName,buildYear);	
		}else{
			// 관심지역 버튼을 클릭했다면
			var value = event.target.value;
			
			if(value === 'empty'){
				// empty ==> full
				event.target.value = 'full';
				event.target.src = "${root}/img/icon/full_heart.png"
				updateIsfavState(recentPrice,aptName,buildYear,true);
			}else{
				// full ==> empty
				event.target.value = 'empty';
				event.target.src = "${root}/img/icon/empty_heart.png"
				updateIsfavState(recentPrice,aptName,buildYear,false);
			}
			
		}
		
	});
	
	 
	function updateIsfavState(recentPrice,aptName,buildYear,isfav){
		$.post(root + "/map/fav",
				{"aptName" : aptName,
				"buildYear" : buildYear,
				"recentPrice" : recentPrice,
				"isfav" : isfav
				 },
				function(data, status){
					console.log(status);
				}
				, "json"
		);
	}
	
	
	
	function openAptDetailModal(recentPrice,aptName,buildYear){
		$.get(root + "/map/apt/detail",
				{"aptName" : aptName,
				"buildYear" : buildYear,
				"recentPrice" : recentPrice
				 },
				function(data, status){
					console.log(data);
					$("#apt-detail-aptName")[0].innerHTML = $("#apt-detail-aptName")[0].innerHTML + data.aptName; 
					$("#apt-detail-address")[0].innerHTML = $("#apt-detail-address")[0].innerHTML + data.sidoName + " " 
					+ data.gugunName + " " + data.dongName + " " + data.jibun; 
					$("#apt-detail-buildYear")[0].innerHTML = $("#apt-detail-buildYear")[0].innerHTML + data.buildYear;
					$("#apt-detail-recentPrice")[0].innerHTML = $("#apt-detail-recentPrice")[0].innerHTML + data.dealAmount;
					$("#apt-detail-dealDate")[0].innerHTML = $("#apt-detail-dealDate")[0].innerHTML + data.dealYear + "."
					+ data.dealMonth + "." + data.dealDay;
					$("#apt-detail-area")[0].innerHTML = $("#apt-detail-area")[0].innerHTML + data.area + "m2";
					$("#apt-detail-floor")[0].innerHTML = $("#apt-detail-floor")[0].innerHTML + data.floor;
				}
				, "json"
		);
	}
	
	
	function sortAptResult(box){
		$.get(root + "/map/apt/sort",
				{criteria: $(box).val(),
				 dong: $("#dong").val()},
				function(data, status){
					$("tbody").empty();
					
					/* $("tbody").append(
						"<tr> <th>번호</th> <th>거래액</th> <th>이름</th> <th>건축년도</th> <th>주소</th> </tr>"
					); */
					$.each(data, function(index, vo) {
						let str = 
							"<tr>" +
							"<td class='row-data' data-toggle='modal' data-target='#aptDetailModal'>"+(index+1)+"</td>"+
							"<td class='row-data' data-toggle='modal' data-target='#aptDetailModal'>"+vo.recentPrice+"</td>"+
							"<td class='row-data' data-toggle='modal' data-target='#aptDetailModal'>"+vo.aptName+"</td>"+
							"<td class='row-data' data-toggle='modal' data-target='#aptDetailModal'>"+vo.buildYear+"</td>"+
							"<td class='row-data' data-toggle='modal' data-target='#aptDetailModal'>"+vo.sidoName+vo.gugunName+vo.dongName+vo.jibun+"</td>";
							if(vo.isfav){
								str += ("<td>"+
								"<img src='${root}/img/icon/full_heart.png' id = 'like-btn' value = 'full'/>"
								+"</td>"+
								"</tr>");
							}else{
								str+=("<td>"+
								"<img src='${root}/img/icon/empty_heart.png' id = 'like-btn' value = 'empty'/>"
								+"</td>"+
								"</tr>");
							}
						$("tbody").append(str);
					});
					displayMarkers(data);
				}
				, "json"
		);
	}
	
	
	
	function SearchApt(){
		$("#gugun").empty();
		$("#gugun").append("<option value='0'>선택</option>");
		$("#dong").empty();
		$("#dong").append("<option value='0'>선택</option>");
		$.get(root + "/map/apt/name"
				,{aptSearch: $("#AptSearch").val()}
				,function(data, status){
					$("tbody").empty();
					
					/* $("tbody").append(
						"<tr> <th>번호</th> <th>거래액</th> <th>이름</th> <th>건축년도</th> <th>주소</th> </tr>"
					); */
					$.each(data, function(index, vo) {
						let str = 
							"<tr>" +
							"<td class='row-data' data-toggle='modal' data-target='#aptDetailModal'>"+(index+1)+"</td>"+
							"<td class='row-data' data-toggle='modal' data-target='#aptDetailModal'>"+vo.recentPrice+"</td>"+
							"<td class='row-data' data-toggle='modal' data-target='#aptDetailModal'>"+vo.aptName+"</td>"+
							"<td class='row-data' data-toggle='modal' data-target='#aptDetailModal'>"+vo.buildYear+"</td>"+
							"<td class='row-data' data-toggle='modal' data-target='#aptDetailModal'>"+vo.sidoName+vo.gugunName+vo.dongName+vo.jibun+"</td>"
							;
							if(vo.isfav){
								str += ("<td>"+
								"<img src='${root}/img/icon/full_heart.png' id = 'like-btn' value = 'full'/>"
								+"</td>"+
								"</tr>");
							}else{
								str+=("<td>"+
								"<img src='${root}/img/icon/empty_heart.png' id = 'like-btn' value = 'empty'/>"
								+"</td>"+
								"</tr>");
							}
							
						$("tbody").append(str);
					});
					displayMarkers(data);
				}
				, "json"
		);
	}
	
	//YSNO 시도구군동 정보 가져오는 코드 추가 시작
	
	//let colorArr = ['table-primary','table-success','table-danger'];
	$(document).ready(function(){
		$.get(root + "/map/sido"
			,function(data, status){
				document.getElementById("sido").style.display="";
				$.each(data, function(index, vo) {
					$("#sido").append("<option value='"+vo.sidoCode+"'>"+vo.sidoName+"</option>");
				});
			}
			, "json"
		);
	});
	$(document).on("change", "#sido", function() {
		$.get(root + "/map/gugun"
				,{sido: $("#sido").val()}
				,function(data, status){
					$("#gugun").empty();
					$("#gugun").append('<option value="0">선택</option>');
					$.each(data, function(index, vo) {
						$("#gugun").append("<option value='"+vo.gugunCode+"'>"+vo.gugunName+"</option>");
					});
				}
				, "json"
		);
	});
	$(document).on("change", "#gugun", function() {
		$.get(root + "/map/dong"
				,{gugun: $("#gugun").val()}
				,function(data, status){
					$("#dong").empty();
					$("#dong").append('<option value="0">선택</option>');
					$.each(data, function(index, vo) {
						$("#dong").append("<option value='"+vo.dongCode+"'>"+vo.dongName+"</option>");
					});
				}
				, "json"
		);
	});
	$(document).on("change", "#dong", function() {
		$.get(root + "/map/apt"
				,{dong: $("#dong").val()}
				,function(data, status){
					$("tbody").empty();
					$.each(data, function(index, vo) {
						let str = 
							"<tr>" +
							"<td class='row-data' data-toggle='modal' data-target='#aptDetailModal'>"+(index+1)+"</td>"+
							"<td class='row-data' data-toggle='modal' data-target='#aptDetailModal'>"+vo.recentPrice+"</td>"+
							"<td class='row-data' data-toggle='modal' data-target='#aptDetailModal'>"+vo.aptName+"</td>"+
							"<td class='row-data' data-toggle='modal' data-target='#aptDetailModal'>"+vo.buildYear+"</td>"+
							"<td class='row-data' data-toggle='modal' data-target='#aptDetailModal'>"+vo.sidoName+vo.gugunName+vo.dongName+vo.jibun+"</td>";
								if(vo.isfav){
									str += ("<td>"+
									"<img src='${root}/img/icon/full_heart.png' id = 'like-btn' value = 'full'/>"
									+"</td>"+
									"</tr>");
								}else{
									str+=("<td>"+
									"<img src='${root}/img/icon/empty_heart.png' id = 'like-btn' value = 'empty'/>"
									+"</td>"+
									"</tr>");
								}
							
						/*
						let str = `
							<tr class="${colorArr[index%3]}">
							<td>${vo.aptCode}</td>
							<td>${vo.aptName}</td>
							<td>${vo.sidoName} ${vo.gugunName} ${vo.dongName} ${vo.jibun}</td>
							<td>${vo.buildYear}</td>
							<td>${vo.recentPrice}</td>
							</tr>
						`;
						*/
						$("tbody").append(str);
					});
					displayMarkers(data);
				}
				, "json"
		);
	});
	//YSNO 시도구군동 정보 가져오는 코드 추가 끝
				
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	</script>
	</section>

	<!--================ confirmation part end =================-->

	
	<%@include file="footer.jsp" %>
	</body>
</html>
