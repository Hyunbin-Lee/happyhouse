<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${cookie.ssafy_id.value ne null}">
	<c:set var="saveid" value="${cookie.ssafy_id.value}"/>
	<c:set var="idck" value=" checked=\"checked\""/>
</c:if>
<style>
label{
	font-size: 18px;
}
</style>
<%@include file="header.jsp" %>
    <!-- breadcrumb part start-->
    <section class="breadcrumb_part">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcrumb_iner">
              <h2>QnA</h2>
              <p style="font-size:20">happyhouse는 여러분의 소중한 의견에 항상 귀 기울이고 있습니다.</p>
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
          <div class="col-lg-8 col-md-8 col-sm-8 container justify-content-center" >

                <div class="text-center">
                  <h3>
                    게시글 작성  <br />
                
                  </h3>
                </div>
                  <form id="writeForm" class="row contact_form" action="" method="post">
                  <div class="col-md-12 form-group p_star mt-5">
                    <label>작성자 이름</label>
                    <input type="text" class="form-control" style="font-size:18px;" id="userid" name="userid" value="<c:out value='${memberInfo.id}'/>" readonly="readonly"/>
                  </div>
                  
                  <div class="col-md-12 form-group p_star mt-3">
                    <label>제목</label>
                      <input type="text" class="form-control" style="font-size:18px;" id="subject" name="subject" required/>
                  </div>
                  <div class="col-md-12 form-group p_star mt-3">
                    <label>내용</label>
                      <textarea class="form-control" style="height:300px; font-size:18px;" id="content" name="content"></textarea>
                  </div>
                  <div class="col-md-12 form-group mt-5">
                  <button type="button" class="btn_3" id="writeBtn" style="font-size:20px;">
                     작성완료 
                    </button>
                  </div>
                </form>

          </div>
        </div>
      </div>
    </section>
    <!--================login_part end =================-->
        <script type="text/javascript">
        $(document).ready(function () {
            $("#writeBtn").click(function () {
                if (!$("#subject").val()) {
                    alert("제목 입력!!!");
                    return;
                } else if (!$("#content").val()) {
                    alert("내용 입력!!!");
                    return; 
                } else {
                    $("#writeForm").attr("action", "${root}/qna/insert").submit();
                }
            });
        });
    </script>

    <%@include file="footer.jsp" %>

    	
    	
    	
    	
    	
    	</body>

</html>
