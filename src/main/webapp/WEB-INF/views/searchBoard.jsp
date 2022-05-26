<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${cookie.ssafy_id.value ne null}">
	<c:set var="saveid" value="${cookie.ssafy_id.value}" />
	<c:set var="idck" value=" checked=\"checked\"" />
</c:if>
<style>
.table-hover tbody tr:hover td, .table-hover tbody tr:hover th {
	background-color: white;
}
label{
	font-size: 20px;
}
th, td {
	font-size: 18px;
	vertical-align: middle;
	height: 65px;
}
.box {
    width: 150px;
    height: 150px; 
    border-radius: 70%;
    overflow: hidden;
}
.box2 {
    width: 60px;
    height: 60px; 
    border-radius: 70%;
    overflow: hidden;
}
.profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.top{
	margin-top: -300px;
}
</style>
<%@include file="header.jsp"%>
<!-- breadcrumb part start-->
<section class="breadcrumb_part">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb_iner">
					<h2>공지사항</h2>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- breadcrumb part end-->

<!--================login_part Area =================-->
<section class="login_part section_padding">
	<div class="container">
		<div class="row align-items-center">
			<table class='table table-hover'>
				<tr>
					<td>게시글 번호</td>
					<td>${board.no}</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>${board.rg_date}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${board.author}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${board.title}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea class="form-control float-center mt-5" id="contents"
							name="contents" style="width: 850px; height: 300px; font-size: 18px;" readonly>${board.contents}</textarea></td>
				</tr>
			</table>
			<table class="table">
				<tr align="center">
					<div class="table text-center mt-4">
						<a href="${root}/board/list" class='btn btn-secondary'>목록</a>
						<c:if test="${memberInfo.id == board.author}">
							<a href="${root}/board/remove?no=${board.no}"
								class='btn btn-secondary'>삭제</a>
							<a href="${root}/board/updateForm?no=${board.no}"
								class='btn btn-secondary'>수정</a>
						</c:if>
					</div>
				</tr>
			</table>
		</div>
		<c:if test="${memberInfo != null}">
			<hr>
		</c:if>
		<div class="container">
				<label class="mt-3" for="content">댓글</label>
				<c:if test="${memberInfo == null}">
				<hr>
				</c:if>
			<c:if test="${memberInfo != null}">
				<form name="commentInsertForm">
					<div class="input-group">
						<input type="hidden" name="bno" value="${board.no}" /> <input
							type="text" class="form-control" id="content" name="content"
							placeholder="내용을 입력하세요." style="height: 50px; font-size: 18px" />
						<button type="button" class="btn btn-info" name="commentInsertBtn"
							style="border-width: 0; border-radius: 7px; width: 80px; font-size: 18px; border-color: #17a2b8; color: white; background-color: #17a2b8;">등록</button>
					</div>
				</form>
			</c:if>
		</div>
		<div class="container" style="font-size: 18px;">
			<div class="commentList mt-5" style="font-size: 18px;">
				<%@include file="comment.jsp"%>
			</div>
		</div>
	</div>
</section>
<!--================login_part end =================-->
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#writeBtn").click(
						function() {
							if (!$("#author").val()) {
								alert("작성자 입력!!!");
								return;
							} else if (!$("#title").val()) {
								alert("제목 입력!!!");
								return;
							} else if (!$("#contents").val()) {
								alert("내용 입력!!!");
								return;
							} else {
								$("#writeForm").attr("action",
										"${root}/board/insert").submit();
							}
						});
			});
</script>

<%@include file="footer.jsp"%>






</body>

</html>
