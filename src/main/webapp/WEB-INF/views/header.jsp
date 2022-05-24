<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}">
</c:set>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>6조 해피하우스</title>
<link rel="icon" href="/img/favicon.png" />
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<!-- animate CSS -->
<link rel="stylesheet" href="/css/animate.css" />
<!-- owl carousel CSS -->
<link rel="stylesheet" href="/css/owl.carousel.min.css" />
<!-- font awesome CSS -->
<link rel="stylesheet" href="/css/all.css" />
<!-- flaticon CSS -->
<link rel="stylesheet" href="/css/flaticon.css" />
<link rel="stylesheet" href="/css/themify-icons.css" />
<!-- font awesome CSS -->
<link rel="stylesheet" href="/css/magnific-popup.css" />
<!-- swiper CSS -->
<link rel="stylesheet" href="/css/slick.css" />
<!-- style CSS -->
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/mine.css" />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9620381df0a5f019b155d5b376af607&libraries=services"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
	<header class="main_menu home_menu">
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-lg-12">
					<nav class="navbar navbar-expand-lg navbar-light">
						<a class="navbar-brand" href="/"> <img class="nav-img"
							src="/img/logo.png" alt="logo">
						</a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="menu_icon"><i class="fas fa-bars"></i></span>
						</button>
						<div class="collapse navbar-collapse main-menu-item"
							id="navbarSupportedContent">
							<ul class="navbar-nav">
								<li class="nav-item"><a class="nav-link" href="/">홈</a></li>
								<li class="nav-item"><a class="nav-link"
									href="${root}/about">소개</a></li>
								<li class="nav-item"><a class="nav-link"
									href="${root}/board/list">공지사항</a></li>

								<li class="nav-item"><a class="nav-link"
									href="${root}/confirmation">실거래가조회</a></li>

								<li class="nav-item"><a class="nav-link"
									href="${root}/contact">관심지역</a></li>
								<li class="nav-item"><a class="nav-link"
									href="${root}/qna/list">Q&A</a></li>

								<c:choose>
									<c:when test="${!empty memberInfo}">
										<li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="${root}/user/memberInfo"
											id="navbarDropdown_3" role="button" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">
												${memberInfo.name} </a>
											<div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
												<a class="dropdown-item" href="${root}/user/logout">
													로그아웃 </a> <a class="dropdown-item"
													href="${root}/user/memberInfo">마이페이지</a>
													<c:if test="${memberInfo.id == 'admin'}">
													<a class="dropdown-item"
													href="${root}/admin/list">회원관리</a>
													</c:if>
											</div></li>
										<li class="nav-item"><a class="nav-link" href=""></a></li>
									</c:when>
									<c:otherwise>
										<li class="nav-item"><a class="nav-link"
											href="${root}/user/login">로그인</a></li>
										<li class="nav-item"><a class="nav-link"
											href="${root}/user/join">회원가입</a></li>

									</c:otherwise>


								</c:choose>
							</ul>
						</div>
						<!--                         <div class="hearer_icon d-flex align-items-center">
                            <a id="search_1" href="javascript:void(0)"><i class="ti-search"></i></a>
                            <a id="logout">
                                <i class="ti-close"></i>
                            </a>
                            <a href="login.jsp">
                                <i class="ti-user"></i>
                            </a>
                        </div> -->
					</nav>
				</div>
			</div>
		</div>

	</header>
	<!-- Header part end-->