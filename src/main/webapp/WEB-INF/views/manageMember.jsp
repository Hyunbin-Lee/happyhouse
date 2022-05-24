<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<section class="breadcrumb_part">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb_iner">
					<a class="nav-link" href="${root}/admin/list"><h2>회원관리</h2></a>

				</div>
			</div>
		</div>
	</div>
</section>
<!-- breadcrumb part end-->
<!-- breadcrumb part start-->
<section class="feature_part section_padding">
	<div class="container">
		<form id="frm">
			<input type="hidden" id="id" name="id" />
			<table class='table' id="memberTable">
				<tr align="center">
					<div class="table">
						<select style="font-size: 14px; width: 100px; height: 33.5px;"
							name="key" id="key">
							<option value="all">구분</option>
							<option value="id">아이디</option>
							<option value="name">이름</option>
						</select> <input type="text" style="height: 34px" id="word" name="word" />
						<input type="hidden" id="pageNo" name="pageNo" value='1' /> <input
							class='btn  btn-secondary btn-sm' type="button" value="검색"
							id="search">
					</div>
				</tr>

				<tr align="center">
					<th width="50">아이디</th>
					<th width="50">이름</th>
					<th width="100">이메일</th>
					<th width="100">주소</th>
					<th width="50">전화번호</th>
					<th width="40">회원탈퇴</th>
				</tr>
				<tbody id="data-container">
					<c:forEach var='member' items="${list}">
						<tr align="center">
							<td width="50">${member.id}</td>
							<td width="50">${member.name}</td>
							<td width="100">${member.email}</td>
							<td width="100">${member.address}</td>
							<td width="50">${member.phone}</td>
							<td width="40"><button type="button" id="deleteBtn"
									class="btn btn-outline-danger btn-sm">회원탈퇴</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>

		<div id="pagination-container">${pageBean.pageLink}</div>
	</div>
</section>
<!-- feature part end -->
<%@include file="footer.jsp"%>
<script type="text/javascript">
	$(function () {
		$('#search').click(function () {
			pagelist(1);
		})
		<c:if test="${!empty param.key}">
		  $('#key').val("${param.key}")
		</c:if>
		$('#word').val("${param.word}")
		$('#pageNo').val("${param.pageNo}")
	});
	
	
	function pagelist(cpage){
		var frm = document.getElementById('frm');
		var pageNo = document.getElementById('pageNo');
		pageNo.value=cpage;
		frm.action="list"
		frm.submit();
	};
	
	$(document.body).delegate('#memberTable tbody tr', 'click', function(){
		var tr = $(this);
		var td = tr.children();
		var memberId = td.eq(0).text();
		var d = confirm('정말로 탈퇴하겠습니까?');
		if (d) {
			alert('회원탈퇴 완료');
			$.post("/admin/delete", {"memberId": memberId}, "json");
		} else {
			alert('탈퇴가 취소되었습니다.');
		}
	})
	
</script>


</body>

</html>


