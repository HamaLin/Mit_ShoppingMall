<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
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
<h1>상품 찾기</h1>

<div class="store">
    <div id="SearchItems"></div>
</div>

<script>
    var params = {};
    const link = document.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, 
        function(str, key, value) { 
        params[key] = value; 
    }
    );

    function get2Showitem() {
	        const url = '${cpath}/store/SearchItems/' + params.search
	        const opt = {
	                method: 'GET'
        }
        fetch(url, opt).then(resp => resp.text())
        .then(text => {

        })
    }

    window.onload = get2Showitem()
	
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
	
	    if(dto.mainimg != null) {
	   		const img = document.createElement('img')
	        img.style.width = '200px'
	        img.style.height = '350px'
	
	        div.innerHTML += '<a href="${cpath}/store/storeDetale/?id=' + dto.idx + '"><img src = ' + 
	        				 '${cpath}/image/'+ dto.pdcode + dto.pdwriter + '/' + dto.mainimg+' "></a> '
	    }
	    else {
	        const img = document.createElement('img')
	        img.style.width = '200px'
	        img.style.height = '350px'
	
	        div.innerHTML += '<a href="${cpath}/store/storeDetale/?id=' + dto.idx + '"><img src = ' + 
	                         '${cpath}/image/Default.jpg "></a> '
	    }
	
	    div.innerHTML += '<br>' + '<a href="${cpath}/store/storeDetale/?id=' + dto.idx + '">' + dto.pdtitle +'</a> ' + 
	    '<br>' + '<br>' +
	    dto.pdprice + '원'
	
	
	    div.className = 'content'
	    return div
	}
	
// 	getItems.onclick = getdivcontent
</script>
    

</body>
</html>