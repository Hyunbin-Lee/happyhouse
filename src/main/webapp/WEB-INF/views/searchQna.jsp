<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${cookie.ssafy_id.value ne null}">
	<c:set var="saveid" value="${cookie.ssafy_id.value}" />
	<c:set var="idck" value=" checked=\"checked\"" />
</c:if>
<style>
.table-hover tbody tr:hover td, .table-hover tbody tr:hover th {
  background-color: #D1D1D1;
}
</style>
<%@include file="header.jsp"%>
<!-- breadcrumb part start-->
<section class="breadcrumb_part">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb_iner">
					<h2>Q&A</h2>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- breadcrumb part end-->

<!--================login_part Area =================-->
<section class="login_part section_padding">
	<div class="container">
		<div class="">
			<table class='table table-hover'>
				<tr align="center mb-5">
					<div class="table mb-5">
						<c:if test="${qna.answer != null}">
							<a class="btn btn-outline-info float-right mb-5">답변완료</a>
						</c:if>
						<c:if test="${memberInfo.id == 'admin'}">
							<c:if test="${qna.answer == null}">
								<a href="${root}/qna/answerForm?articleno=${qna.articleno}"
									class="btn btn-info">답변하기</a>
							</c:if>
							<c:if test="${qna.answer != null}">
								<a href="${root}/qna/updateAsForm?articleno=${qna.articleno}" class="btn btn-info">답변수정</a>
							</c:if>
						</c:if>
					</div>
				</tr>
				<tr>
					<td>게시글 번호</td>
					<td>${qna.articleno}</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>${qna.regtime}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${qna.userid}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${qna.subject}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${qna.content}</td>
				</tr>
			</table>
			<table class='table'>
				<c:if test="${qna.answer != null}">
					<tr>
						<div class="card mx-2 mb-5" width="300">
							<div class="card-header">답변</div>
							<div class="card-body">${qna.answer}</div>
						</div>
					</tr>
				</c:if>
				<tr align="center">
					<div class="table text-center">
						<a href="${root}/qna/list" class='btn btn-secondary'>목록</a>
						<c:if test="${memberInfo.id == qna.userid}">
							<a href="${root}/qna/remove?articleno=${qna.articleno}"
								class='btn btn-secondary'>삭제</a>
							<a href="${root}/qna/updateForm?articleno=${qna.articleno}"
								class='btn btn-secondary'>수정</a>
						</c:if>
					</div>
				</tr>
			</table>
		</div>
	</div>
</section>
<!--================login_part end =================-->
<script type="text/javascript">
	
</script>

<%@include file="footer.jsp"%>

</body>

</html>
