<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
* {
	box-sizing: border-box;
}

.store {
	padding: 100px 50px;
	height: auto;
}

.head {
	width: 100%;
	display: flex;
}

.wrapcontent {
	display: flex;
	justify-content: center;
}

.leftheader {
	width: 50%;
}

#showitem {
	margin: 25px;
}

#title {
	font-size: 30px;
	font-weight: bold;
}

#price {
	font-size: 40px;
	color: gray;
}

.subcontent {
	width: 50%;
	padding: 80px;
	height: 100%;
}

#mainContent {
	width: 80%;
    text-align: center;
    display: flex;
    flex-flow: column;
    align-items: center;
}

#mainImg {
	height: 100%;
}

img {
	width: 40%;
}

.selectoption {
	display: flex;
	width: 100%;
	height: 100px;
}

.selectoption>button {
	line-height: 200%;
	width: 40%;
	height: 60%;
	font-size: 20px;
	background-color: white;
	margin: auto;
	margin-left: 0;
}

#gotoBuyItem:hover {
	background-color: black;
	color: white;
}

#gotoWishList:hover {
	background-color: gray;
	color: white;
}

.selectmenu {
	display: flex;
	width: 100%;
	height: 80px;
	justify-content: center;
}

.selectmenu>ul {
	list-style: none;
	display: flex;
	font-size: 25px;
	width: 100%;
	justify-content: center;
}

.selectmenu>ul>li {
	width: 15%;
	text-align: center;
	cursor: pointer;
}

#reply {
	display: inline-block;
	width: 60%;
	margin-top: 150px;
}

#qna {
	display: inline-block;
	width: 60%;
	height: auto;
	margin-top: 150px;
}

.title {
	text-align: left;
	cursor: pointer;
}

#qna>table {
	width: 100%;
	text-align: center;
}

#showmetheitem {
	display: inline-block;
	width: 100%;
	height: 500px;
	border: 1px solid black;
}

.wrapstuf {
	width: 100%;
	margin: auto;
	display: flex;
	flex-flow: column;
	align-items: center;
}

.hidden {
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

#showmethechart {
	margin-top: 150px;
	margin-bottom: 300px;
	width: 60%;
}

#drawingchartdiv {
	display: flex;
	position: relative;
	height: 200px;
}

#showpercent {
	width: 819px;
    height: 300px;
    position: absolute;
}

#showgraph {
	margin-left: 90px;
    margin-top: 94px;
    position: absolute;
}

#showgraph>li {
	height: 210px;
	width: 120px;
	position: relative;
	align-items: flex-end;
	display: flex;
	color: silver;
}

#showgraph>li>span {
	position: absolute;
	width: 100px;
	margin-bottom: 40px;
}

ol>li {
	border-bottom: 1px solid gray;
	height: 41px;
	line-height: 250%;
}

.bar {
	background-color: silver;
}

#viewimglist {
	margin-top: 50px;
}

#viewimglist>img {
	margin: 25px;
}

.selectmenu {
	margin-top: 300px;
}

#selectSize {
	width: 180px;
	height: 60px;
	font-size: 25px;
}

#count {
	width: 180px;
	margin-top: 25px;
	height: 55px;
	font-size: 30px;
	text-align: center;
}

.selectoption {
	margin-top: 100px;
}

.selectoption>button {
	margin-top: 100px;
}

#replylist {
	margin-top: 20px;
}

.wrapReplyList {
	border-top: 1px solid black;
}

.wrapReplyList>div {
	margin-bottom: 20px;
	margin-top: 20px;
}

.wrapflexReplyList{
	border-top: 1px solid black;
}

.wrapflexReplyList > div > div {
	margin-bottom: 20px;
	margin-top: 20px;
}

