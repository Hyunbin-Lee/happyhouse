<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	var bno = '${board.no}';
	$('[name=commentInsertBtn]').click(function() {
		if(!$("#content").val()){
			alert("내용을 입력하세요.");
			return;
		}else{
			var insertData = $('[name=commentInsertForm]').serialize();
			commentInsert(insertData);
		}
	});

	function commentList() {
		$.ajax({
				url : '/comment/list',
				type : 'get',
				data : {
					'bno' : bno
				},
				success : function(data) {
					var a = '';
					$.each(
							data,
							function(key, value) {
							a += '<div class="container mt-5">'
							a += '<div class="commentArea" style="font-size:17px; margin-left:5px;">';
							a += '<div class="box2" style="float:left;">'
							if(value.userid == "ssafy"){
								a += '<img class="profile" src="/img/p1.png" width="60px">'
							}else if(value.userid == "admin"){
								a += '<img class="profile" src="/img/p2.png" width="60px">'
							}else if(value.userid == "amy1223"){
								a += '<img class="profile" src="/img/p3.png" width="60px">'
							}else if(value.userid == "kdg"){
								a += '<img class="profile" src="/img/p4.png" width="60px">'
							}else{
								a += '<img class="profile" src="/img/p0.png" width="60px">'
							}
							a += '</div>';
							a += '<div class="commentInfo'+value.cno+'" style="margin-left:19px; font-size:20px; font-weight:bold;">'
									+ value.userid;
							a += '<a href="javascript:void(0);" onclick="commentDelete('
									+ value.cno
									+ ');" style="font-size:17px; color:#F47C7C; float:right;"> 삭제</a>';
							a += '</div>';
							a += '<div class="commentInfo'+value.cno+'" style="margin-left:20px;">'
									+ value.reg_date
									+ '</div>';
							a += '</div>';
							a += '<div>';
							a += '</div>';
							a += '<div class="commentContent'+value.cno+'"> <p style="margin-left:20px; font-size:18px;">'
									+ value.content + '</p>';
							a += '<hr>';
							a += '</div></div></div>';
						});
					$(".commentList").html(a);
				}
		});
	}
	
	function commentInsert(insertData){    
		$.ajax({
			url : '/comment/insert',
			type : 'post',
			data : insertData,
			success : function(data){
				if(data == 1) {
					commentList();
					$('[name=content]').val('');
					}
				}
		});
	}
	
	function commentUpdate(cno, content){
		console.log(cno);
		var a ='';
		a += '<div class="input-group">';
		a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
		a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
		a += '</div>';
		$('.commentContent'+cno).html(a);
	}
	
	function commentUpdateProc(cno){
		var updateContent = $('[name=content_'+cno+']').val();
		$.ajax({
			url : '/comment/update',
			type : 'post',
			data : {'content' : updateContent, 'cno' : cno},
			success : function(data){
				if(data == 1) commentList(bno);
				}
			});
	}
	
	function commentDelete(cno){
		console.log(cno);
		$.ajax({
			url : '/comment/delete/' + cno,
			type : 'post',
			success : function(data){
				if(data == 1){
					commentList(bno);
				}else{
					alert("직접 작성한 댓글만 삭제 가능합니다.");
				}
			}
		});
	}
	
	$(document).ready(function(){
		commentList();
	});
</script>
