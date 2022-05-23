<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${cookie.ssafy_id.value ne null}">
	<c:set var="saveid" value="${cookie.ssafy_id.value}" />
	<c:set var="idck" value=" checked=\"checked\"" />
</c:if>

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
		<div class="row align-items-center">
			<div
				class="col-lg-8 col-md-8 col-sm-8 container justify-content-center">

				<div class="text-center">
					<h3>
						게시글 답변 <br />

					</h3>
				</div>
				<form id="updateAsForm" class="row contact_form" action=""
					method="post">
					<div class="col-md-12 form-group p_star">
						<label>답변 내용</label>
						<textarea class="form-control" style="height:200px" id="answer" name="answer">${qna.answer}</textarea>
					</div>
					<div class="col-md-12 form-group">
						<button type="button" class="btn_3" id="updateAsBtn">작성완료</button>
					</div>
				</form>

			</div>
		</div>
	</div>
</section>
<!--================login_part end =================-->
<script type="text/javascript">
	$(document).on("click", "#updateAsBtn", function() {
							if (!$("#answer").val()) {
								alert("내용 입력!!!");
								return;
							} else {
								$("#updateAsForm").attr("action",
										"/qna/updateAs/${qna.articleno}")
										.submit();
							}
						});
</script>

<%@include file="footer.jsp"%>






</body>

</html>
