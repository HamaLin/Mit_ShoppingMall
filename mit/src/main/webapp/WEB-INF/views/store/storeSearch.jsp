<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	.content:hover {
	cursor: pointer;
}

.store {
	margin-top: 250px;
    display: flex;
    width: 100%;
    height: 950px;
    position: relative;
    justify-content: center;
}

#SearchItems {
	width: 80%;
    display: flex;
    height: auto;
    flex-wrap: wrap;
}

#SearchItems>.content {
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

<div class="store">
<c:if test="${not empty admin }"> 
	<div class="adminbtn">
	<a href="${cpath}/store/writeItem"><button>상품 등록</button></a>
	</div>
</c:if>
    <div id="SearchItems"></div>
</div>

<script>
    var params = {};
    const link = document.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, 
        function(str, key, value) { 
        params[key] = value; 
    }
    );
	// 객체를 받아서 배열형태로 저장 및 화면에 출력
	function loaditems() {
		console.log(params.search)
		const url = '${cpath}/store/SearchItems/' + params.search
		const opt = {
		        method: 'GET',
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(arr => {
	    for(let i = 0; i < arr.length; i++){
	        const dto = arr[i]
	        const div = createDiv(dto)
	        SearchItems.appendChild(div)
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
    

</body>
</html>