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
              <h2>비밀번호 찾기 </h2>
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
            class="col-lg-8 col-md-8 col-sm-8 container justify-content-center"
          >
            <div class="login_part_form">
              <div class="login_part_form_iner">
                <div class="text-center">
                  <h3>
                    비밀번호를 찾기 위해 정보를 입력해주세요  <br />
                    
                  </h3>
                </div>

                <form class="row contact_form" method="post" id="loginform" action="" >
             
                  <div class="col-md-12 form-group p_star">
                    <input type="text" class="form-control"
                      id="user_id"
                      name="id"
                      placeholder="아이디 입력"
                      required
                    />
                  </div>
                  
                  <div class="col-md-12 form-group p_star">
            
                      <input
                        type="text"
                        class="form-control"
                        id="phone"
                        name="phone"
                        placeholder="핸드폰 번호 입력 "
                        required
                      />
                   
                  </div>
                  <div class="col-md-12 form-group">
               
                    <button type="button" class="btn_3" id="findPwBtn">
                      찾기 
                    </button>

       <a class="lost_pass" href="${root}/user/findID"> 아이디 찾기 </a> 
                    <a class="lost_pass_left_align" href="${root}/user/join">회원가입</a>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================login_part end =================-->


    	<%@include file="footer.jsp" %>
     	    <script>
    var msg='${msg}';
    if(msg){
    	alert(msg);
    }
    
    $(document).ready(function () {
        $("#findPwBtn").click(function () {
            if (!$("#user_id").val()) {
                alert("아이디 입력!!!");
                return;
            } else if (!$("#phone").val()) {
                alert("연락 입력!!!");
                return;
            } else {
                $("#loginform").attr("action", "/user/findPassword").submit();
            }
        });
        $("#mvRegisterBtn").click(function () {
            location.href = "${root}/user/join";
        });
    });
      </script> 
    	
    	
    	
    	
    	
    	</body>

</html>
