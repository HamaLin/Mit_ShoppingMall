<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	.content:hover{
		cursor: pointer;
		background-color: silver;
	}
	.glasses {
		margin: 150px;
		padding: 100px 50px;
		display: flex;
		width: 100%;
		height: auto;
	}
	#glassesItems{
		width: 300px;
		height: 400px;
		display: flex;
	}
	#glassesItems > .content{
		
		padding: 10px;
		fontSize: 100px;
		fontWeight: bold;
		text-align: center;
		margin: 0;
	}
	.content > a > img{
		width: 290px;
		
	}
</style>

<div class="glasses">
	<div id="glassesItems"></div>
</div>

<script>
	const glassesItems = document.getElementById('glassesItems')
	
	// 객체를 받아서 배열형태로 저장 및 화면에 출력
	function loaditems(){
	const url = '${cpath}/store/GlassesItems'
	const opt = {
			method: 'GET',
	}
	fetch(url, opt).then(resp => resp.json())
	.then(arr =>{
		for(let i = 0; i < arr.length; i++){
			const dto = arr[i]
			const div = createDiv(dto)
			glassesItems.appendChild(div)
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