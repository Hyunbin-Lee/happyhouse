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
						<h2>실시간 뉴스 조회</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb part end-->


    <!-- trending item start-->
    <section class="trending_items">
    	<!-- 검색 창 -->
    	<div class = "container pb-2">
			<form action="#">
		    	<div class = "form-row">
			    	<div class="col-lg-11">
							<input class="form-control form-control-lg" id="NewsSearch" type="text" name="#" placeholder="검색"
								onkeyup='SearchNews()'>
					</div>
				
			    	<div class="col-lg-1">
						<button type="submit" class="btn btn-info btn-lg">검색</button>
					</div>
				</div>
			</form>
		</div>
		<!-- 연관 검색어 -->
    	<div class = "container pb-5">
			<form action="#" id="related-search-form" class="form-inline">
				<button type="button" class="m-2 form-control btn btn-outline-info btn-lg noHover" >검색</button>
				<button type="button" class="m-2 form-control btn btn-outline-info btn-lg noHover">검색</button>
				<button type="button" class="m-2 form-control btn btn-outline-info btn-lg noHover">검색</button>
				<button type="button" class="m-2 form-control btn btn-outline-info btn-lg noHover">검색</button>
				<button type="button" class="m-2 form-control btn btn-outline-info btn-lg noHover">검색</button>
				<button type="button" class="m-2 form-control btn btn-outline-info btn-lg noHover">검색</button>
			</form>
		</div>
		<!-- 뉴스 -->
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
    <style>
	    .noHover{
		    pointer-events: none;
		}
    </style>
     
   	<%@include file="footer.jsp" %>
