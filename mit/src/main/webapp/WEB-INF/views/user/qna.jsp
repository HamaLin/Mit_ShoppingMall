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
	width: 300px;
	height: 500px;
	padding-left: 60px;
	margin-top: 150px;
}
button {
	cursor: pointer;
	border: 1px solid rgb(65, 65, 65);
	background-color: #e9e9e9;
	width: 80px;
    height: 35px;
}

</style>
</head>
<body>

<div class="qna">
	<h2>Q&A</h2>
	<h4>질문과 답변</h4>
	<p><button><a href="${cpath }/user/qnaWrite">글쓰기</a></button></p>
</div>

<%@ include file="../footer.jsp" %>