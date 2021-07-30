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
	#qnaDelete {
		background-color: #eaeaea;
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
		padding-top: 0;
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
		width: 300px;
	}
	table tr td:nth-child(3), table tr td:nth-child(4) {
		width: 25px;
		text-align: right;
	}
	table tr td:last-child {
		width: 60px;
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
	.linkTd {
		cursor: pointer;
	}
	.linkTd:hover {
		color: grey;
	}
	.pdWrap {
		display: flex;
	}
	.pdimg img {
		width: 80px;
		height: 80px;
		border-radius: 10px;
		margin-right: 20px;	
	}
	.pdinfo p:first-child {
		font-size: 16px;
		font-weight: 500;
		margin: 0;
		margin-top: 3px;
	}
	.pdinfo p:nth-child(2) {
		margin-bottom: 10px;
	}
	.pdinfo p {
		margin: 0;
		margin-bottom: 5px;
		font-size: 13px;
	}
	.qnaProduct {
		display: flex;
		justify-content:space-between;
		height: 100px;
		width: 100%;
		border-bottom: 1px solid #eaeaea;
		margin-top: 20px;
		margin-bottom: 20px;
		
	}
	.moreinfoBtn {
		width: 60px;
		height: 30px;
		border: 1px solid #eaeaea;
		border-radius: 10px;
		background: inherit;
		font-size: 11px;
		text-align: center;
		line-height: 30px;
		cursor: pointer;
	}
	.moreinfoBtn:hover {
		background: #2f2f2f;
		color: white;
	}
	.hidden {
		display: none;
	}
</style>
</head>
<body>

<!-- 로그인 상태가 아니면 로그인페이지로 보내기 -->
<c:if test="${empty login && empty admin }">
	<script>
		alert('접근 권한이 없습니다.')
		location.replace("${cpath}/user/login")
	</script>
</c:if>

<c:if test="${not empty login }">
	<c:if test="${login.userid != qna.qnawriter }">
	<script>
		alert('글쓴이만 읽을 수 있습니다.')
		history.back()
	</script>
	</c:if>
</c:if>


<div class="qnaOne">
	<h2>Q&A</h2>
	
	<c:if test="${not empty login }">
		<div class="qnaButtons">
			<button id="qnaModify">글수정</button>
			<button id="qnaDelete">글삭제</button>
		</div>
	</c:if>	
	
	<div class="qnaWrap">
		<div>
			<div>
				<div>제목</div>		
				<c:if test="${qna.qnareplycnt > 0 }">
					<div>[답변 완료] ${qna.qnatitle } (${qna.qnareplycnt })</div>
				</c:if>
				<c:if test="${qna.qnareplycnt < 1 }">
					<div>[답변 대기] ${qna.qnatitle }</div>
				</c:if>
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
			<div class="qnaProduct">
				<div class="pdWrap">
					<div class="pdimg"></div>
					<div class="pdinfo"></div>
				</div>
				<div class="moreinfoBtn">더보기</div>
			</div>
			<div class="qnaImgs">
				<c:forEach var="img" items="${imgs }">
					<div><img src="${img}"/></div>
				</c:forEach>	
			</div>
			<div class="qnaText">
				<div>${qna.qnacontent}</div>
			</div>
		</div>
	</div>
	<div class="Reply">
		<div class="qnaReply">
		</div>
		<c:if test="${not empty admin}">
			<!-- 댓글 수정폼 -->	
			<div class="reply_modify hidden">
				<form method="POST" name="reply_modify">
					<p><input type="hidden" name="idx"></p>	
				<div class="replyInsert">
					<textarea name="replycontent"></textarea>
					<div class="reply_button">
						<button class="replyButton" type="button" onclick="replyModify();">수정하기</button>
					</div>
				</div>
				</form>
			</div>
			
			<!-- 댓글 입력폼 -->	
			<div class="reply_form">
				<form method="POST" name="reply_form">
					<p><input type="hidden" name="qnaidx" value="${qna.idx }"></p>	
					<p><input type="hidden" name="replywriter" placeholder="글쓴이" value="${admin.username }" readonly></p>	
				<div class="replyInsert">
					<textarea name="replycontent" placeholder="댓글을 입력해주세요."></textarea>
					<div class="reply_button">
						<button class="replyButton" type="button" onclick="reply_Insert();">댓글 달기</button>
					</div>
				</div>
				</form>
			</div>
        </c:if>
	</div>
	<button class="return" type="button" onclick="redirect();">글목록</button>
</div>

<script>
	// 상품 링크 만들기
	const qnaProduct = document.querySelector('.qnaProduct')
	const pdimg = document.querySelector('.pdimg')
	const pdinfo = document.querySelector('.pdinfo')
	const moreinfoBtn = document.querySelector('.moreinfoBtn')
	
	function getProduct() {
		const url = '${cpath}/user/getProduct/' + ${qna.qnaproductidx}
		const opt = {
				method: 'GET'
		}
		fetch(url, opt).then(resp => resp.json())
		.then(json => {
			
			if(json.nullcheck == 0) {
				alert('판매 중지된 상품입니다.')
				qnaProduct.classList.add('hidden')
			}
			
			else {
				const product = json.product
				const pdtitle = product.pdtitle;
				const pdcolor = product.pdcolor;
				const pdprice = product.pdprice;
				const pdMainImg = product.mainimg;
				const mainImg = document.createElement('img')
			
				if(pdMainImg == null) {
					mainImg.style.backgroundColor = 'grey'
				}else {
					mainImg.src = product.mainimg
				}
				pdimg.appendChild(mainImg)
				
				const p1 = document.createElement('p')
				p1.innerText = pdtitle
				pdinfo.appendChild(p1)
				
				const p2 = document.createElement('p')
				p2.innerText = pdcolor
				pdinfo.appendChild(p2)
				
				const p3 = document.createElement('p')
				p3.innerText = pdprice + '원'
				pdinfo.appendChild(p3)
				
				moreinfoBtn.onclick = function() {
					location.href = '${cpath}/store/storeDetale/?id='+ product.idx;
				}
			}
		})
	}
	window.onload = getProduct()
</script>

<script>
	// 댓글 목록 가져오기
	const adminId = '${admin.userid}'
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
	
		if(adminId !== '') {
			var tdmodify = document.createElement('td')
			var tddelete = document.createElement('td')
			
			tdmodify.innerText = '수정'
			tdmodify.classList.add('linkTd')
			tr.appendChild(tdmodify)
			
			// 댓글 수정 버튼
			tdmodify.onclick = function(event) {
				
				// 댓글 입력폼 가리기
				const reply_form = document.querySelector('.reply_form')
				if(reply_form.classList.contains("hidden")) {
					reply_form.classList.remove('hidden')
				}else {
					reply_form.classList.add('hidden')
				}
				
				// 수정폼 보여주기	
				const reply_modify = document.querySelector('.reply_modify')
				if(reply_modify.classList.contains("hidden")) {
					reply_modify.classList.remove('hidden')
					// 수정폼에 기존 댓글 넣어주기
					document.querySelector('input[name="idx"]').value = dto.idx
					document.querySelector('textarea[name="replycontent"]').value = dto.replycontent
				}else {
					reply_modify.classList.add('hidden')
				}	
			}
			
			tddelete.innerText = '삭제'
			tddelete.classList.add('linkTd')
			tr.appendChild(tddelete)
			
			// 댓글 삭제 버튼
			tddelete.onclick = function(e) {
			const url = '${cpath}/user/replyDelete/' +dto.idx + '/' + ${qna.idx}
				const opt = {
					method: 'GET'
				}
				fetch(url, opt).then(resp => resp.text())
				.then(text => {
					if(text == 1) {
						getReply()
					}
					else{
						alert('다시 시도해주세요.')
					}
				})
			}
		}
		
		tddate.innerText = dto.replydate
		tr.appendChild(tddate)

		return tr
	}
	
	window.onload = getReply()
