<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<c:if test="${memberInfo.id == null}">
	<script>
		alert("로그인 후에 이용해주세요.");
		location.href="${path}/user/login";
	</script>
</c:if>
<!doctype html>
<html lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="icon" href="/favicon.ico">
<title>vue-board-bootstrap</title>
<script defer="defer" type="module" src="${root}/js/chunk-vendors.e4819fc2.js"></script>
<script defer="defer" type="module" src="${root}/js/app.d3d64d11.js"></script>
<link href="${root}/css/chunk-vendors.129c79ae.css" rel="stylesheet">
<link href="${root}/css/app.2e611ec0.css" rel="stylesheet">
<script defer="defer" src="${root}/js/chunk-vendors-legacy.1c6799fa.js"
	nomodule></script>
<script defer="defer" src="${root}/js/app-legacy.59fd6d3e.js" nomodule></script>
</head>
<body>
	<noscript>
		<strong>We're sorry but vue-board-bootstrap doesn't work
			properly without JavaScript enabled. Please enable it to continue.</strong>
	</noscript>
	<div id="app"></div>
</body>
</html>