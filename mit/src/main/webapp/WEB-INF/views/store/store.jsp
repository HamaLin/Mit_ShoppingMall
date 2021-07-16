<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
	.content:hover{
		cursor: pointer;
		background-color: silver;
	}
	.store {
		padding: 100px 50px;
		display: flex;
		width: 100%;
	}
	#getItems{
		display: flex;
	}
	
	.content{
		padding: 50px;
		fontSize: 100px;
		fontWeight: bold;
		width: 350px;
		height: 350px;
		text-align: center;
		margin: 50px;
	}
</style>


<div class="store">
	<div id="getItems"></div>
</div>
<c:if test="${not empty admin }"> 
	<a href="${cpath}/store/writeItem"><button>상품 등록</button></a>
</c:if>
<script>
	const getItems = document.getElementById('getItems')
	
	// 객체를 받아서 배열형태로 저장 및 화면에 출력
	function loaditems(){
	const url = '${cpath}/store/GetItems'
	const opt = {
			method: 'GET',
	}
	fetch(url, opt).then(resp => resp.json())
	.then(arr =>{
		for(let i = 0; i < arr.length; i++){
			const dto = arr[i]
			const div = createDiv(dto)
			getItems.appendChild(div)
		}
	})
	
	}
	
	window.onload = loaditems
	
	
	// div의 스타일 및 내용을 추가
	function createDiv(dto) {
		const div = document.createElement('div')
		
		div.innerHTML = '<input type="hidden" name="idx" value="' + dto.idx + '">'
		
		if(dto.pdimg != null){
// 			for(let i = 0; i < dto.filename.length; i++){
				const img = document.createElement('img')
				img.style.width = '200px'
				img.style.height = '350px'
				
				div.innerHTML += '<a href="${cpath}/store/storeDetale/?id=' + dto.idx + '"><img src = ' + 
								'${cpath}/image/'+ dto.pdcolor + '/' + dto.filename[0]+' style="width: 300px; height: 300px;"></a> '
// 				div.appendChild(img)	
// 			}
		}
		else{
			const img = document.createElement('img')
			img.style.width = '200px'
			img.style.height = '350px'
			
			div.innerHTML += '<a href="${cpath}/store/storeDetale/?id=' + dto.idx + '"><img src = ' + 
							'${cpath}/image/Default.jpg style="width: 300px; height: 300px;"></a> '
		}
		
		div.innerHTML += '<br>' + '<a href="${cpath}/store/storeDetale/?id=' + dto.idx + '">' + dto.pdtitle +'</a> ' + 
		'<br>' + '<br>' +
		dto.pdprice + '원'
		
		
		div.className = 'content'						
		return div						
	}

	getItems.onclick = getdivcontent
	
</script>

<%@ include file="../footer.jsp"%>