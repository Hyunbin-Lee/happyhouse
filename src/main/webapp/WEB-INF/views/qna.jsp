<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.table-hover tbody tr:hover td, .table-hover tbody tr:hover th {
  background-color: #D1D1D1;
}
</style>
<%@include file="header.jsp"%>
<section class="breadcrumb_part">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb_iner">
					<a class="nav-link" href="${root}/qna/list"><h2>Q&A</h2></a>

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
			<input type="hidden" id="articleno" name="articleno" />
			<table class='table table-hover'>
				<tr align="center">
					<div class="table">
						<select class="" style="font-size: 14px; width: 100px; height: 33.5px;" name="key" id="key">
							<option value="all">구분</option>
							<option value="articleno">번호</option>
							<option value="userid">작성자</option>
							<option value="subject">제목</option>
							<option value="content">내용</option>
						</select> <input type="text" style="height:34px" id="word" name="word" /> <input type="hidden"
							id="pageNo" name="pageNo" value='1' /> <input
							class='btn  btn-secondary btn-sm' type="button" value="검색" id="search">
							<c:if test="${memberInfo != null}">
							<a class='btn btn-info float-right ' href="writeQna">문의하기</a>
							</c:if>
					</div>
				</tr>

				<tr align="center">
					<th width="25">번호</th>
					<th width="200">제목</th>
					<th width="50">작성자</th>
					<th width="50">등록일</th>
				</tr>

				<tbody id="data-container">
					<c:forEach var='qna' items="${list}">
						<tr align="center">
							<td width="25"><a href='javascript:searchQna(${qna.articleno})'>${qna.articleno}</a></td>
							<td width="200" class="qnaContent"><a
								href='javascript:searchQna("${qna.articleno}")'>${qna.subject}</a>
							</td>
							<td width="50">${qna.userid}</td>
							<td width="50">${qna.regtime}</td>
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
	})
	

	function  searchQna(articleno) {
		var frm = document.getElementById('frm');
		var noForm = document.getElementById('articleno');
		noForm.value= articleno;
		frm.action="search"
		frm.submit();
	}
	
	function pagelist(cpage){
		var frm = document.getElementById('frm');
		var pageNo = document.getElementById('pageNo');
		pageNo.value=cpage;
		frm.action="list"
		frm.submit();
	}
	
</script>


</body>

</html>


