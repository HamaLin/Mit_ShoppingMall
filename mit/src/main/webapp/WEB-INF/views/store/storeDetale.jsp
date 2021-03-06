<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
*:not(.category-ul) {
	box-sizing: border-box;
}

.store {
    position: relative;
	padding: 80px 50px;
	height: auto;
}

.head {
	width: 90%;
    display: flex;
}
.headwrap {
	display: flex;
    flex-flow: column;
    align-items: center;
    justify-content: center;
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
	padding-left: 150px;
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
	transition-duration: 1s;
}

img {
	width: 60%;
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
	justify-content: center;
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
	margin-bottom: 43px;
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
.adminbtn{
    position: absolute;
    right: 20px;
    top: 100px;
}

.adminbtn > button {
	margin-left: 20px;
    width: 100px;
    height: 50px;
    background-color: white;
    font-size: 18px;
}
.barnumber{
	position: absolute;
}
</style>

<div class="store">

<c:if test="${not empty admin }">
<div class="adminbtn">
	<button id="deleteBtn" style="background-color: black; color: white;">??????</button>
	<button id="modifyBtn">??????</button>
</div>
</c:if>

<div id="showitem">
	<div class="headwrap">
	<div class="head">
		<div class="leftheader">
			<div id="mainImg"></div>
			<div id="viewimglist"></div>
		</div>
		<div class="subcontent">
			<div id="jsoncontent"></div>
			<br><br><br>
			<div>
				<p style="font-size: 20px; font-weight: bold;">?????????</p>
				<select id="selectSize">
					<option>???????????????</option>
					<option>S</option>
					<option>M</option>
					<option>L</option>
					<option>XL</option>
				</select>
                <br>
                <input type="number" id="count" placeholder="??????">
			</div>
			<div class="selectoption">
				<button id="gotoBuyItem">????????????</button>
				<button id="gotoWishList">????????????</button>
			</div>
			
		</div>
	</div>
	</div>
		<div class="selectmenu">
			<ul>
				<li id="explain">?????? ??????</li>
				<li id="review">??????</li>
				<li id="question">??????</li>
				<li id="releaseItem">?????? ?????? </li>
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
	<div style="font-size: 20px; font-weight: bold;" id="reviewtitle">??????</div>
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
		<textarea placeholder="????????? ???????????????." name="wr" ></textarea>
		<div>
		<select name="scope">
			<option selected>????????????</option>
			<option value="5">???????????????</option>
			<option value="4">???????????????</option>
			<option value="3">???????????????</option>
			<option value="2">???????????????</option>
			<option value="1">???????????????</option>
		</select>
		<input type="file" name="Writingfiles" accept="image/*">
		<input type="submit" value="????????????">
		</div>
		</form>

	</div>
</div>
<div id="modifyanddelete"></div>
<button id="writingBtn">?????? ??????</button>

	</div>
	
<div id="qna">
<div style="font-size: 25px; font-weight: bold;">??????</div>
<hr>
<table id="qnalist">
	<thead>
		<tr>
		</tr>
	</thead>
	<tbody></tbody>
</table>
<button id="qnaBtn">????????????</button>
	<div class="qna hidden">
	<h3>????????????</h3>
	<form method="POST" name="qna_form" enctype="multipart/form-data">
		<p><input type="text" class="qnawriter" name="qnawriter" placeholder="?????????" value="${login.userid }"></p>
		<p>
			<select class="selectMenu" name="qnamenu">
				<option value="">?????? ??????</option>
				<option value="?????????">?????????</option>
				<option value="??????">??????</option>
				<option value="?????????">?????????</option>
				<option value="??????">??????</option>
			</select>
		</p>
	<p><input type="hidden" name="qnaproductidx" value="${param.id }"placeholder="qnaproductidx"></p>	
		<p><input type="text" class="qnatitle" name="qnatitle" placeholder="??????"></p>
		<p><textarea name="qnacontent" placeholder="???????????? ????????? ??????????????????."></textarea></p>
		<p><input type="file" multiple="multiple" name="files" accept="image/*" ></p>
	<p class="qnap"><button class="qnabutton" type="button" onclick="qnaform_check();">?????? ??????</button></p>
	</form>
	</div>
</div>
	
	<div id="showmethechart">
		<div class="wrapall">
			<p style="font-size: 25px; font-weight: bold;">?????? ??????</p>
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
const mainImg = document.getElementById('mainImg')
const modifyanddelete = document.getElementById('modifyanddelete')
const qna = document.getElementById('qna')
const showmethechart = document.getElementById('showmethechart')
const link = document.location.search
const params = new URLSearchParams(link)
const idx = params.get('id')

    explain.onclick = function() {
		window.scrollTo({top:mainContent.offsetTop - 200, behavior:'smooth'})
    }

    review.onclick = function() {
    	window.scrollTo({top:reply.offsetTop - 200, behavior:'smooth'})
    }

    question.onclick = function() {
    	window.scrollTo({top:qna.offsetTop - 200, behavior:'smooth'})
    }

    releaseItem.onclick = function() {
    	window.scrollTo({top:showmethechart.offsetTop - 200, behavior:'smooth'})
    }
	
    // ?????? ?????? ???????????? ??????
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
			
			'???' +'</p>'+ '<br>'
			jsoncontent.innerHTML += '<p>' + '????????? : ' + '0%' +'</p>'
			jsoncontent.innerHTML += '<p>' + '????????? : ' + (json.pdprice/10).toString().replace
			(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + '???' +'</p>'
			
			if(json.pdscount != 0){
				selectSize.options[1].text = 's : ' + json.pdscount
				selectSize.children[1].value = json.pdscount
			}
			else{
				selectSize.options[1].remove()
			}

			if(json.pdmcount != 0){
				selectSize.options[2].text = 'm : ' + json.pdmcount
				selectSize.children[2].value = json.pdmcount
			}
			else{
				selectSize.options[2].remove()
			}

			if(json.pdlcount != 0){
				selectSize.options[3].text = 'l : ' + json.pdlcount
				selectSize.children[3].value = json.pdlcount
			}
			else{
				selectSize.options[3].remove()
			}

			if(json.pdxlcount != 0){
				selectSize.options[4].text = 'xl : ' + json.pdxlcount
				selectSize.children[4].value = json.pdxlcount
			}
			else{
				selectSize.options[4].remove()
			}
			
// 			selectSize.options[1].text = 's : ' + json.pdscount
//             selectSize.options[2].text = 'm : ' + json.pdmcount
//             selectSize.options[3].text = 'l : ' + json.pdlcount
//             selectSize.options[4].text = 'xl : ' + json.pdxlcount
            
//             selectSize.children[1].value = json.pdscount
//             selectSize.children[2].value = json.pdmcount
//             selectSize.children[3].value = json.pdlcount
//             selectSize.children[4].value = json.pdxlcount
			
			if(json.mainimg != ''){
				mainImg.style.backgroundImage = 'url(' + json.mainimg + ')'
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
					img.src = json.viewimglist[i]
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
					img.src = json.filename[idx]
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
				SubmitUserInfo.mainimg.value = json.mainimg
				SubmitUserInfo.title.value = json.pdtitle
				var age = ${login.userbirth}
				SubmitUserInfo.userage.value = parseInt(2021 - age/10000)
			}
		})
	}
	
	//?????? ?????????
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
	
	// ?????? ????????? ??????
	function drawingbar(age, total, fori) {
		var li = document.createElement('li')
		var p = document.createElement('li')
		
		switch (fori) {
		case 0 : p.innerText = '~ 18???'
			break;
		case 1 : p.innerText = '18 ~ 23???'
			break;
		case 2 : p.innerText = '23 ~ 28???'
			break;
		case 3 : p.innerText = '28 ~ 33???'
			break;
		case 4 : p.innerText = '33 ~ 39???'
			break;
		case 5 : p.innerText = '40??? ~'
			break;
		}
		li.appendChild(p)
		var span = document.createElement('span')
		span.className = 'bar'
		span.style.width = '30px'
		span.style.height = (age/total)*100 + '%'
		
		var divpercentnumber = document.createElement('div')
		divpercentnumber.innerText = parseInt((age/total)*100) + '%'
		divpercentnumber.className = 'barnumber'
		if(total != 0) {
		divpercentnumber.style.height = ((age/total)*100)+30 + '%'
		li.appendChild(divpercentnumber)			
		}	
		
		li.appendChild(span)
		return li
	}

	//?????? ???????????? ??????
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
					divmodify.innerText = '??????'
					divdelete.innerText = '??????'
					
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
			
			if(arr.length != 0){
				
			
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
			divtotla.innerText = '( ' + (totalreviews == 0 ? 0 : totalreviews) + '??? ?????? )'
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
				divscore2.innerText += '???'
			}
			divwrap2.appendChild(divscore2)
			
			divtotla2.innerText = '( ' + totalreviews + '??? ?????? )'
			divwrap2.appendChild(divtotla2)
			
			document.getElementById('title').appendChild(divwrap2)
			}
		})
		
	}
	
	function createreplydiv(dto, foridx) {
		var div = document.createElement('div')
		var divstar = document.createElement('div')
		var divcontent = document.createElement('div')
		var divflex = document.createElement('div')
		
		for(let i = 0; i < dto.scope ; i++){
			divstar.innerText += '???'
		}
		div.appendChild(divstar)
		
		divcontent.innerHTML = dto.wr + '<br>'
		div.appendChild(divcontent)
		
		if(dto.img != null){
			divflex.className = 'wrapflexReplyList'
			div.style.width = '100%'
			divflex.appendChild(div)
			
				var imgdiv = document.createElement('div')
				console.log(dto.writingfilename)
				imgdiv.style.backgroundImage = 'url(' + dto.writingfilename + ')'
				imgdiv.style.height = '100px'
				imgdiv.style.width = '100px'
				imgdiv.style.backgroundRepeat = 'no-repeat'
				imgdiv.style.backgroundSize = '100%'
				imgdiv.style.backgroundPosition = 'center'
				
				divflex.appendChild(imgdiv)
			divflex.style.display = 'flex'
			return divflex
		}
		
		div.className = 'wrapReplyList'
		return div
	}
	
	function changemainimg(e) {
		
		
		for(let i = 0; i < viewimglist.childElementCount; i++){
			if(viewimglist.children[i].id == e.id){
				mainImg.style.opacity = 0
				
				setTimeout(function() { 
					mainImg.style.backgroundImage = 'url(' + e.src + ')'
                	
                	setTimeout(function() {mainImg.style.opacity = 1 }, 1000);
				}, 500);
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
	
	//qna????????? ???????????????
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
		
		if(dto.qnareplycnt > 0) {
			tdtitle.innerText = '[?????? ??????] ' + dto.qnatitle + ' (' + dto.qnareplycnt + ')'
		} else {
			tdtitle.innerText = '[?????? ??????] ' + dto.qnatitle 
		}

		tdtitle.classList.add('title')
		tr.appendChild(tdtitle)
		
		tdtitle.onclick = function(e) {
			location.href = '${cpath}/user/qna/'+ dto.idx
		}
		
		// ????????? ???????????? ?????? ?????? *??? ?????????
		var maskingName = function(strName) {
		  if (strName.length > 2) {
		    var originName = strName.split('');
		    originName.forEach(function(name, i) {
		      if (i === 0 || i === originName.length - 1) return;
		      originName[i] = '*';
		    });
		    var joinName = originName.join();
		    return joinName.replace(/,/g, '');
		  } 
		// 2????????? ????????? ?????????
		  else {
		    var pattern = /.$/; // ?????????
		    return strName.replace(pattern, '*');
		  }
		};
		
		var strName = dto.qnawriter
		tdwriter.innerText = maskingName(strName)
		tr.appendChild(tdwriter)
		
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
			alert('??????????????? ????????????')
			location.replace('${cpath}/user/login')
			return
		}
		if(selectSize.options.selectedIndex == 0 || document.getElementById('count').value == ''){
			alert('????????? ???????????? ???????????????')
			return
		}
		if(confirm('??????????????? ?????????????????????????')){
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
					alert('??????????????? ?????? ???????????????!')
				}
				else{
					alert('?????? ??????')
				}
			})
		}
	}
	gotoBuyItem.onclick = function() {
		if(${empty login}){
			alert('??????????????? ????????????')
			location.replace('${cpath}/user/login')
			return
		}
		if(selectSize.options.selectedIndex == 0 || document.getElementById('count').value == ''){
			alert('????????? ???????????? ???????????????')
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
			if(confirm(idx + '???????????? ?????????????????????????')){
			const url = '${cpath}/store/deleteitem/'+idx
			const opt = {
					method: 'DELETE'
			}
			fetch(url, opt).then(resp => resp.text())
			.then(text => {
				if(text == 1) {
					alert('????????? ?????? ??????')
					
					location.replace("${cpath}/store/store")
				}
				else{
					alert('????????? ?????? ??????')
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
			alert('?????????????????? ??????????????? ????????????.')
			location.href = '${cpath}/user/login'
			return
		}
		if(writing.scope.value == '????????????'){
			alert('????????? ????????? ?????????')
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
				 alert('?????? ?????? ??????')
				 location.href = '${cpath}/store/storeDetale/?id=' + idx
			 }
			 else{
				 alert('?????? ?????? ??????')
			 }
		 })
	}
	
</script>


<!--  qna ????????? ????????????  -->
<script>

//?????? ??????
function qnaform_check(event) {
	const qnawriter = document.querySelector('input[name="qnawriter"]')
	const qnamenu = document.querySelector('select[name="qnamenu"]')
	const qnatitle = document.querySelector('input[name="qnatitle"]')
	const qnacontent = document.querySelector('textarea[name="qnacontent"]')
	
	
	// ?????? ??????
	if(qnawriter.value == "") {
		location.replace("${cpath}/user/login")
		return false;
	}
	if(qnamenu.value == "") {
		alert("?????? ????????? ??????????????????.");
		qnamenu.focus();
		return false;
	}
	if(qnatitle.value == "") {
		alert("????????? ??????????????????.");
		qnatitle.focus();
		return false;
	}
	if(qnacontent.value == "") {
		alert("????????? ??????????????????.");
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
			alert('?????? ??????????????????')
		}
	})
}
</script>

