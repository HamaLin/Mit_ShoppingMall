<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.qna {
	width: 508px;
	height: 800px;
	padding-left: 60px;
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
	background-color: white;
	width: 80px;
    height: 35px;
    right: 0;
}
.qnap {
	text-align: right;
}
.return {
	cursor: pointer;
	border: 1px solid rgb(65, 65, 65);
	background-color: #e9e9e9;
	width: 80px;
    height: 35px;
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
	<h2>Q&A</h2>
	<h4>질문하기</h4>
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
	<p><input type="hidden" name="qnaproductidx" placeholder="qnaproductidx"></p>	
		<p><input type="text" class="qnatitle" name="qnatitle" placeholder="제목"></p>
		<p><textarea name="qnacontent" placeholder="문의하실 내용을 입력해주세요."></textarea></p>
		<p><input type="file" multiple="multiple" name="files" accept="image/*" ></p>
	<p class="qnap"><button class="qnabutton" type="button" onclick="qnaform_check();">질문 등록</button></p>
	<p class="qnap"><button class="return" type="button" onclick="redirect();">돌아가기</button></p>
	</form>
</div>

<c:if test="${row == 1 }">
	<script>
		alert("문의가 등록되었습니다.")
		location.href = '${cpath}/user/qna'
	</script>
</c:if>

<c:if test="${row == 0 }">
	<script>
		alert("다시 시도해주세요.")
	</script>
</c:if>

<script>

const link = document.location.search
const params = new URLSearchParams(link)
const idx = params.get('idx')
const qnaproductidx = document.querySelector('input[name="qnaproductidx"]')
	
qnaproductidx.value = idx
	
//질문 등록
function qnaform_check(event) {
	console.log(qnaproductidx.value)
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
	
	document.qna_form.submit();
}
</script>

<!-- 돌아가기 버튼 -->
<script>
	const redirect = function() {
		location.replace("${cpath}/user/qna")
	}
</script>

<%@ include file="../footer.jsp" %>