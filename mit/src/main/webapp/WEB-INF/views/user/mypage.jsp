<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.mypage {
		width: 800px;
		height: auto;
		margin: 150px auto;
		align-content: center;
	}
	.userInfo{
		display: flex;
		margin-bottom: 50px;
	}
	.userImg {
		border-radius: 50%;
		border: 3px solid black;
		width: 100px;
		height: 100px;
		overflow: hidden;
	}
	.userInfoMenu {
		margin-left: 20px;
		padding-top: 15px;
	}
	.myQNA {
		width: inherit;
		height: auto;
	}
	table {
		width: inherit;
		height: auto;
		text-align: left;
		border-collapse: collapse;
	}
	td {
 		border-bottom: 1px solid #d5d5d5; 
 		padding: 5px;
 	}
	table tr td:first-child {
		width: 90px;
	}
	table tr td:nth-child(2) {
		text-align: center;
		width: 100px;
	}
	.title:hover {
		cursor: pointer;
		color: grey;
	}
	.pdWrap {
		display: flex;
		margin-top: 5px;
	}
	.buyListOne {
		border-bottom: 1px solid #eaeaea; 
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
	.pdLink {
		cursor: pointer;
	}
	.pdLink:hover {
		color: grey;
	} 
	.myCart {
		height: auto;
		width: 100%;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	.cartOne {
		display: flex;
		justify-content: space-between;
		border-bottom: 1px solid #eaeaea; 
	}
	.cartMenu {
		padding-top: 30px;
	}
	.countInput {
		width: 40px;
	}
	.myCartButton, .checkAll {
		text-align: right;
	}
	.myCartButton button {
		cursor: pointer;
		border: 1px solid rgb(65, 65, 65);
		background-color: #e9e9e9;
		width: 100px;
	    height: 35px;
	}
	.myCartButton button:first-child {
		background-color: white;
	}
	.hidden {
		display: none;
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

<div class="mypage">

	<h2>회원 정보</h2>
	<div class="userInfo">
		<div>
			<img src="${cpath}/image/${login.userimg}" class="userImg" >
		</div>
		<div class="userInfoMenu">
			<div>${login.username }님 안녕하세요</div>
			<div>닉네임 : ${login.usernick }</div>
			<a href="${cpath }/user/userInfo">회원정보 수정</a>
			<span> | </span>
			<a href="${cpath }/user/userDelete">탈퇴하기</a>
		</div>
	</div>
	
	<h2>장바구니</h2>
	<div class="checkAll">
		<span>전체 선택</span>
		<input type="checkbox" name="checkAll" class="allCheck">
	</div>
	<form method="POST" name="cart_form">
		<div class="myCart">
		</div>
		<div class="myCartButton">
			<button type="button" onclick="addOrder();">구매</button>
			<button type="button" onclick="cartDelete();">삭제</button>
		</div>
	</form>	
	
	<h2>주문 내역</h2>
	<div class="myOrder">
	</div>
		
	<h2>내가 쓴 글</h2>
	<div class="myQNA">
	</div>	
	
</div>	

<script>
// 내가 쓴 글
const userid = '${login.userid}'
const myQNA = document.querySelector('.myQNA')

function getqnalist() {
	const url = '${cpath}/user/getQnaList/'+ userid
	const opt = {
			method: 'GET'
	}
	fetch(url, opt).then(resp => resp.json())
	.then(arr => {
		if(arr.length < 1) {
			myQNA.innerText = '내가 쓴 글이 없습니다.'
		}
		var table = document.createElement('table')
		for(let i = 0 ; i < arr.length ; i++){
			var dto = arr[i]
			var tr = createtr(dto, i)
			table.appendChild(tr)
		}
		myQNA.appendChild(table)
	})
}

function createtr(dto, idx) {
	var tr = document.createElement('tr')
	var tddate = document.createElement('td')
	var tdmenu = document.createElement('td')
	var tdtitle = document.createElement('td')
	
	tddate.innerText = dto.qnadate
	tr.appendChild(tddate)
		
	tdmenu.innerText = dto.qnamenu
	tr.appendChild(tdmenu)
	
	tdtitle.innerText = '[' +dto.qnaresult + '] ' +dto.qnatitle
	tdtitle.classList.add('title')
	tr.appendChild(tdtitle)
	
	tdtitle.onclick = function(e) {
		location.href = '${cpath}/user/qna/'+dto.idx
	}
	
	return tr
}

window.onload = getqnalist()

</script>

<script>
//모두 동의 클릭시 전체 선택
const allCheck = document.querySelector(".allCheck")
const checks = document.getElementsByName("cartcheck")

allCheck.onclick = function() {
	if(allCheck.checked == false) {
		for(let i = 0; i < checks.length; i++) {
			checks[i].checked = false;
		}
	}else {
		for(let i = 0; i < checks.length; i++) {
			checks[i].checked = true;
		}
	}
}

function oneCheck() {
	var chkCount = 0
	for(let i = 0; i < checks.length; i++) {
		if(checks[i].checked == true) {
			chkCount++
		}
	}
	if(chkCount == checks.length) {
		allCheck.checked = true;
	}
	else {
		allCheck.checked = false;
	}
}

</script>

<script>
// 장바구니
const myCart = document.querySelector('.myCart')
const checkAll = document.querySelector('.checkAll')
const myCartButton = document.querySelector('.myCartButton')

function getMyCart() {
	myCart.innerHTML = ''
	const url = '${cpath}/user/getmyCart/' + userid
	const opt = {
			method: 'GET'
	}
	fetch(url, opt).then(resp => resp.json())
	.then(arr => {
		// 장바구니가 비었으면??
		if(arr.length < 1) {
			myCartButton.classList.add('hidden')
			checkAll.classList.add('hidden')
			myCart.innerText = '장바구니가 비었습니다.'
		}
				
		for(let i = 0 ; i < arr.length ; i++){
			var product = arr[i]
	 		const Idx = product.idx;
	 		const pdidx = product.pdidx;
	 		const pdtitle = product.title;
	 		const pdsize = product.usersize;
	 		const pdprice = product.price;
	 		const pdMainImg = product.mainimg;
	 		const pdcount = product.count;
	 		const buyThis = product.buythis;
			
	 		const mainImg = document.createElement('img')
		
	 		if(pdMainImg == null) {
	 			mainImg.style.backgroundColor = 'grey'
	 		}else {
	 			mainImg.src = '${cpath}/image/'+ pdMainImg
	 		}
	 		
			const pdimg = document.createElement('div')
			pdimg.classList.add('pdimg')
	 		pdimg.appendChild(mainImg)
	 		
			const pdWrap = document.createElement('div')
			pdWrap.classList.add('pdWrap')
			
			const pdinfo = document.createElement('div')
			pdinfo.classList.add('pdinfo')
		
	 		const p1 = document.createElement('p')
	 		p1.innerText = pdtitle
	 		
	 		pdinfo.appendChild(p1)
			
	 		const p2 = document.createElement('p')
	 		p2.innerText = pdsize
	 		pdinfo.appendChild(p2)
			
	 		const p3 = document.createElement('p')
	 		p3.innerText = pdprice + '원'
	 		pdinfo.appendChild(p3)
	 		
	 		const cartMenu = document.createElement('div')
	 		cartMenu.classList.add('cartMenu')
	 		
	 		const span1 = document.createElement('span')
	 		const span1_5 = document.createElement('span')
	 		span1_5.innerHTML = '수량 : '
	 		span1.appendChild(span1_5)
	 			
	 		const countInput = document.createElement('input')
	 		const idxInput = document.createElement('input')
	 		const buyThisnum = document.createElement('input')
	 		
	 		countInput.classList.add('countInput')
	 		countInput.type = 'number'
	 		countInput.value = pdcount
	 		countInput.name = 'count'
	 		
	 		idxInput.type = 'hidden'
	 		idxInput.value = Idx
			idxInput.name = 'idx'
			
			buyThisnum.type = 'hidden'
			buyThisnum.value = buyThis
			buyThisnum.name = 'buythis'
	 
	 		span1.appendChild(countInput)
	 		span1.appendChild(idxInput)
	 		span1.appendChild(buyThisnum)
	 		cartMenu.appendChild(span1)
	 		
	 		const span2 = document.createElement('span')
	 		const cartCheck = document.createElement('input')
	 		cartCheck.type = 'checkbox'
	 		cartCheck.name = 'cartcheck'
	 		cartCheck.value = Idx
	 		cartCheck.onclick = oneCheck
	 		span2.appendChild(cartCheck)
	 		cartMenu.appendChild(span2)
	 		 	
	 		pdWrap.appendChild(pdimg)
	 		pdWrap.appendChild(pdinfo)
	 		
	 		const cartOne = document.createElement('div')
	 		cartOne.appendChild(pdWrap)
	 		cartOne.appendChild(cartMenu)
	 		cartOne.classList.add('cartOne')
	 		
	 		myCart.appendChild(cartOne)
	 		cartOne.classList.add('pdLink')
	 		
	 		// 상품명 누르면 상품 페이지로 이동
	 		cartMenu.onclick = function() {
	 			event.stopPropagation()
	 		}
	 		
	 		cartOne.onclick = function() {
				location.href = '${cpath}/store/storeDetale/?id='+ pdidx
	 		}
		}
	})
}

window.onload = getMyCart()

</script>

<script>
// 장바구니 구매 버튼
function addOrder() {
	 //check이름을 가진 check중에서 체크된 것만 값 가져오기
    var size = document.getElementsByName("cartcheck").length;
	var chkCount = 0 	 
	var checkedArr = new Array(); 
	
    for(var i = 0; i < size; i++){
        if(document.getElementsByName("cartcheck")[i].checked == true){
        	checkedArr.push(document.getElementsByName("cartcheck")[i].value);
        	chkCount+=1
        }
    }	
    
    // 체크한 값이 하나도 없으면 ???
    if(chkCount < 1) {
    	alert('상품을 선택해주세요.')
    	return
    }		
    
	const url = '${cpath}/user/addOrder'
	const opt = {
		method: 'POST',
		body: JSON.stringify(checkedArr),
	    headers: {
	         'Content-Type': 'application/json; charset=utf-8'
		}
	}
	fetch(url, opt).then(resp => resp.text())
	.then(text => {
		if(text == 1) {
			location.href = '${cpath}/store/purchase/?userid='+ userid
		}
		else{
			alert('다시 시도해주세요.')
		}
	})
}

</script>

<script>
// 장바구니 삭제 버튼
function cartDelete() {
	 //check이름을 가진 check중에서 체크된 것만 값 가져오기
    var size = document.getElementsByName("cartcheck").length;
	var chkCount = 0 	 
	var checkedArr = new Array(); 
	
    for(var i = 0; i < size; i++){
        if(document.getElementsByName("cartcheck")[i].checked == true){
        	checkedArr.push(document.getElementsByName("cartcheck")[i].value);
        	chkCount+=1
        }
    }	
    
    // 체크한 값이 하나도 없으면 ???
    if(chkCount < 1) {
    	alert('상품을 선택해주세요.')
    	return
    }		
    
	const url = '${cpath}/user/cartDelete'
	const opt = {
		method: 'POST',
		body: JSON.stringify(checkedArr),
	    headers: {
	         'Content-Type': 'application/json; charset=utf-8'
		}
	}
	fetch(url, opt).then(resp => resp.text())
	.then(text => {
		if(text == 1) {
			alert('삭제 되었습니다.')
			getMyCart()
		}
		else{
			alert('다시 시도해주세요.')
		}
	})
}

</script>

<script>
// 주문 내역
const myOrder = document.querySelector('.myOrder')

function getMyOrder() {
	const url = '${cpath}/user/getMyOrder/' + userid
	const opt = {
			method: 'GET'
	}
	fetch(url, opt).then(resp => resp.json())
	.then(arr => {
		if(arr.length < 1) {
			myOrder.innerText = '주문 내역이 없습니다.'
		}
		
		for(let i = 0 ; i < arr.length ; i++){
			var product = arr[i]
	 		const pdDate = product.buydate;
	 		const total = product.total;
	 		const address = product.useraddress;
	 		
			const pdWrap = document.createElement('div')
			pdWrap.classList.add('buyListOne')
			
			const pdinfo = document.createElement('div')
			pdinfo.classList.add('pdinfo')
		
	 		const p1 = document.createElement('p')
	 		p1.innerText = '주문일 : ' + pdDate
	 		pdinfo.appendChild(p1)
			
	 		const p2 = document.createElement('p')
	 		p2.innerText = '주문 금액 : ' + total + '원'
	 		pdinfo.appendChild(p2)
			
	 		const p3 = document.createElement('p')
	 		p3.innerText = '배송지 : ' + address
	 		pdinfo.appendChild(p3)
	 		
	 		pdWrap.appendChild(pdinfo)
	 		myOrder.appendChild(pdWrap)
	 		
		}
	
	})
}

window.onload = getMyOrder()

</script>

<%@ include file="../footer.jsp" %>