<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.qnaOne {
		width: 1000px;
		height: auto;
		margin: 150px auto;
		align-content: center;
	}
	.qnaOne > h2 {
		text-align: center;
	}
	.qnaWrap {
		border: 1px solid grey;
		margin: auto;
	}
	.qnaWrap > div:first-child > div {
	 	display: flex;
	 	border-bottom: 1px gray solid;
	}
	.qnaWrap > div:first-child > div div:first-child {
		width: 80px;
		border-right: 1px gray solid;
		background-color: #eaeaea;
		padding: 5px 10px;
	}
	.qnaWrap > div:first-child > div div:last-child {
		padding: 5px 10px;
	}
	.qnaContent {
		box-sizing: border-box;
		width: 100%;
		min-height: 300px;
		height: auto;
		padding: 20px;
	}
	.qnaImgs {
		width: inherit;
		text-align: center;
	}
	.qnaImgs > div {
		width: inherit;
	}
	.qnaImgs > div > img {
		width: 60%;
	}
	.qnaText {
		margin-top: 30px;
		text-align: center;
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

<div class="qnaOne">
	<h2>Q&A</h2>
	<div class="qnaWrap">
		<div>
			<div>
				<div>제목</div>
				<div>[${qna.qnaresult}] ${qna.qnatitle }</div>
			</div>	
			<div>
				<div>글쓴이</div>
				<div>${qna.qnawriter }</div>
			</div>
			<div>
				<div>작성일</div>
				<div>${qna.qnadate }</div>
			</div>
		</div>
		<div class="qnaContent">
			<div class="qnaImgs">
				<c:forEach var="img" items="${imgs }">
					<div><img src="${cpath}/image/${qna.qnawriter}/${img}"/></div>
				</c:forEach>	
			</div>
			<div class="qnaText">
				<div>${qna.qnacontent }</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../footer.jsp" %>