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
              <h2>login</h2>
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
                    환영합니다! <br />
                    로그인 해주세요.
                  </h3>
                </div>

                <form class="row contact_form" method="post" id="loginform" action="" >
                <input type="hidden" name="act" value="login" />
                  <div class="col-md-12 form-group p_star">
                    <input type="text" class="form-control"
                      id="user_id"
                      name="id"
                      placeholder="아이디 입력"
                      value="${saveid}"
                      required
                    />
                  </div>
                  
                  <div class="col-md-12 form-group p_star">
            
                      <input
                        type="password"
                        class="form-control"
                        id="password"
                        name="password"
                        placeholder="비밀번호 입력"
                        required
                      />
                   
                  </div>
                  <div class="col-md-12 form-group">
                    <div class="creat_account d-flex align-items-center">
                    <label class="form-check-label">
                        <input class="form-check-input " type="checkbox" id="idsave" name="idsave" value="saveok"${idck}> 아이디저장
                    </label>
                    </div>
                    <button type="button" class="btn_3" id="loginBtn">
                      로그인
                    </button>
       <a class="lost_pass" href="${root}/user/findPassword">비밀번호 찾기 </a> 
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
        $("#loginBtn").click(function () {
            if (!$("#user_id").val()) {
                alert("아이디 입력!!!");
                return;
            } else if (!$("#password").val()) {
                alert("비밀번호 입력!!!");
                return;
            } else {
                $("#loginform").attr("action", "/user/login").submit();
            }
        });
        $("#mvRegisterBtn").click(function () {
            location.href = "${root}/user/join";
        });
    });
      </script> 
    	
    	
    	
    	
    	
    	</body>

</html>
