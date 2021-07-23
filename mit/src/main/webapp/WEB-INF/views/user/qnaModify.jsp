<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* qna css */
	.qna {
		width: 600px;
		height: auto;
		margin: 150px auto;
	}
	.qnawriter {
	    width: 200px;
	    height: 30px;
	    padding-left: 15px;
	}
	.qnatitle {
		width: 500px;
	    height: 30px;
	}
	textarea {
		width: 500px;
	    height: 300px;
	    resize: none;
	}
	.selectMenu {
		width: 221px;
	    height: 35px;
	}
	.qnabutton {
		cursor: pointer;
		border: 1px solid rgb(65, 65, 65);
		background-color: #191919;
		color: white;
		width: 100px;
	    height: 35px;
	}
	.qnabutton:hover {
		background-color: #3a3a3a;
		color: white;
	}
	.return {
		cursor: pointer;
		border: 1px solid rgb(65, 65, 65);
		background-color: white;
		color: black;
		width: 100px;
	    height: 35px;
		
	}
	.modifyButton {
		display:flex;
		justify-content: space-between;
		width: 500px;
	    text-align: right;
	}
</style>
</head>
<body>

<!-- 로그인 상태가 아니면 로그인페이지로 보내기 -->
<c:if test="${empty login }">
	<script>
		location.replace("${cpath}/user/login")
	</script>
</c:if>


<div class="qna">
	<h3>글수정</h3>
	<form method="POST" name="qna_form" enctype="multipart/form-data">
		<p><input type="text" class="qnawriter" name="qnawriter" placeholder="글쓴이" value="${login.userid }"></p>
		<p>
			<select class="selectMenu" name="qnamenu">
				<option value="">문의 유형</option>
				<option value="사이즈">사이즈</option>
				<option value="배송">배송</option>
				<option value="재입고">재입고</option>
				<option value="기타">기타</option>
			</select>
		</p>
		<p><input type="hidden" name="qnaproductidx" value="${qna.qnaproductidx }" placeholder="qnaproductidx"></p>	
		<p><input type="hidden" name="idx" value="${qna.idx }"></p>	
		<p><input type="hidden" name="qnaimg" value="${qna.qnaimg }"></p>	
		<p><input type="text" class="qnatitle" value="${qna.qnatitle }" name="qnatitle" placeholder="제목"></p>
		<p><textarea name="qnacontent" placeholder="문의하실 내용을 입력해주세요.">${qna.qnacontent }</textarea></p>
		<p><input type="file" multiple="multiple" name="files" accept="image/*" ></p>
		<div class="modifyButton">
			<button class="return" type="button" onclick="redirect();">글목록</button>
			<button class="qnabutton" type="button" onclick="qnaModify();">수정하기</button>
		</div>
	</form>
</div>

<script>

//질문 등록
function qnaModify(event) {
	const qnawriter = document.querySelector('input[name="qnawriter"]')
	const qnamenu = document.querySelector('select[name="qnamenu"]')
	const qnatitle = document.querySelector('input[name="qnatitle"]')
	const qnacontent = document.querySelector('textarea[name="qnacontent"]')
	
	
	// 필수 사항
	if(qnawriter.value == "") {
		location.replace("${cpath}/user/login")
		return false;
	}
	if(qnamenu.value == "") {
		alert("문의 유형을 선택해주세요.");
		qnamenu.focus();
		return false;
	}
	if(qnatitle.value == "") {
		alert("제목을 입력해주세요.");
		qnatitle.focus();
		return false;
	}
	if(qnacontent.value == "") {
		alert("내용을 입력해주세요.");
		qnacontent.focus();
		return false;
	}
	
	const qna_form = document.querySelector('form[name="qna_form"]')
	const formData = new FormData(qna_form)
	
	const url = '${cpath}/user/qnaModify'
	const opt = {
			method: 'POST',
			body: formData,
	}
	fetch(url, opt).then(resp => resp.text())
	.then(text => {
		if(text == 1) {
			alert('질문이 정상적으로 수정되었습니다.')
			location.href = '${cpath}/user/qna/'+ ${qna.idx}
		}
		else{
			alert('다시 시도해주세요')
		}
	})
}
</script>

<!-- 글목록 버튼 -->
<script>
	const redirect = function() {
		location.href = '${cpath}/user/mypage'
	}
</script>

<%@ include file="../footer.jsp" %>