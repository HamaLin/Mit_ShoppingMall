<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../filter.jsp" %>
<style>
	.content:hover{
		cursor: pointer;
		background-color: silver;
	}
	.backpack {
		margin: 150px;
		padding: 100px 50px;
		display: flex;
		width: 100%;
		height: auto;
	}
	#backpackItems{
		width: 1250px;
		display: flex;
		height: auto;
	}
	#backpackItems > .content{
		width: 300px;
		height: 400px;
		fontSize: 100px;
		fontWeight: bold;
		text-align: center;
		margin: 25px;
	}
	.content > a > img{
		width: 250px;
		height: 300px;
	}
</style>

<div class="backpack">
	<div id="backpackItems"></div>
</div>

<script>
	const backpackItems = document.getElementById('backpackItems')
	
	// 객체를 받아서 배열형태로 저장 및 화면에 출력
	function loaditems(){
	const url = '${cpath}/store/BackpackItems'
	const opt = {
			method: 'GET',
	}
	fetch(url, opt).then(resp => resp.json())
	.then(arr =>{
		for(let i = 0; i < arr.length; i++){
			const dto = arr[i]
			const div = createDiv(dto)
			backpackItems.appendChild(div)
		}
	})
	
	}
	
	window.onload = loaditems
	
	
	// div의 스타일 및 내용을 추가
	function createDiv(dto) {
		const div = document.createElement('div')
		
		div.innerHTML = '<input type="hidden" name="idx" value="' + dto.idx + '">'
		
		if(dto.mainimg != null){
				const img = document.createElement('img')
				div.innerHTML += '<a href="${cpath}/store/storeDetale/?id=' + dto.idx + '"><img src = ' + 
								'${cpath}/image/'+ dto.pdcode + dto.pdwriter + '/' + dto.mainimg+' "></a> ' + '<br>'
		}
		else{
			const img = document.createElement('img')
			div.innerHTML += '<a href="${cpath}/store/storeDetale/?id=' + dto.idx + '"><img src = ' + 
							'${cpath}/image/Default.jpg "></a> ' + '<br>'
		}
		
		div.innerHTML += '<br>' + '<a href="${cpath}/store/storeDetale/?id=' + dto.idx + '">' + dto.pdtitle +'</a> ' + 
		'<br>' + '<br>' +
		dto.pdprice + '원'
		
		
		div.className = 'content'						
		return div						
	}

</script>

<%@ include file="../footer.jsp" %>