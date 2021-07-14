<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	.store {
		padding: 100px 50px;
	}
	.head{
		display: flex;
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
		text-align: center;
	}
	#mainImg {
		width: 100%;
		align-items: center;
		justify-content: center;
	}
</style>

<div class="store">
<div id="showitem">
	<div class="head">
		<div id="mainImg"></div>
		<div class="subcontent">
			<div id="jsoncontent"></div>
			<br><br><br>
			<button>구매하기</button>
			<button>장바구니</button>
			<hr>
		</div>
	</div>
	<br><br><br><br><br><br>
	<hr>
	<br><br><br>
	<div id="mainContent">
	
	</div>
</div>


<button id="modifyBtn">수정</button>
<button id="deleteBtn">삭제</button>
</div>

<script>
	const showitem = document.getElementById('showitem')
	const modifyBtn = document.getElementById('modifyBtn')
	const deleteBtn = document.getElementById('deleteBtn')
	const mainImg = document.getElementById('mainImg')
	const jsoncontent = document.getElementById('jsoncontent')
	const mainContent = document.getElementById('mainContent')
	const link = document.location.search
	const params = new URLSearchParams(link)
	const idx = params.get('id')
	
	
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
			
			
			var img = document.createElement('img')
			if(json.filename[0] != ''){
				img.src = '${cpath}/image/'+ json.pdcolor + '/'+ json.filename[0]
			}
			else{
				img.src = '${cpath}/image/Default.jpg'
			}
			mainImg.appendChild(img)
			
			var msg = json.pdcontent
			var idx = 1
			while(msg.length > 0){
				
				if(msg.indexOf('</p>') >= 0) {
					mainContent.innerHTML += msg.substr(0, msg.indexOf('</p>')+4)
                    msg = msg.substr(msg.indexOf('</p>')+4)
                }
				
				if(msg.indexOf('<img src="">') == 0) {
					console.log(idx)
					var img = document.createElement('img')
					img.src = '${cpath}/image/'+ json.pdcolor + '/' + json.filename[idx]
					mainContent.appendChild(img)
					msg = msg.substr(msg.indexOf('<img src="">')+12)
					idx += 1
                }
			}
		})
	}
	
	deleteBtn.onclick = function(){
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
		console.log('a')
		location.href = '${cpath}/store/writeItem/?id=' + idx
	}
	
	window.onload = getShowitem()

</script>

<%@ include file="../footer.jsp" %>