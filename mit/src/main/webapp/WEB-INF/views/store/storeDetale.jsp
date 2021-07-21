<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	.store {
		padding: 100px 50px;
		height: auto;
	}
	.head{
		width: 100%;
		display: flex;
	}
	.wrapcontent {
		display: flex;
		justify-content: center;
		
		
	}
	#showitem {
		margin: 100px;
	}
	#title{
		font-size: 25px;
		font-weight: bold;
	}
	#price {
		font-size: 40px;
		color: gray;
	}
	.subcontent{
		width: 100%;
		padding: 80px;
		height: 100%;
	}
	#mainContent{
		width: 80%;
		text-align: center;
	}
	#mainImg {
		align-items: center;
		justify-content: center;
	}
	img {
		width: 800px;
	}
	.selectoption{
		display: flex;
		width: 100%;
		height: 100px; 
	}
	.selectoption > button{
		line-height: 200%;
		width: 150px;
		height: 50px;
		font-size: 20px;
		background-color: white;
		margin-right: 120px;
	}
	.selectmenu {
		display: flex;
		width: 100%;
		height: 80px;
		justify-content: center;
	}
	.selectmenu > ul {
		list-style: none;
		display: flex;
		font-size: 25px;
		width: 100%;
		justify-content: center;
	}
	.selectmenu > ul > li{
		width: 15%;
		text-align: center;
		cursor: pointer;
	}
 	#reply{ 
 		display: inline-block; 
 		width: 100%; 
 		border: 1px solid black; 
 	} 
	#qna {
		display: inline-block;
		width: 100%;
		height: 300px;
		border: 1px solid black;
	}
	#qna > table {
		width: 100%;
		border: 1px solid black;
		text-align: center;
	}
	td {
		border: 1px solid black;
	}
	#showmetheitem{
		display: inline-block;
		width: 100%;
		height: 500px;
		border: 1px solid black;
	}
	.wrapstuf{
		width: 100%;
/* 		text-align: center; */
/* 		border: 1px solid black; */
 		margin: auto; 
	}
	.hidden{
		display: none;
	}
</style>

<div class="store">
<div id="showitem">
	<div class="head">
		<div id="mainImg"></div>
		<div class="subcontent">
			<div id="jsoncontent"></div>
			<br><br><br>
			<div>
				<p>사이즈</p>
				<select id="selectSize">
					<option>선택하세요</option>
					<option>S</option>
					<option>M</option>
					<option>L</option>
					<option>XL</option>
				</select>
                <br>
                <input type="number" id="count" placeholder="수량">
			</div>
			<div class="selectoption">
				<button id="gotoBuyItem">구매하기</button>
				<button id="gotoWishList">장바구니</button>
			</div>
			<hr>
		</div>
	</div>
	<br><br><br><br><br><br>
	
			<div class="selectmenu">
				<ul>
					<li id="explain">상품 설명</li>
					<li id="review">후기</li>
					<li id="question">질문</li>
					<li id="releaseItem">관련 상품</li>
				</ul>
			</div>
	<hr>
	<br><br><br>
	
	<div class="wrapcontent">
		<div id="mainContent"></div>
	</div>
	
	<hr>
	<div class="wrapstuf">
	
	<div id="reply">
	
<div id="review">
	<hr>
	<div>후기</div>
	<div>
		<form class="writing hidden" method="post">
		<div class="comment">
			<div>
				<div>이메일</div>
				<input type="text" name="email">
			</div>
			<div>
				<div>글쓴이</div>
				<input type="text" name="writer">
			</div>
			
		</div>
		<div class="comment">
			<div>
				<div>비밀번호</div>
				<input type="password" name="password1">
			</div>
			<div>
				<div>비밀번호 확인</div>
				<input type="password" name="password2">
			</div>
		</div>
		<textarea rows="5" cols="80" name="wr" style="resize: none;">
		
		</textarea>
		<div>
		<select name="scope">
			<option selected>별점주기</option>
			<option value="5">★★★★★</option>
			<option value="4">★★★★☆</option>
			<option value="3">★★★☆☆</option>
			<option value="2">★★☆☆☆</option>
			<option value="1">★☆☆☆☆</option>
		</select>
		<input type="submit" value="저장하기">
		</div>
		</form>

	</div>
	<hr>
	<div id="reviewlist">
	<c:forEach var="list" items="${ list}">
		<p>${list.scope}/5   ${list.writer }</p>
		<p>${list.wr }</p>
		<hr>
	</c:forEach>
	</div>
