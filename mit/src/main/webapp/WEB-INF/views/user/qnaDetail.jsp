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
		width: 800px;
		height: auto;
		margin: 150px auto;
		align-content: center;
	}
	.qnaOne > h2 {
		text-align: center;
	}
	.qnaButtons {
		display: flex;
		justify-content: flex-end;
	}
	.qnaButtons > button {
		width: 80px;
		height: 35px;
	    background-color: inherit;
	    border: 1px solid gray;
	    border-radius: 10px;
	    font-size: 12px;
	    margin: 0 5px 5px 0;
	}
	.return {
		width: 80px;
		height: 35px;
	    background-color: #eaeaea;
	    border: 1px solid black;
	    border-radius: 10px;
	    font-size: 12px;
	    margin-top: 5px;
	}
	.qnaButtons > button:last-child {
		margin-right: 0;
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
	.qnaReply {
		padding: 10px 20px;
		font-size: 11pt;
		width: inherit;
		min-height: 80px;
		height: auto;
		box-sizing: border-box;
	}
	.Reply {
		width: inherit;	
	}
	table {
		width: 100%;
		height: auto;
		text-align: left;
		border-collapse: collapse;
	}
	td {
 		border-bottom: 1px solid #d5d5d5; 
 		padding: 5px;
 	}
 	table tr {
 		width: inherit;
 	}
	table tr td:first-child {
		width: 120px;
	}
	table tr td:nth-child(2) {
		width: 500px;
	}
	table tr td:last-child {
		text-align: right;
	}
	.replyInsert {
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 10px;
	}
	textarea {
		width: 700px;
		resize: none;
	}
	.replyButton{
		width: 80px;
		height: 45px;
	}
</style>
</head>
<body>

<!-- 로그인 상태가 아니면 로그인페이지로 보내기 -->
<c:if test="${empty login && empty admin }">
	<script>
		location.replace("${cpath}/user/login")
	</script>
</c:if>

<div class="qnaOne">
	<h2>Q&A</h2>
	<div class="qnaButtons">
		<button id="qnaModify">글수정</button>
		<button id="qnaDelete">글삭제</button>
	</div>
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
	<div class="Reply">
		<div class="qnaReply">
		</div>
		<c:if test="${not empty admin}">	
			<div class="reply_form">
				<form method="POST" name="reply_form">
					<p><input type="hidden" name="qnaidx" value="${qna.idx }"></p>	
					<p><input type="hidden" name="replywriter" placeholder="글쓴이" value="${admin.username }" readonly></p>	
				<div class="replyInsert">
					<textarea name="replycontent" placeholder="댓글을 입력해주세요."></textarea>
					<div class="reply_button">
						<button class="replyButton" type="button" onclick="qnaInsert();">댓글 달기</button>
					</div>
				</div>
				</form>
			</div>
        </c:if>
	</div>
	<button class="return" type="button" onclick="redirect();">글목록</button>
</div>

<script>
	// 댓글 목록 가져오기
	
	const qnaReply = document.querySelector('.qnaReply')
	
	function getReply() {
		qnaReply.innerHTML = ''
		const url = '${cpath}/user/getReply/'+ ${qna.idx}
		const opt = {
				method: 'GET'
		}
		fetch(url, opt).then(resp => resp.json())
		.then(arr => {
			if(arr.length < 1) {
				qnaReply.innerText = '등록된 댓글이 없습니다.'
			}
			var table = document.createElement('table')
			for(let i = 0 ; i < arr.length ; i++){
				var dto = arr[i]
				var tr = createtr(dto, i)
				table.appendChild(tr)
			}
			qnaReply.appendChild(table)
		})
	}
	
	function createtr(dto, idx) {
		var tr = document.createElement('tr')
		var tddate = document.createElement('td')
		var tdcontent = document.createElement('td')
		var tdwriter = document.createElement('td')
		
		tdwriter.innerText = dto.replywriter
		tr.appendChild(tdwriter)
			
		tdcontent.innerText = dto.replycontent
		tr.appendChild(tdcontent)
	
		tddate.innerText = dto.replydate
		tr.appendChild(tddate)
			
		return tr
	}
	
	window.onload = getReply()
</script>

<script>
// 댓글 작성(관리자만 가능)
	function qnaInsert() {
		const reply_form = document.querySelector('form[name="reply_form"]')
		const formData = new FormData(reply_form)
		
		const url = '${cpath}/user/qnaReply'
		const opt = {
				method: 'POST',
				body: formData,
		}
		fetch(url, opt).then(resp => resp.text())
		.then(text => {
			if(text == 1) {
				getReply()
			}
			else{
				alert('다시 시도해주세요')
			}
		})
	}
</script>

<script>
// 글수정, 글삭제 버튼
	const qnaModify = document.getElementById('qnaModify')
	const qnaDelete = document.getElementById('qnaDelete')
	
	qnaModify.onclick = function() {
		location.href = '${cpath}/user/qnaModify/' + ${qna.idx}
	}
	
	qnaDelete.onclick = function() {
		if(confirm('문의글을 삭제하시겠습니까?')){
		const url = '${cpath}/user/qnaDelete/'+ ${qna.idx}
		const opt = {
				method: 'DELETE'
		}
		fetch(url, opt).then(resp => resp.text())
		.then(text => {
			if(text == 1) {
				location.href = '${cpath}/user/mypage'
			}
			else{
				alert('다시 시도해주세요.')
			}
		})
	}
}
</script>

<!-- 글목록 버튼 -->
<script>
	const redirect = function() {
		location.href = '${cpath}/user/mypage'
	}
</script>


<%@ include file="../footer.jsp" %>