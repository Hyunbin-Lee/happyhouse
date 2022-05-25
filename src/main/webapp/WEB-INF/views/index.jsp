<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

    <!--::header part start::-->

	<%@include file="header.jsp" %>
    <!-- banner part start-->
    <section class="banner_part"style="background-image: url(img/banner_img.png);
    background-size: cover;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <div class="banner_text">
                        <div class="banner_text_iner">
                            <h3>HappyHouse에 오신것을 환영합니다 </h3>
                            <p>실거래가 조회와 관심지역 정보를 한눈에 파악하세요</p>
                          	 <p>실거래가 조회와 관심지역 정보를 한눈에 파악하세요</p>
  
                            <a href="${root}/about" class="btn_1">자세히 보기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <!-- banner part start-->


    <!-- trending item start-->
    <section class="trending_items">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section_tittle text-center">
                        <h2>실시간 뉴스</h2>
                    </div>
                </div>
            </div>
            <div class="row" id="div-news">
                
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="section_tittle text-right">
                        <h2 style="color:red"><a href="${root}/newsView">더 많은 뉴스 보러가기!</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- trending item end-->
    
    <script>
	    $(document).ready(function(){
			$.get("${root}/articles",
				{pageNo: 1},
				function(data, status){
					var div_news = $("#div-news")[0];
					$.each(data, function(index, vo) {
						if(index<6){
							div_news.innerHTML += 
								"<div class='col-lg-4 col-sm-6'>"+
			                    "<div class='single_product_item'>"+
		                        "<img src='"+vo.imgURL+"'  alt='#' class='img-fluid' width=400px>"+
		                        "<h3> <a href='"+vo.titleLink+"'>"+vo.title+"</a> </h3>"+
		                        "<p> <a href='"+vo.bodyLink+"'>"+vo.body+"</p>"+
			                    "</div>"+
			                 	"</div>";
						}
					});
				}
				, "json"
			);
		});
    </script>
    
     
   	
    <script>
	    $(document).ready(function(){
			$.get("${root}/articles",
				{pageNo: 1},
				function(data, status){
					var div_news = $("#div-news")[0];
					$.each(data, function(index, vo) {
						if(index<6){
							div_news.innerHTML += 
								"<div class='col-lg-4 col-sm-6'>"+
			                    "<div class='single_product_item'>"+
		                        "<img src='"+vo.imgURL+"'  alt='#' class='img-fluid' width=400px>"+
		                        "<h3> <a href='"+vo.titleLink+"'>"+vo.title+"</a> </h3>"+
		                        "<p> <a href='"+vo.bodyLink+"'>"+vo.body+"</p>"+
			                    "</div>"+
			                 	"</div>";
						}
					});
				}
				, "json"
			);
		});
    </script>
    
     
   	<%@include file="footer.jsp" %>