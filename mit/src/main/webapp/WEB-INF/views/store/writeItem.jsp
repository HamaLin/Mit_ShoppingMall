<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	.store {
		padding: 100px 50px;
	}
	#test2 {
		border: 1px solid black; 
	}
	#categoryDiv {
		display: flex;
		background-color: yellow;
		width: 40%;
	}
	.categoryDivTag{
		width: 100px;
		background-color: gray;
	}
</style>



<div class="store">
        <fieldset>
        <form id="writeItem">
        	<h2>상품명</h2>
        	<hr>
            <p><input type="text" name="pdtitle" placeholder="상품명 제목 입력(ㅁㅁㅁ  + ㅁㅁㅁ)" ></p>
            <p><input type="text" name="pdname" placeholder="제품 이름 입력 (제품 코드 + 고유 명사)" ></p>
            <h2>상품 옵션</h2>
        	<hr>
            <p><input type="number" name="pdprice" placeholder="상품 가격" >
            <input type="number" name="pdcount" placeholder="상품 재고" ><p>
            <p><input type="text" name="pdcolor" placeholder="색깔" ></p>
            <p><div id="categoryDiv" onclick="addcategory(this)">1
            </div></p>
            <p><input type="text" name="pdcode" style="display: none;" id="category" placeholder="카테고리" ></p>
            
            <h2>상품 상세 정보</h2>
        	<hr>
        	<div id="filelist">
	            <p><input type="file" id="test" name="files" accept="image/*" onchange="getchanged(this)" multiple></p>
        	</div>
            <div id="borderbox" style="display:flex border: 1px solid red; height: 500px; overflow: scroll; align-content:center; justify-content: center;">
    <!-- 			<div style="border: 1px solid blue;" id="showBox"></div> -->
                <div id="showBox" style="width:90%; height:auto; border:1px solid blue;"></div>
                <div id="writeBox" onkeydown="getenter()" contenteditable="true" style="height:40px;"></div>
            </div>
            
            <p><textarea name="pdcontent" id="content" style="display: none;"></textarea></p>
            <input type="submit" value="등록">
        </form>
        
        </fieldset>
        <hr>
        <div id="ShowImg"></div>
    </div>
    <br>
    <p contenteditable="true"></p>
    <div id="result"></div>
    
    <script>
        const writeItem = document.getElementById('writeItem')
        const content = document.getElementById('content')
        const writebox = document.getElementById('writeBox')
        const showbox = document.getElementById('showBox')
        const test = document.getElementById('test')
        const borderbox = document.getElementById('borderbox')
        const result = document.getElementById('result')
        const filelist = document.getElementById('filelist')
        const categoryDiv = document.getElementById('categoryDiv')
        const category = document.getElementById('category')
        
        function getinfodto() {
        	var link = document.location.search
        	var params = new URLSearchParams(link)
        	var idx = params.get('id')
        	if(idx != null){
        		
        		const url = '${cpath}/store/getinfo/'+idx
        		const opt = {
        				method: 'GET'
        		}
        		fetch(url, opt).then(resp => resp.json())
        		.then(json => {
        			writeItem.pdtitle.value = json.pdtitle
        			writeItem.pdname.value = json.pdname
        			writeItem.pdprice.value = json.pdprice
        			writeItem.pdcount.value = json.pdcount
        			writeItem.pdcolor.value = json.pdcolor
        			writeItem.pdcode.value = json.pdcode
        			
        			const input = document.createElement('input')
        			input.type = 'hidden'
        			input.name = 'idx'
        			input.value = idx
        			writeItem.appendChild(input)
//         			writeItem.innerHTML = '<input type="hidden" name="idx" value="' + idx + '">'
        			
        			var msg = json.pdcontent
        			var idx2 = 0
        			while(msg.length > 0){
        				
        				if(msg.indexOf('<img src="">') == 0) {
        					var div = document.createElement('div')
        					var img = document.createElement('img')
        					img.src = '${cpath}/image/' + json.pdcolor + '/' + json.filename[idx2]
        					div.id = Math.random()
        					div.setAttribute('onclick', 'getthisfocus(this)')
                        	div.setAttribute('onkeydown', 'getthiskeys(this)')
                        	div.setAttribute('contenteditable', 'true')
                        	div.style.cursor = 'pointer'
                        	div.style.color = 'white'
                        	div.appendChild(img)
        					showbox.appendChild(img)
        					msg = msg.substr(msg.indexOf('<img src="">')+12)
        					idx2 += 1
                        }
        				
						if(msg.indexOf('</p>') >= 0) {
        					
        					var p = document.createElement('p')
        	                p.id = Math.random()
        	                p.setAttribute('contenteditable', 'true')
        	                p.setAttribute('onkeydown', 'penter(this)')
        	                p.innerText = msg.substr(0+3, msg.indexOf('</p>')-3)
        	                showbox.appendChild(p)
                            msg = msg.substr(msg.indexOf('</p>')+4)
                        }
        			}
        			
        		})
        			writeItem.id = 'modifyItem'
        	}
        }
        
		window.onload = getinfodto()