</div>
<button id="writingBtn">후기 쓰기</button>

	</div>
	<hr>
	
	<div id="qna">
	<table id="qnalist">
		<thead>
			<tr>
				<td>글번호</td>
				<td>제목</td>
				<td>글쓴이</td>
				<td>등록일</td>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	<button id="qnaBtn">QNA 작성</button>
	</div>
	<hr>
	
	<div id="showmetheitem">
	관련 상품 보여주는 곳
	</div>
	
	</div>
	
	<hr>
</div>




</div>

<c:if test="${not empty admin }">
<button id="deleteBtn">삭제</button>
<button id="modifyBtn">수정</button>
</c:if>

<c:if test="${not empty login }">
<form id="SubmitUserInfo">
	<input type="hidden" name="userid" value="${login.userid }">
	<input type="hidden" name="usergender" value="${login.usergender }">
	<input type="hidden" name="pdidx">
	<input type="hidden" name="count">
	<input type="hidden" name="price">
	<input type="hidden" name="mainimg">
	<input type="hidden" name="usersize">
</form>

</c:if>




<script>
const modifyBtn = document.getElementById('modifyBtn')
const deleteBtn = document.getElementById('deleteBtn')
const jsoncontent = document.getElementById('jsoncontent')
const mainContent = document.getElementById('mainContent')
const explain = document.getElementById('explain')
const review = document.getElementById('review')
const question = document.getElementById('question')
const reply = document.getElementById('reply')
const gotoWishList = document.getElementById('gotoWishList')
const SubmitUserInfo = document.getElementById('SubmitUserInfo')
const gotoBuyItem = document.getElementById('gotoBuyItem')
const qnalist = document.getElementById('qnalist')
const qnaBtn = document.getElementById('qnaBtn')
const selectSize = document.getElementById('selectSize')
const qna = document.getElementById('qna')
const showmetheitem = document.getElementById('showmetheitem')
const link = document.location.search
const params = new URLSearchParams(link)
const idx = params.get('id')

    explain.onclick = function() {
        mainContent.scrollIntoView()
    }

    review.onclick = function() {
        reply.scrollIntoView()
    }

    question.onclick = function() {
        qna.scrollIntoView()
    }

    releaseItem.onclick = function() {
        showmetheitem.scrollIntoView()
    }
	
	function getShowitem() {
		const url = '${cpath}/store/showitem/'+idx
		const opt = {
				method: 'GET'
		}
		fetch(url, opt).then(resp => resp.json())
		.then(json => {
			jsoncontent.innerHTML = '<p id="title">' + json.pdtitle + '</p>' + '<br>'
			jsoncontent.innerHTML += '<p id="price">' + json.pdprice + '원' +'</p>'+ '<br>'
			jsoncontent.innerHTML += '<p>' + '적립금' + '0%' +'</p>'
			jsoncontent.innerHTML += '<p>' + '배송비' + json.pdprice + '원' +'</p>'
			
			selectSize.options[1].text = 's : ' + json.pdscount
            selectSize.options[2].text = 'm : ' + json.pdmcount
            selectSize.options[3].text = 'l : ' + json.pdlcount
            selectSize.options[4].text = 'xl : ' + json.pdxlcount
            
            selectSize.children[1].value = json.pdscount
            selectSize.children[2].value = json.pdmcount
            selectSize.children[3].value = json.pdlcount
            selectSize.children[4].value = json.pdxlcount
			
			var img = document.createElement('img')
			if(json.mainimg != ''){
				img.src = '${cpath}/image/'+ json.pdcode + json.pdwriter + '/'+ json.mainimg
				SubmitUserInfo.mainimg.value = json.pdcode + json.pdwriter + '/'+ json.mainimg
			}
			else{	
				img.src = '${cpath}/image/Default.jpg'
					SubmitUserInfo.mainimg.value = '${cpath}/image/Default.jpg'
			}
			mainImg.appendChild(img)
			
			var msg = json.pdcontent
			var idx = 0
			while(msg.length > 0){
				
				if(msg.indexOf('<img src="">') == 0) {
					var img = document.createElement('img')
					img.src = '${cpath}/image/'+ json.pdcode + json.pdwriter + '/' + json.filename[idx]
					mainContent.appendChild(img)
					msg = msg.substr(msg.indexOf('<img src="">')+12)
					idx += 1
                }
				else if(msg.indexOf('</p>') >= 0) {
					mainContent.innerHTML += msg.substr(0, msg.indexOf('</p>')+4)
                    msg = msg.substr(msg.indexOf('</p>')+4)
                }
			}
			SubmitUserInfo.pdidx.value = idx
			SubmitUserInfo.price.value = json.pdprice
		})
	}
	
	function getsize(idx) {
		var size = ''
			switch(idx) {
			case 1: size = 's'; break;
			case 2: size = 'm'; break;
			case 3: size = 'l'; break;
			case 4: size = 'xl'; break;
			}
		return size
	}
	
	function getqnalist() {
		
		const url = '${cpath}/store/getQna/'+idx
		const opt = {
				method: 'GET'
		}
		fetch(url, opt).then(resp => resp.json())
		.then(arr => {
				console.log(arr)
			for(let i = 0 ; i < arr.length ; i++){
				var dto = arr[i]
				var tr = createtr(dto, i)
				qnalist.appendChild(tr)
			}
		})
		
	}
	
	function createtr(dto, idx) {
		var tr = document.createElement('tr')
		var tdIdx = document.createElement('td')
		var tdtitle = document.createElement('td')
		var tdwriter = document.createElement('td')
		var tddate = document.createElement('td')
		
		tdIdx.innerText = idx + 1
		tdIdx.style.width = '5%';
		tr.appendChild(tdIdx)
		
		tdtitle.style.width = '70%';	
		tdtitle.innerText = dto.qnatitle
		tr.appendChild(tdtitle)
		
		tdwriter.style.width = '10%';
		tdwriter.innerText = dto.qnawriter
		tr.appendChild(tdwriter)
		
		tddate.style.width = '15%';
		tddate.innerText = dto.qnadate
		tr.appendChild(tddate)
		
		
		
		return tr
	}
	
	window.onload = getShowitem()
	window.onload = getqnalist()
	
	qnaBtn.onclick = function() {
		location.href='${cpath}/user/qnaWrite?idx=' + idx
	}
	
	if(${not empty login}){
	gotoWishList.onclick = function() {
		if(${empty login}){
			alert('로그인부터 해주세요')
			location.replace('${cpath}/user/login')
			return
		}
		if(selectSize.options.selectedIndex == 0 || document.getElementById('count').value == ''){
			alert('수량과 사이즈를 정해주세요')
			return
		}
		if(confirm('장바구니에 등록하시겠습니까?')){
			SubmitUserInfo.count.value = document.getElementById('count').value
			SubmitUserInfo.usersize.value = getsize(selectSize.options.selectedIndex)
			var formData = new FormData(SubmitUserInfo)
			
			var url = '${cpath}/store/insertwishlist'
			var opt = {
					method: 'POST',
					body: formData,
			}
			fetch(url, opt).then(resp => resp.text())
			.then(text => {
				if(text == 1){
					alert('장바구니에 추가 되었습니다!')
				}
				else{
					alert('실패 ㅜㅜ')
				}
			})
		}
	}
	gotoBuyItem.onclick = function() {
		if(${empty login}){
			alert('로그인부터 해주세요')
			location.replace('${cpath}/user/login')
			return
		}
		if(selectSize.options.selectedIndex == 0 || document.getElementById('count').value == ''){
			alert('수량과 사이즈를 정해주세요')
			return
		}
		SubmitUserInfo.count.value = document.getElementById('count').value
		SubmitUserInfo.usersize.value = getsize(selectSize.options.selectedIndex)
		var formData = new FormData(SubmitUserInfo)
		
		var url = '${cpath}/store/modifywishlist'
		var opt = {
					method: 'POST',
					body: formData,
			}
			fetch(url, opt)
			.then(resp => resp.text())
			.then(text => {
				if(text == 1){
					location.href = '${cpath}/store/purchase/?userid='+ '${login.userid }'
				}
				
			})
	}
	}
	
	if(${not empty admin}){
		deleteBtn.onclick = function() {
			event.preventDefault()
			if(confirm(idx + '게시글을 삭제하시겠습니까?')){
			const url = '${cpath}/store/deleteitem/'+idx
			const opt = {
					method: 'DELETE'
			}
			fetch(url, opt).then(resp => resp.text())
			.then(text => {
				if(text == 1) {
					alert('게시글 삭제 성공')
					
					location.replace("${cpath}/store/store")
				}
				else{
					alert('게시글 삭제 실패')
				}
			})
			}
		}
		
		
		modifyBtn.onclick = function() {
			event.preventDefault()
			console.log('a')
			location.href = '${cpath}/store/writeItem/?id=' + idx
		}
	}

</script>

<script>
	const writingBtn = document.getElementById('writingBtn')
	const writing = document.querySelector('.writing')
	writingBtn.onclick=function(){
		event.preventDefault()
		if(writing.classList.contains('hidden')){
			writing.classList.remove('hidden')
        }else{
        	writing.classList.add('hidden')
        }
		
	}
	const toedit=document.getElementById('toedit')
	
</script>






<%@ include file="../footer.jsp" %>