#writingBtn {
	font-size: 15px;
	margin-top: 30px;
	float: right;
	width: 10%;
	height: 50px;
	background-color: white;
	font-weight: 700;
}
#qnaBtn {
    font-size: 15px;
    margin-top: 30px;
    float: right;
    width: 10%;
    height: 50px;
    background-color: white;
    font-weight: 700;
}
.replybuttondiv {
	display: flex;
    justify-content: flex-end;
    width: 100%;
}
.replybuttondiv > div {
	display: flex;
    float: right;
    width: 10%;
    justify-content: center;
    border: 1px solid;
    margin-left: 30px;
    margin-bottom: 15px;
    cursor: pointer; 
}

.replybuttondiv > div:hover {
	background-color: black;
	color: white;
}
.submitreplydiv {
	border: 1px solid black;
}
.modifydivwrap {
	display: flex;
    margin-bottom: 50px;
    margin-top: 15px;
    height: 40px;
}
.modifydivwrap > div {
	margin-right: 70px;
    width: 100px;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
}
.modifydivwrap > div:hover {
	background-color: black;
	color: white;
}
.modifydivwrap > select {
	cursor: pointer;
	margin-right: 50px;	
}
#modifyreplyform {
	margin-top: 50px;
}
.writing {
	margin-top: 50px;
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
				<p style="font-size: 20px; font-weight: bold;">사이즈</p>
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
			
		</div>
	</div>
		<div class="selectmenu">
			<ul>
				<li id="explain">상품 설명</li>
				<li id="review">후기</li>
				<li id="question">질문</li>
				<li id="releaseItem">구매 현황 </li>
			</ul>
		</div>
		<hr>
	<br><br><br>
	
	<div class="wrapcontent">
		<div id="mainContent"></div>
	</div>
	
	<div class="wrapstuf">
	
	<div id="reply">
	

<div id="review">	
	<div style="font-size: 20px; font-weight: bold;" id="reviewtitle">후기</div>
	<div id="replylist"></div>
	
		<div style="border-top: 1px solid black;">
		<form class="writing hidden">
		<div class="comment">
			<div>
				<input type="hidden" name="writer" value="${login.userid }">
				<input type="hidden" name="pdidx">
			</div>
			
		</div>
		<div class="comment">
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
		<input type="file" name="Writingfiles" multiple="multiple" accept="image/*">
		<input type="submit" value="저장하기">
		</div>
		</form>

	</div>
</div>
<div id="modifyanddelete"></div>
<button id="writingBtn">후기 쓰기</button>

	</div>
	
<div id="qna">
<div style="font-size: 25px; font-weight: bold;">질문</div>
<hr>
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
	
	<div id="showmethechart">
		<div class="wrapall">
			<p style="font-size: 25px; font-weight: bold;">구매 현황</p>
			<hr>
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
				</ul>


			</div>
		</div>
	</div>
	
	</div>
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
const reviewtitle = document.getElementById('reviewtitle')
const modifyanddelete = document.getElementById('modifyanddelete')
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
    	showmethechart.scrollIntoView()
    }
	
    // 상품 정보 보여주는 함수
	function getShowitem() {
		const url = '${cpath}/store/showitem/'+idx
		const opt = {
				method: 'GET'
		}
		fetch(url, opt).then(resp => resp.json())
		.then(json => {
			jsoncontent.innerHTML = '<div id="title">' + json.pdtitle + '</div>' + '<br>'
			jsoncontent.innerHTML += '<p id="price">' + 
			
			json.pdprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + 
			
			'원' +'</p>'+ '<br>'
			console.log(json.pdprice)
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
			
			if(json.mainimg != ''){
				mainImg.style.backgroundImage = 'url(${cpath}/image/'+ json.pdcode + json.pdwriter + '/'+ json.mainimg + ')'
				mainImg.style.backgroundRepeat = 'no-repeat'
				mainImg.style.backgroundSize = '100%'
				mainImg.style.backgroundPosition = 'center'
			}
			else{	
				mainImg.style.backgroundImage = '${cpath}/image/Default.jpg'
				mainImg.style.backgroundRepeat = 'no-repeat'
				mainImg.style.backgroundSize = '100%'
				mainImg.style.backgroundPosition = 'center'
			}
			
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
			}
		})
	}
	
	//차트 그리기
	function drawingulgraph() {
		var url = '${cpath}/store/buytablelist/'+idx
		var opt = {
				method: 'GET'
		}
		fetch(url, opt).then(resp => resp.json())
		.then(arr => {
			var totalcount = 0
			var array = new Array(0,0,0,0,0,0)

			for(let i = 0 ; i < arr.length ; i++){
				totalcount += arr[i].count
				
				if(arr[i].userage < 18){
					array[0] += arr[i].count
				}
				else if(arr[i].userage < 23 && arr[i].userage > 18){
					array[1] += arr[i].count
				}
				else if(arr[i].userage < 28 && arr[i].userage > 23){
					array[2] += arr[i].count
				}
				else if(arr[i].userage < 33 && arr[i].userage > 28){
					array[3] += arr[i].count
				}
				else if(arr[i].userage < 39 && arr[i].userage > 33){
					array[4] += arr[i].count
				}
				else{
					array[5] += arr[i].count
				}
			}
		    
			for(let i = 0 ; i < array.length ; i++){
				var li = drawingbar(array[i], totalcount, i)
				showgraph.appendChild(li)
			}
		})
	}
	
	// 차트 그리는 함수
	function drawingbar(age, total, fori) {
		var li = document.createElement('li')
		var p = document.createElement('li')
		
		switch (fori) {
		case 0 : p.innerText = '~ 18세'
			break;
		case 1 : p.innerText = '18 ~ 23세'
			break;
		case 2 : p.innerText = '23 ~ 28세'
			break;
		case 3 : p.innerText = '28 ~ 33세'
			break;
		case 4 : p.innerText = '33 ~ 39세'
			break;
		case 5 : p.innerText = '40세 ~'
			break;
		}
		li.appendChild(p)
		var span = document.createElement('span')
		span.className = 'bar'
		span.style.width = '30px'
		span.style.height = (age/total)*100 + '%'
		li.appendChild(span)
		return li
	}

	//후기 작성하는 함수
	function getreplylist() {
		const url = '${cpath}/store/getreply/'+idx
		const opt = {
				method: 'GET'
		}
		fetch(url, opt).then(resp => resp.json())
		.then(arr => {
			var totalscore = 0
			var totalreviews = 0
			for(let i = 0 ; i < arr.length ; i++){
				totalreviews = arr.length
				var dto = arr[i]
				var div = createreplydiv(dto, i)
				totalscore += dto.scope
				
				if('${login.userid}' == dto.writer){
					var motherdiv = document.createElement('div')
					var buttondiv = document.createElement('div')
					var divmodify = document.createElement('div')
					var divdelete = document.createElement('div')
					divmodify.innerText = '수정'
					divdelete.innerText = '삭제'
					
					buttondiv.className = 'replybuttondiv'
					motherdiv.className = 'replymotherdiv'
					motherdiv.value = dto.idx
					
					divmodify.value = dto.idx
					divdelete.value = dto.idx
					
					divmodify.setAttribute('onclick', 'divmodify(this)')
					divdelete.setAttribute('onclick', 'divdelete(this)')
					
					motherdiv.appendChild(div)
					buttondiv.appendChild(divmodify)
					buttondiv.appendChild(divdelete)
					motherdiv.appendChild(buttondiv)
					replylist.appendChild(motherdiv)
				}
				else{
					replylist.appendChild(div)
				}
				
			}
			
			var divwrap = document.createElement('div')
			var divscore = document.createElement('div')
			var divtotla = document.createElement('div')
			
			divwrap.style.display = 'flex'
			
			divscore.style.fontSize = '30px'
			
			divtotla.style.fontSize = '15px'
			divtotla.style.display = 'flex'
			divtotla.style.alignItems = 'flex-end'
			divtotla.style.fontWeight = 400
			
			divscore.innerText = (totalscore/totalreviews) + ' / 5'
			divwrap.appendChild(divscore)
			
			divtotla.innerText = '( ' + totalreviews + '개 후기 )'
			divwrap.appendChild(divtotla)
			
			reviewtitle.appendChild(divwrap)
			
			var divwrap2 = document.createElement('div')
			var divscore2 = document.createElement('div')
			var divtotla2 = document.createElement('div')
			
			divwrap2.style.display = 'flex'
			
			divscore2.style.fontSize = '20px'
			
			divtotla2.style.fontSize = '20px'
			divtotla2.style.display = 'flex'
			divtotla2.style.alignItems = 'flex-end'
			divtotla2.style.fontWeight = 400
			
			for(let i = 0; i < (totalscore/totalreviews) ; i++){
				divscore2.innerText += '★'
			}
			divwrap2.appendChild(divscore2)
			
			divtotla2.innerText = '( ' + totalreviews + '개 후기 )'
			divwrap2.appendChild(divtotla2)
			document.getElementById('title').appendChild(divwrap2)
			
		})
		
	}
	
	function createreplydiv(dto, foridx) {
		var div = document.createElement('div')
		var divstar = document.createElement('div')
		var divcontent = document.createElement('div')
		var divflex = document.createElement('div')
		
		for(let i = 0; i < dto.scope ; i++){
			divstar.innerText += '★'
		}
		div.appendChild(divstar)
		
		divcontent.innerHTML = dto.wr + '<br>'
		div.appendChild(divcontent)
		
		if(dto.img != null){
// 			div.className = 'wrapReplyList'
			divflex.className = 'wrapflexReplyList'
			div.style.width = '100%'
			divflex.appendChild(div)
			
			for(let i = 0 ; i < dto.writingfilename.length ; i++){
				var imgdiv = document.createElement('div')
				imgdiv.style.backgroundImage = 'url(${cpath}/image/store' + dto.writer + dto.pdidx + '/' + dto.writingfilename[i] + ')'
				imgdiv.style.height = '100px'
				imgdiv.style.width = '100px'
				imgdiv.style.backgroundRepeat = 'no-repeat'
				imgdiv.style.backgroundSize = '100%'
				imgdiv.style.backgroundPosition = 'center'
				
				divflex.appendChild(imgdiv)
			}
			divflex.style.display = 'flex'
			return divflex
		}
		
		div.className = 'wrapReplyList'
		return div
	}
	
	function changemainimg(e) {
		for(let i = 0; i < viewimglist.childElementCount; i++){
			if(viewimglist.children[i].id == e.id){
                mainImg.style.backgroundImage = 'url(' + e.src + ')'
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
	
	//qna리스트 가져오는거
	function getqnalist() {
		
		const url = '${cpath}/store/getQna/'+idx
		const opt = {
				method: 'GET'
		}
		fetch(url, opt).then(resp => resp.json())
		.then(arr => {
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
	
	
	
	window.onload = getShowitem()
	window.onload = getqnalist()
	window.onload = drawingulgraph()
	window.onload = getreplylist()
	
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
	
	writing.onsubmit = function(event){
		event.preventDefault()
		if(${empty login}){
			alert('로그인하셔야 작성하실수 있습니다.')
			return
		}
		writing.pdidx.value = idx
		const formData = new FormData(event.target)
		 const url = '${cpath}/store/writing'
	     const opt = {
	           method: 'POST',
	           body: formData,
	     }
		 fetch(url, opt).then(resp => resp.text())
		 .then(text => {
			 if(text == 1){
				 alert('후기 작성 완료')
				 location.href = '${cpath}/store/storeDetale/?id=' + idx
			 }
			 else{
				 alert('후기 작성 실패')
			 }
		 })
	}
	
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
	        qna_form.reset(); 
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

<script>

	function modifyreply(event) {
		var form = document.getElementById('modifyreplyform')
		
		var formData = new FormData(form)
		
		var url = '${cpath}/store/modifyreply'
		var opt = {
				method: 'POST',
				body: formData,
		}
		fetch(url, opt).then(resp => resp.text())
		.then(text => {
			if(text == 1){
				alert('수정 성공!')
				location.href = '${cpath}/store/storeDetale/?id=' + idx
			}
			else{
				alert('수정 실패!')
			}
		})
	}

	function divmodify(event) {
		
		for(let i = 0; i < document.getElementById('replylist').childElementCount ; i++){
			if(document.getElementById('replylist').children[i].childElementCount > 2){
				document.getElementById('replylist').children[i].children[2].remove()
				return
			}
		}
		
			var form = document.createElement('form')
			form.id = 'modifyreplyform'
			
			var textarea = document.createElement('textarea')
			textarea.rows = '5'
			textarea.cols = '80'
			textarea.name = 'wr'
			textarea.style.resize = 'none'
			
			var div = document.createElement('div')
			div.innerText = '수정 하기'
			div.setAttribute('onclick', 'modifyreply(this)')
			div.className = 'submitreplydiv'
			
			var select = document.createElement('select')
			select.name = 'scope'
			
			var opt1 = document.createElement('option')
			opt1.innerText = '별점주기'
			opt1.selected
			select.appendChild(opt1)
			
			var opt2 = document.createElement('option')
			opt2.value = 5
			opt2.innerText = '★★★★★'
			select.appendChild(opt2)
			
			var opt3 = document.createElement('option')
			opt3.value = 4
			opt3.innerText = '★★★★'
			select.appendChild(opt3)
				
			var opt4 = document.createElement('option')
			opt4.value = 3
			opt4.innerText = '★★★'
			select.appendChild(opt4)
			
			var opt5 = document.createElement('option')
			opt5.value = 2
			opt5.innerText = '★★'
			select.appendChild(opt5)
				
			var opt6 = document.createElement('option')
			opt6.value = 1
			opt6.innerText = '★'
			select.appendChild(opt6)
			
			var inputidx = document.createElement('input')
			inputidx.name = 'idx'
			inputidx.type = 'hidden'
			inputidx.value = parseInt(event.value)
			
			var inputwriter = document.createElement('input')
			inputwriter.name = 'writer'
			inputwriter.type = 'hidden'
			inputwriter.value = '${login.userid}'
			
			var inputpdidx = document.createElement('input')
			inputpdidx.name = 'pdidx'
			inputpdidx.type = 'hidden'
			inputpdidx.value = idx
			
			var inputfile = document.createElement('input')
			inputfile.name = 'Writingfiles'
			inputfile.type = 'file'
			inputfile.multiple = 'multiple'
			
			var divwrap = document.createElement('div')
			
			divwrap.className = 'modifydivwrap'
			
			divwrap.appendChild(select)
			divwrap.appendChild(inputfile)
			divwrap.appendChild(div)
			
			form.appendChild(inputwriter)
			form.appendChild(inputpdidx)
			form.appendChild(inputidx)
			form.appendChild(textarea)
			form.appendChild(divwrap)
			
			
			for(let i = 0; i < document.getElementById('replylist').childElementCount ; i++){
				if(document.getElementById('replylist').children[i].value == event.value){
					document.getElementById('replylist').children[i].appendChild(form)
				}
			}
	}
	
	function divdelete(event) {
		if(confirm('정말로 댓글을 삭제하시겠습니까?')){
			var url = '${cpath}/store/deletereply/'+ event.value
			var opt = {
				method: 'DELETE',
			}
			fetch(url, opt).then(resp => resp.text())
			.then(text => {
				if(text == 1){
					alert('삭제 성공!')
					location.href = '${cpath}/store/storeDetale/?id=' + idx
				}
				else{
					alert('삭제 실패!')
				}
			})
		}
	}
	
</script>

<%@ include file="../footer.jsp" %>