//         borderbox.onclick = function() {
//             writebox.focus()
//         }
        
        function getchanged(event){
        	
        	var input = document.createElement('input')
        	input.type = 'file'
        	input.setAttribute('multiple', 'multiple')
        	input.setAttribute('onchange', 'getchanged(this)')
        	input.accept = 'image/*'
        	input.name = 'files'
        	filelist.appendChild(input)
        	
        	event.style.display = 'none'
        	
            if(event.files && event.files[0]){
                var fileArray = Array.from(event.files)
                
                fileArray.forEach(e => {
                    var reader = new FileReader()
                    reader.readAsDataURL(e)
                    reader.onload = function(e2) {
                        var div = document.createElement('div')
                        var img = document.createElement('img')
                        img.src = e2.target.result
                        img.style.width = 'auto'
                        img.style.height = 'auto'
                        div.id = Math.random()
                        div.setAttribute('onclick', 'getthisfocus(this)')
                        div.setAttribute('onkeydown', 'getthiskeys(this)')
                        div.setAttribute('contenteditable', 'true')
                        div.style.cursor = 'pointer'
                        div.style.color = 'white'
                        div.appendChild(img)
                        showbox.appendChild(div)
                    }
                })
            }
        }

        function getthiskeys(e) {
            if(event.keyCode == 46){
                for(let i = 0; i < showbox.childElementCount; i++){
                    if(showbox.children[i].id === e.id){
                        showbox.children[i].remove(e.id)
                    }
                }
            }
            else if(event.keyCode == 13) {
                event.preventDefault()
                const p = document.createElement('p')
                p.id = Math.random()
                p.setAttribute('contenteditable', 'true')
                p.setAttribute('onkeydown', 'penter(this)')
                for(let i = 0; i < showbox.childElementCount; i++){
                    if(showbox.children[i].id === e.id){
                        showbox.insertBefore(p,showbox.children[i+1])
                        showbox.children[i+1].focus()
                    }
                }
            }
            else{
                event.preventDefault()
            }
        }

        function addcategory(e) {
        	console.log(categoryDiv.children[0] == null)
        	if(categoryDiv.children[0] == null){
        		var div = document.createElement('div')
        		div.setAttribute('contenteditable', 'true')
        		div.setAttribute('onkeydown', 'addcategoryEnter(this)')
        		div.className = 'categoryDivTag'
        		categoryDiv.appendChild(div)
        	}
        }
        
        function addcategoryEnter(e) {
        	if(event.keyCode == 13){
        		event.preventDefault()
        		var div = document.createElement('div')
        		div.setAttribute('contenteditable', 'true')
        		div.setAttribute('onkeydown', 'addcategoryEnter(this)')
        		div.className = 'categoryDivTag'
        		categoryDiv.appendChild(div)
            }
        }
        
        function getthisfocus(e) {
            for(let i = 0; i < showbox.childElementCount; i++){
                    if(showbox.children[i].id === e.id){
                        console.log(showbox.children[i].id)
                        // showbox.children[i].focus()
                        showbox.children[i].style.border = '1px solid black'
                    }
                    else{
                        showbox.children[i].style.border = ''
                    }
                }
        }

        function penter(e) {
            if(event.keyCode == 8 && e.textContent === ''){
                for(let i = 0; i < showbox.childElementCount; i++){
                    if(showbox.children[i].id === e.id){
                        showbox.children[i].remove(e.id)
                        showbox.children[i-1].focus()
                    }
                }
            }

            if(event.keyCode == 13){
                event.preventDefault()
                const p = document.createElement('p')
                p.id = Math.random()
                p.setAttribute('contenteditable', 'true')
                p.setAttribute('onkeydown', 'penter(this)')
                for(let i = 0; i < showbox.childElementCount; i++){
                    if(showbox.children[i].id === e.id){
                        showbox.insertBefore(p,showbox.children[i+1])
                        showbox.children[i+1].focus()
                    }
                }
            }
        }
        
        function getenter() {
            if(event.keyCode == 13){
                event.preventDefault()
                const p = document.createElement('p')
                p.id = Math.random()
                p.setAttribute('contenteditable', 'true')
                p.setAttribute('onkeydown', 'penter(this)')
                p.innerText = writebox.textContent
                showbox.appendChild(p)
                writebox.innerHTML = ''
            }
        }
        
        
        writeItem.onsubmit = function(event){
            event.preventDefault()
            createcontent()
            createpdcode()
            const formData = new FormData(event.target)
            
            for(let test of formData.entries()){
                console.log(test)
            }
            
            const url = '${cpath}/store/writeItem'
            const opt = {
                    method: 'POST',
                    body: formData,
            }
            fetch(url, opt).then(resp => resp.text())
            .then(text =>{
                if(text == 1){
                    alert('등록 성공!!')
    				location.replace("${cpath}/store/store")
                }
                else{
                    alert('등록 실패 ㅜㅠ')
                }
            })
        }
        
        modifyItem.onsubmit = function(event){
            event.preventDefault()
            createcontent()
            createpdcode()
            const formData = new FormData(event.target)
            
            const url = '${cpath}/store/modifyItem'
            const opt = {
                    method: 'POST',
                    body: formData,
            }
            fetch(url, opt).then(resp => resp.text())
            .then(text =>{
                if(text == 1){
                	console.log(test)
                    alert('수정 성공!!')
    				location.replace("${cpath}/store/store")
                }
                else{
                    alert('수정 실패 ㅜㅠ')
                }
            })
        }
        
        function createpdcode() {
        	var result = ''
        	for(let i = 0; i < categoryDiv.childElementCount; i++){
        		if(categoryDiv.children[i].nodeName === 'DIV'){
        			result += categoryDiv.children[i].textContent + ','
                }
        	}
        	category.value = result
        }
        
        function createcontent() {
            for(let i = 0; i < showbox.childElementCount; i++){
                if(showbox.children[i].nodeName === 'DIV'){
                    content.innerText = content.textContent + '<img src="">'
                }
                content.innerText = content.textContent + '<p>' + showbox.children[i].textContent + '</p>'
            }
        }
        
        
    </script>


<%@ include file="../footer.jsp" %>