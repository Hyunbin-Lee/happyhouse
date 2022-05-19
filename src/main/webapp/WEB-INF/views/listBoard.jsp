<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/title.jsp" %>    
<script type="text/javascript"  src="js/jquery-3.3.1.js"></script>
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
		frm.action="searchBoard.do"
		frm.submit();
	}
	
	function pagelist(cpage){
		var frm = document.getElementById('frm');
		var pageNo = document.getElementById('pageNo');
		pageNo.value=cpage;
		frm.action="listBoard.do"
		frm.submit();
	}
</script>

				<form id="frm">
					<input type="hidden" id="no" name="no" />
					<table class='table'>
						<tr>
							<th colspan="4">게시글 목록</th>
						</tr>
						<tr align="center">
							<td colspan="4" align="right">
								<select name="key" id="key">
									<option value="all">---선택하세요---</option>
									<option value="id">아이디</option>
									<option value="title">제목</option>
									<option value="contents">내용</option>
								</select>
								<input type="text" 		id="word" 		name="word" />
								<input type="hidden" 	id="pageNo" 	name="pageNo" />
								<input type="btn btn-primary" type="button"	value="검색" 	id="search">
								<a class="btn btn-primary" href="insertBoardForm.log">글쓰기</a>
								<%-- <c:if test="${not empty id }">
									<a href="insertBoardForm.log">글쓰기</a>
								</c:if> --%>
							</td>
						</tr>
						<tr align="center">
							<td width="50">번 호</td>
							<td width="150">제 목</td>
							<td width="50">아이디</td>
							<td width="100">게시일</td>
						</tr>
						<tbody id="data-container">
							<c:forEach  var='board' items="${list}">
								<tr>
									<td width="50"><a href='javascript:searchBoard(${board.no})'>${board.no}</a></td>
									<td width="150" class="boardContent">
											<a href='javascript:searchBoard(${board.no})'>${board.title}</a>
											<div class='boardSub'  data-no='${board.no}'></div>
									</td>
									<td width="50">${board.id}</td>
									<td width="100">${board.regdate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			<div id="pagination-container">${pageBean.pageLink}</div>
	</div>
</body>
</html>













