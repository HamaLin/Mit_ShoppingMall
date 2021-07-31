<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../filter.jsp" %>
<style>
	.content:hover {
	cursor: pointer;
}

.bottom {
	margin-top: 150px;
    display: flex;
    width: 100%;
    height: auto;
    position: relative;
    justify-content: center;
}

#bottomItems {
	width: 80%;
    display: flex;
    height: auto;
    flex-wrap: wrap;
}

#bottomItems>.content {
    width: 30%;
    height: 400px;
    text-align: center;
    margin-bottom: 75px;
    margin-right: 40px;
}
.content > a {
	font-size: 20px;
}
.content > p {
	color: grey;
	margin-top: -10px;
}
.content>a>img {
	width: 60%;
    height: 80%;
}
.content > a > p {
	margin-top: 10px;
}

.adminbtn {
	position: absolute;
	right: -11%;
    top: -20%;
}

.adminbtn>a>button {
	width: 100px;
	height: 50px;
	background-color: white;
	font-size: 18px;
}
</style>

<div class="bottom">
<c:if test="${not empty admin }"> 
	<div class="adminbtn">
	<a href="${cpath}/store/writeItem"><button>상품 등록</button></a>
	</div>
</c:if>
	<div id="bottomItems"></div>
</div>

<script>
	const bottomItems = document.getElementById('bottomItems')
	
	// 객체를 받아서 배열형태로 저장 및 화면에 출력
	function loaditems(){
	const url = '${cpath}/store/BottomItems'
	const opt = {
			method: 'GET',
	}
	fetch(url, opt).then(resp => resp.json())
	.then(arr =>{
		for(let i = 0; i < arr.length; i++){
			const dto = arr[i]
			const div = createDiv(dto)
			bottomItems.appendChild(div)
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
				div.innerHTML += '<a href="${cpath}/store/storeDetale/?id=' + dto.idx + '"><img src = "' + dto.mainimg + '"></a> '
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