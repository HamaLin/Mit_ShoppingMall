<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
	.content:hover{
		cursor: pointer;
		background-color: silver;
	}
	.store {
		margin: 150px;
		padding: 0px 50px;
		display: flex;
		width: 100%;
		height: auto;
	}
	#getItems{
		width: 1250px;
		display: flex;
		height: auto;
	}
	#getItems > .content{
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
	.root {
     	width: 100%;
        margin: 0;
        padding: 0;
        padding-top: 100px;
	}
	.category-ul, .category-li, .category-nav {
         margin: 0;
         padding: 0;
	}
    .category-nav {
    	display: flex;
        justify-content: space-between;
        width: 80%;
        height: 25px;
        margin: 30px auto;
	}
    .category-ul {
    	
    	display: flex;
        list-style: none;
        justify-content: space-between;
	}
    .category-nav > .category-ul:nth-child(1) {
    	width: 100%;
	}
    .category-nav > .category-ul > .color-title {
    	font-size: 15px;
        font-weight: bold;
	}
        
    .category-ul > li > a {
    	text-decoration: none;
	    color: grey;
    }
    .category-li > a:hover {
    	color: black;
	}

    .category-nav > .category-ul > .price-title {
    	font-size: 15px;
        font-weight: bold;
	}
    
</style>

	<div class="root">
            <nav class="category-nav">
	            <ul class="category-ul">
	                <div class="color-title">색상</div>
	                <li id="brown" onClick="color_click(this.id)" style="background-color: brown;"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	                <li id="red" onClick="color_click(this.id)" style="background-color: red;"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	                <li id="chocolate" onClick="color_click(this.id)" style="background-color: chocolate;"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	                <li id="coral" onClick="color_click(this.id)" style="background-color: coral;"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	                <li id="khaki" onClick="color_click(this.id)" style="background-color: khaki;"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	                <li id="yellow" onClick="color_click(this.id)" style="background-color: yellow;"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	                <li id="gold" onClick="color_click(this.id)" style="background-color: gold;"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	                <li id="aquamarine" onClick="color_click(this.id)" style="background-color: aquamarine;"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	                <li id="lime" onClick="color_click(this.id)" style="background-color: lime;"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	                <li id="green" onClick="color_click(this.id)" style="background-color: green;"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	                <li id="darkgreen" onClick="color_click(this.id)" style="background-color: darkgreen;"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	                <li id="olive" onClick="color_click(this.id)" style="background-color: olive;"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	                <li id="violet" onClick="color_click(this.id)" style="background-color: violet;"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	                <li id="hotpink" onClick="color_click(this.id)" style="background-color: hotpink;"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	                <li id="darkviolet" onClick="color_click(this.id)" style="background-color: darkviolet;"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	                <li id="purple" onClick="color_click(this.id)" style="background-color: purple;"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	                <li id="skyblue" onClick="color_click(this.id)" style="background-color: skyblue;"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	                <li id="neonblue" onClick="color_click(this.id)" style="background-color: rgb(28, 172, 255);"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	                <li id="blue" onClick="color_click(this.id)" style="background-color: blue;"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	                <li id="navy" onClick="color_click(this.id)" style="background-color: navy;"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	                <li id="white" onClick="color_click(this.id)" style="background-color: rgb(248, 248, 248);"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	                <li id="grey" onClick="color_click(this.id)" style="background-color: grey;"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	                <li id="black" onClick="color_click(this.id)" style="background-color: black;"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
	            </ul>
	        </nav>
	
	        <nav class="category-nav">
	            <ul class="category-ul">
	                <div class="price-title">가격</div>
	                <li id="0" onClick="price_click(this.id)" class="category-li"><a href="">~ 20,000원</a></li>|
	                <li id="20000" onClick="price_click(this.id)" class="category-li"><a href="">20,000원 ~ 40,000원</a></li>|
	                <li id="40000" onClick="price_click(this.id)" class="category-li"><a href="">40,000원 ~ 60,000원</a></li>|
	                <li id="60000" onClick="price_click(this.id)" class="category-li"><a href="">60,000원 ~ 80,000원</a></li>|
	                
	            </ul>
        	</nav>
        </div>

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
	
	function color_click(clicked_id) {
		event.preventDefault()
        location.href = '${cpath}/store/colorFilter/?filter=' + clicked_id
    }
	
	function price_click(clicked_id) {
		event.preventDefault()
		location.href = '${cpath}/store/priceFilter/?filter=' + clicked_id
	}

	
</script>

<%@ include file="../footer.jsp"%>