</script>

<script>
// 댓글 작성
	function reply_Insert() {
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
				reply_form.reset(); 
				getReply()
			}
			else{
				alert('다시 시도해주세요.')
			}
		})
	}
</script>

<script>
// 댓글 수정
	function replyModify() {
		const reply_modify = document.querySelector('.reply_modify')
		const reply_form = document.querySelector('.reply_form')
		
		const reply_modifyForm = document.querySelector('form[name="reply_modify"]')
		const formData = new FormData(reply_modifyForm)

		const url = '${cpath}/user/replyModify'
		const opt = {
				method: 'POST',
				body: formData,
		}
		fetch(url, opt).then(resp => resp.text())
		.then(text => {
			if(text == 1) {
				alert('수정되었습니다.')
				// 다시 댓글 입력창으로 변경
				reply_modify.classList.add('hidden')
				reply_form.classList.remove('hidden')
				reply_modifyForm.reset(); 
				getReply()
			}
			else{
				alert('다시 시도해주세요.')
			}
		})
	}
</script>


<c:if test="${not empty login}">
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
</c:if>

<c:if test="${not empty login }">
	<!-- 글목록 버튼 -->
	<script>
		const redirect = function() {
			location.href = '${cpath}/user/mypage'
		}
	</script>
</c:if>

<c:if test="${empty login }">
	<!-- 글목록 버튼 -->
	<script>
		const redirect = function() {
			location.href = '${cpath}/user/qna'
		}
	</script>
</c:if>


<%@ include file="../footer.jsp" %>