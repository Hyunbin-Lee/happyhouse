<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	var bno = '${board.no}';
	$('[name=commentInsertBtn]').click(function() {
		var insertData = $('[name=commentInsertForm]').serialize();
		commentInsert(insertData);
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
							a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
							a += '<div class="commentInfo'+value.cno+'">'
									+ '댓글번호 : '
									+ value.cno
									+ ' / 작성자 : '
									+ value.writer;
							a += '<a onclick="commentUpdate('
									+ value.cno + ',\''
									+ value.content
									+ '\');"> 수정 </a>';
							a += '<a onclick="commentDelete('
									+ value.cno
									+ ');"> 삭제 </a> </div>';
							a += '<div class="commentContent'+value.cno+'"> <p> 내용 : '
									+ value.content + '</p>';
							a += '</div></div>';
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
		$.ajax({
			url : '/comment/delete/'+cno,
			type : 'post',
			success : function(data){
				if(data == 1) commentList(bno);
				}
		});
	}
	
	$(document).ready(function(){
		commentList();
	});
</script>
