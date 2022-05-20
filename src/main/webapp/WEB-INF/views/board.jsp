<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<section class="breadcrumb_part">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb_iner">
					<a class="nav-link" href="${root}/board/list"><h2>공지사항</h2></a>

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
			<input type="hidden" id="no" name="no" />
			<table class='table'>
				<tr align="center">
					<div class="table">
						<select name="key" id="key">
							<option value="all">---선택하세요---</option>
							<option value="no">번호</option>
							<option value="id">작성자</option>
							<option value="title">제목</option>
							<option value="contents">내용</option>
						</select> <input type="text" id="word" name="word" /> <input type="hidden"
							id="pageNo" name="pageNo" value='1' /> <input
							class='btn  btn-primary' type="button" value="검색" id="search">
						<c:if test="${!empty memberInfo}">
							<a class='btn btn-success float-right' href="writeBoard">글쓰기</a>
						</c:if>
					</div>
				</tr>

				<tr align="center">
					<th width="25">번호</th>
					<th width="200"><a href='javascript:sort(1)'>제목</a></th>
					<th width="50"><a href='javascript:sort(2)'>작성자</a></th>
					<th width="50"><a href='javascript:sort(3)'>등록일</a></th>
				</tr>

				<tbody id="data-container">
					<c:forEach var='board' items="${list}">
						<tr align="center">
							<td width="25"><a href='javascript:searchBoard(${board.no})'>${board.no}</a></td>
							<td width="200" class="boardContent"><a
								href='javascript:searchBoard("${board.no}")'>${board.title}</a>
							</td>
							<td width="50">${board.author}</td>
							<td width="50">${board.rg_date}</td>
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
	

	function  searchBoard(no) {
		var frm = document.getElementById('frm');
		var noForm = document.getElementById('no');
		noForm.value= no;
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