<script>

	function modifyreply(event) {
		var form = document.getElementById('modifyreplyform')
		if(form.scope.value == '????????????'){
			alert('????????? ????????? ?????????')
			return
		}
		var formData = new FormData(form)
		
		var url = '${cpath}/store/modifyreply'
		var opt = {
				method: 'POST',
				body: formData,
		}
		fetch(url, opt).then(resp => resp.text())
		.then(text => {
			if(text == 1){
				alert('?????? ??????!')
				location.href = '${cpath}/store/storeDetale/?id=' + idx
			}
			else{
				alert('?????? ??????!')
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
			div.innerText = '?????? ??????'
			div.setAttribute('onclick', 'modifyreply(this)')
			div.className = 'submitreplydiv'
			
			var select = document.createElement('select')
			select.name = 'scope'
			
			var opt1 = document.createElement('option')
			opt1.innerText = '????????????'
			opt1.selected
			select.appendChild(opt1)
			
			var opt2 = document.createElement('option')
			opt2.value = 5
			opt2.innerText = '???????????????'
			select.appendChild(opt2)
			
			var opt3 = document.createElement('option')
			opt3.value = 4
			opt3.innerText = '????????????'
			select.appendChild(opt3)
				
			var opt4 = document.createElement('option')
			opt4.value = 3
			opt4.innerText = '?????????'
			select.appendChild(opt4)
			
			var opt5 = document.createElement('option')
			opt5.value = 2
			opt5.innerText = '??????'
			select.appendChild(opt5)
				
			var opt6 = document.createElement('option')
			opt6.value = 1
			opt6.innerText = '???'
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
		if(confirm('????????? ????????? ?????????????????????????')){
			var url = '${cpath}/store/deletereply/'+ event.value
			var opt = {
				method: 'DELETE',
			}
			fetch(url, opt).then(resp => resp.text())
			.then(text => {
				if(text == 1){
					alert('?????? ??????!')
					location.href = '${cpath}/store/storeDetale/?id=' + idx
				}
				else{
					alert('?????? ??????!')
				}
			})
		}
	}
	
</script>

<%@ include file="../footer.jsp" %>