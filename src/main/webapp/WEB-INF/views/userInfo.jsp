<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<!-- breadcrumb part start-->
<section class="breadcrumb_part">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb_iner">
					<h2>회원정보</h2>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- breadcrumb part end-->

<!--================login_part Area =================-->
<section class="login_part section_padding ">
	<div class="container" style="font-size:18px;">
		<div class="row align-items-center">
			<div
				class="col-lg-8 col-md-8 col-sm-8 container justify-content-center">
				<div>
					<form method="post" action="" id="updateForm">

						<div class="mb-3 mt-3">
							<label for="id" class="form-label">아이디</label> <input type="text"
								class="form-control" id="id" name="id" value="${member.id}"
								readonly>
						</div>
						<div class="mb-3 mt-3">
							<label for="name" class="form-label">이름</label> <input
								type="text" class="form-control" id="name" name="name"
								value="${member.name}" readonly>
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">비밀번호</label> <input
								type="password" class="form-control" id="password"
								name="password" value="${member.password}" readonly="true">
						</div>
						<div class="mb-3 mt-3">
							<label for="email" class="form-label">이메일</label> <input
								type="text" class="form-control" id="email" name="email"
								value="${member.email}" readonly>
						</div>
						<div class="mb-3 mt-3">
							<label for="address" class="form-label">주소</label> <input
								type="text" class="form-control" id="address" name="address"
								value="${member.address}" readonly>
						</div>
						<div class="mb-3 mt-3">
							<label for="phone" class="form-label">휴대폰번호</label> <input
								type="text" class="form-control" id="phone" name="phone"
								value="${member.phone}" readonly>
						</div>
						<div class="mb-5 mt-5">
							<button type="button" id="changeInfoBtn"
								class="btn btn-outline-info">정보 수정</button>
							<button type="button" style="display: none" id="changeInfoBtn2"
								class="btn btn-info">수정 완료</button>
							<button type="button" id="deleteBtn"
								class="btn btn-outline-danger radius" style="float: right">회원 탈퇴</button>
						</div>
						<div class="mb-3 mt-3"></div>

					</form>
				</div>
			</div>
		</div>
</section>

<%@include file="footer.jsp"%>
<script>
	$(document).ready(function() {
		$("#changeInfoBtn").click(function() {
			$("#password").removeAttr("readonly");
			$("#password").attr("type", "text");
			$("#email").removeAttr("readonly");
			$("#address").removeAttr("readonly");
			$("#phone").removeAttr("readonly");
			$("#changeInfoBtn").css('display', 'none');
			$("#changeInfoBtn2").css('display', '');
		})

		$(document).on("click", "#changeInfoBtn2", function() {
			alert('수정완료');
			$("#updateForm").attr("action", "/user/update").submit();

		});

		$("#deleteBtn").click(function() {
			var d = confirm('정말로 탈퇴하시겠습니까?');
			if (d) {
				alert('회원탈퇴 완료');
				$("#updateForm").attr("action", "/user/delete").submit();
			} else {
				alert('탈퇴가 취소되었습니다.');
			}

		})

	})
</script>
</body>

</html>

