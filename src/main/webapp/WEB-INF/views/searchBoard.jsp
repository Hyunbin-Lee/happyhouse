<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${cookie.ssafy_id.value ne null}">
	<c:set var="saveid" value="${cookie.ssafy_id.value}"/>
	<c:set var="idck" value=" checked=\"checked\""/>
</c:if>
	
<%@include file="header.jsp" %>
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
		<table class='table'>
		<tr><td>게시글 번호 </td><td>${board.no}</td></tr>
		<tr><td>작성일</td><td>${board.rg_date}</td></tr>
		<tr><td>작성자</td><td>${board.author}</td></tr>
		<tr><td>제목 </td><td>${board.title}</td></tr>
		<tr><td>내용</td><td>${board.contents}</td></tr>
		<tr><td colspan="2" align="center">
			<a href="${root}/board/list" class='btn btn-secondary' >목록</a>
			<c:if test="${memberInfo.id == board.author}">
			<a href="${root}/board/remove?no=${board.no}" 		class='btn btn-secondary' >삭제</a>
 			<a href="${root}/board/updateForm?no=${board.no}" 	class='btn btn-secondary' >수정</a>
			</c:if>
		</td></tr>
		</table>
        </div>
      </div>
    </section>
    <!--================login_part end =================-->
        <script type="text/javascript">
        $(document).ready(function () {
            $("#writeBtn").click(function () {
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
                    $("#writeForm").attr("action", "${root}/board/insert").submit();
                }
            });
        });
    </script>

    <%@include file="footer.jsp" %>

    	
    	
    	
    	
    	
    	</body>

</html>
