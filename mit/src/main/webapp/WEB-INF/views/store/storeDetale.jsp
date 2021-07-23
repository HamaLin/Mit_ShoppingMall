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
		height: auto;
		border: 1px solid black;
	}
	.title {
      text-align: left;
      cursor: pointer;
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
	
	/* qna css */
	.qna {
	width: 100%;
	height: auto;
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
		background-color: black;
		color: white;
		width: 100px;
	    height: 35px;
	    right: 0;
	}
	
	#showmethechart{
            border: 1px solid black;
        }
        #drawingchartdiv{
            display: flex;
            position: relative;
            border: 1px solid black;
            height: 200px;
        }
        #showpercent{
            width: 742px;
            position: absolute;
            border: 1px solid red;
        }
        #showgraph{
            margin-left: 100px;
            margin-top: 0;
            position: absolute;
            border: 1px solid blue;
            justify-content: bottom;
        }
        ul > li {
            height: 200px;
            width: 100px;
            position: relative;
            align-items: flex-end;
    		display: flex;
        }
        ul > li > span{
            position: absolute;
            width: 100px;
            margin-bottom: 40px;
        }
        ol > li {
            border-bottom: 1px solid gray;
        }
</style>

<div class="store">
<div id="showitem">
	<div class="head">
		<div class="leftheader">
			<div id="mainImg"></div>
			<div id="viewimglist"></div>
		</div>
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
		</tr>
	</thead>
	<tbody></tbody>
</table>
<button id="qnaBtn">질문하기</button>
	<div class="qna hidden">
	<h3>질문하기</h3>
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
	<p><input type="hidden" name="qnaproductidx" value="${param.id }"placeholder="qnaproductidx"></p>	
		<p><input type="text" class="qnatitle" name="qnatitle" placeholder="제목"></p>
		<p><textarea name="qnacontent" placeholder="문의하실 내용을 입력해주세요."></textarea></p>
		<p><input type="file" multiple="multiple" name="files" accept="image/*" ></p>
	<p class="qnap"><button class="qnabutton" type="button" onclick="qnaform_check();">질문 등록</button></p>
	</form>
	</div>
</div>
<hr>
	
	<div id="showmethechart">
		<div class="wrapall">
			<p>연령</p>
			<div id="drawingchartdiv">
				<div id="showpercent">
					<ol style="list-style: none;">
						<li><span>100%</span></li>
						<li><span>80%</span></li>
						<li><span>60%</span></li>
						<li><span>40%</span></li>
						<li><span>20%</span></li>
						<li style="border-bottom: 1px solid black;"><span>0%</span></li>
					</ol>
				</div>

				<ul id="showgraph"style="display: flex; list-style: none;">
					<li>
                        <p>18</p>
                        <span></span>
                    </li>
					<li>
                        <p>28</p>
                        <span></span>
                    </li>
					<li>
                        <p>38</p>
                        <span></span>
                    </li>
					<li>
                        <p>48</p>
                        <span></span>
                    </li>
					<li>
                        <p>58</p>
                        <span></span>
                    </li>
					<li>
                        <p>68</p>
                        <span></span>
                    </li>
				</ul>


			</div>
		</div>
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
	<input type="hidden" name="title">
	<input type="hidden" name="userage">
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
const viewimglist = document.getElementById('viewimglist')
const showgraph = document.getElementById('showgraph')
const qna = document.getElementById('qna')
const showmethechart = document.getElementById('showmethechart')
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
			}
			else{	
				img.src = '${cpath}/image/Default.jpg'
				SubmitUserInfo.mainimg.value = '${cpath}/image/Default.jpg'
			}
			mainImg.appendChild(img)
			
			if(json.viewimglist != null){
				for(let i = 0 ; i < json.viewimglist.length; i++){
					var img = document.createElement('img')
					img.src = '${cpath}/image/'+ json.pdcode + json.pdwriter + '/'+ json.viewimglist[i]
					img.style.width = '100px'
					img.id = Math.random()
					img.setAttribute('onclick', 'changemainimg(this)')
					viewimglist.appendChild(img)
				}
			}
			
			
			var msg = json.pdcontent
			var idx = 0
			while(msg.length > 0){
				console.log(json.filename[idx])
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
			
			if(${not empty login}){
				SubmitUserInfo.pdidx.value = json.idx
				SubmitUserInfo.price.value = json.pdprice
				SubmitUserInfo.mainimg.value = json.pdcode + json.pdwriter + '/'+ json.mainimg
				SubmitUserInfo.title.value = json.pdtitle
				var age = ${login.userbirth}
				SubmitUserInfo.userage.value = parseInt(2021 - age/10000)
				console.log(SubmitUserInfo.userage.value)
			}
		})
	}
	
// 	function drawingulgraph() {
// 		var url = '${cpath}/store/buytablelist/'+idx
// 		var opt = {
// 				method: 'GET'
// 		}
// 		fetch(url, opt).then(resp => resp.json())
// 		.then(arr => {
// 			var 
// 			for(let i = 0 ; i < arr.length ; i++){
// 				var dto = arr[i]
// 			}
// 		})
// 		showgraph
// 	}
	
	function changemainimg(e) {
		for(let i = 0; i < viewimglist.childElementCount; i++){
			if(viewimglist.children[i].id == e.id){
				var img = document.createElement('img')
                img.src = e.src
				mainImg.children[0].remove()
                mainImg.appendChild(img)
			}
		}
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
		var tdmenu = document.createElement('td')
		var tdtitle = document.createElement('td')
		var tdwriter = document.createElement('td')
		var tddate = document.createElement('td')
		
		tdIdx.innerText = dto.idx
		tr.appendChild(tdIdx)
		
		tdmenu.innerText = dto.qnamenu
		tr.appendChild(tdmenu)
		
		tdtitle.innerText = '[' +dto.qnaresult + ']' +dto.qnatitle
		tdtitle.classList.add('title')
		tr.appendChild(tdtitle)
		
		tdwriter.innerText = dto.qnawriter
		tr.appendChild(tdwriter)
		tdtitle.onclick = function(e) {
         location.href = '${cpath}/user/qna/'+dto.idx
      	}
		
		tddate.innerText = dto.qnadate
		tr.appendChild(tddate)
		
		
		
		return tr
	}
	
	function drawingchart() {
	}
	
	window.onload = getShowitem()
	window.onload = getqnalist()
	window.onload = drawingchart()
	
	qnaBtn.onclick = function() {
		const qna = document.querySelector('.qna')
		if(qna.classList.contains("hidden")) {
			qna.classList.remove('hidden')
			return;
		}else {
			qna.classList.add('hidden')
			return;
		}
	}
	
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


<!--  qna 글쓰기 스크립트  -->
<script>

//질문 등록
function qnaform_check(event) {
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
	
	const url = '${cpath}/user/qnaWrite/'
	const opt = {
			method: 'POST',
			body: formData,
	}
	fetch(url, opt).then(resp => resp.text())
	.then(text => {
		if(text == 1) {
			const qna = document.querySelector('.qna')
	         qna.classList.add('hidden')
	         qnalist.innerHTML = ''
	         getqnalist()
	         qna.scrollIntoView()
		}
		else{
			alert('다시 시도해주세요')
		}
	})
}
</script>

<%@ include file="../footer.jsp" %>