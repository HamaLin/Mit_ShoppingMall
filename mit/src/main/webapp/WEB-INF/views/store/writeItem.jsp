<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
        .store {
            padding: 100px 50px;
        }
        .showwritestore{
            padding: 100px 50px;
            background-color: grey;
        }
        .showwritestore > form >fieldset > div{
            display: flex;
            width: 100%;
            text-align: left;
            background-color: honeydew;
            border-bottom: 1px solid black;
            height: 100px;
            transition-delay: 0.5s;
            transition-duration: 2s;
        }
        #showmethefile{
            border: 1px solid black;
            width: 100%;
            height: 100px;
            display: flex;
        }
        #test2 {
            border: 1px solid black; 
        }
        #categoryDiv {
            display: flex;
            /* background-color: yellow; */
            width: 40%;
        }
        .categoryDivTag{
            width: 100px;
            /* background-color: gray; */
        }

        #nomalsetting{
            display: flow-root;
        }
        .divwrap{
            margin: 80px 45px;
            display: flex;
            /* border: 1px solid black; */
            justify-content: center;
            height: 50px;
            border-bottom: 1px solid black;
        }
        .divwrap > div{
            width: 10%;
            font-size: 18px;
            text-align: center;
            line-height: 40px;
        }
        input{
            width: 90%;
            border: none;
        }
        input:focus {
            outline: none;
        }
        .categoryDivTag:focus {
            outline: 1px solid black;
        }
        p:focus {
            outline: none;
            border-bottom: 1px solid black;
        }
        #selectCheck {
            display: flex;
            padding: 80px 45px;
            text-align: center;
            width: 100%;
        }
        #selectCheck > p{
            width: 100px;
            line-height: 200%;
        }
        .divcheckbox{
            width: 20px;
            height: 20px;
            margin: 25px;
            cursor: pointer;
        }
        #borderbox{
            display:flex; 
            border: 2px solid black; 
            height: 500px; 
            overflow: scroll; 
            align-content:center; 
            justify-content: center;
        }
        #showBox{
            width:90%; 
            height:auto; 
            /* border:1px solid blue; */
        }
        #selectImg{
            width: 200px;
            height: 100px;
            border: 1px solid black;
            cursor: pointer;
        }
    </style>

<div class="store">
        <fieldset>
        <form id="writeItem">
        	<h2>상품 등록</h2>
        	<hr>
            <!-- 히든 무시 -->
            <input type="hidden" name="pdwriter" value="${admin.userid }"> 

            <div class="divwrap">
                <div>상품명</div>
                <input type="text" name="pdtitle" placeholder="상품명 제목 입력(ㅁㅁㅁ  + ㅁㅁㅁ)" >
            </div>

            <div class="divwrap">
                <div>상품 코드</div>
            <input type="text" name="pdname" placeholder="제품 이름 입력 (제품 코드 + 고유 명사)" >
            </div>
            <br><br>
            <h2>상품 옵션</h2>
        	<hr>

            <div class="divwrap">
                <div style="width: 400px;">상품 가격 / 재고</div>
            <input type="number" name="pdprice" placeholder="상품 가격" >
            <input type="number" name="pdcount" placeholder="상품 재고" >
            </div>

            <div id="selectCheck">
                <p>색</p>

                <div class="divcheckbox" onclick="selectcolor(this)" id="red" style="background-color: red;"></div>
                <div class="divcheckbox" onclick="selectcolor(this)" id="blue" style="background-color: blue;"></div>
                <div class="divcheckbox" onclick="selectcolor(this)" id="skyblue" style="background-color: skyblue;"></div>
                <div class="divcheckbox" onclick="selectcolor(this)" id="green" style="background-color: green;"></div>
                <div class="divcheckbox" onclick="selectcolor(this)" id="chocolate" style="background-color: chocolate;"></div>
                <div class="divcheckbox" onclick="selectcolor(this)" id="yellow" style="background-color: yellow;"></div>
                <div class="divcheckbox" onclick="selectcolor(this)" id="silver" style="background-color: silver;"></div>
                <div class="divcheckbox" onclick="selectcolor(this)" id="black" style="background-color: black;"></div>
                <div class="divcheckbox" onclick="selectcolor(this)" id="brown" style="background-color: brown;"></div>
                <div class="divcheckbox" onclick="selectcolor(this)" id="pink" style="background-color: pink;"></div>
                <div class="divcheckbox" onclick="selectcolor(this)" id="darkviolet" style="background-color: darkviolet;"></div>
                <div class="divcheckbox" onclick="selectcolor(this)" id="white" style="background-color: white;"></div>
                <div class="divcheckbox" onclick="selectcolor(this)" id="grey" style="background-color: grey;"></div>
            </div>
            <p><input type="hidden" name="pdcolor" value=""></p>

            <div class="divwrap" style="justify-content: left;">
                <div>카테고리</div>
            <p><div id="categoryDiv">
                <div class="categoryDivTag" contenteditable="true" onkeydown="addcategoryEnter(this)"></div>
            </div></p>
            </div>

            <!-- 히든 무시 -->
            <p><input type="text" name="pdcode" style="display: none;" id="category" placeholder="카테고리" ></p>
            
            <input type="text" name="mainimg" value="">
            
            <h2>상품 상세 정보</h2>
        	<hr>
            <div>
                <div id="selectImg" onclick="selectMainImg(this)">대문 이미지</div>
            </div>
            <div id="filelist">
                <p><input type="file" id="test" name="files" accept="image/*" onchange="getchanged(this)" multiple></p>
        	</div>

            <div id="showmethefile"></div>

            <div id="borderbox">
                <div id="showBox" onchange="getStatus(this)">
                	<p id="conetent1" contenteditable="true" onkeydown="penter(this)"></p>
                </div>
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
        const conetent1 = document.getElementById('conetent1')
        const showmethefile = document.getElementById('showmethefile')
        const divcheckbox = document.getElementsByClassName('divcheckbox')
        const selectImg = document.getElementsByClassName('selectImg')
        
        // 수정버튼을 눌렀을때 각 input에 value넣는 과정
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
        					showbox.appendChild(div)
        					msg = msg.substr(msg.indexOf('<img src="">')+12)
        					idx2 += 1
                        }
						else if(msg.indexOf('</p>') >= 0) {
        					
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

        // 메인 이미지 버튼 클릭시 함수 부여
        function selectMainImg(event) {
            showmethefile.style.border = '3px solid black'
            for(let i = 0; i < divcheckbox.length ; i++){
                showmethefile.children[i].setAttribute('onclick','thisismain(this)')
            }
            
        }

        //이미지 클릭시 메인 이미지 지정해주고 미리보기에서 제거
        function thisismain(event) {
            if(event.childElementCount >1) {
                alert('다중 이미지는 선택하실 수 없습니다.')
                showmethefile.style.border = '1px solid black'
                for(let i = 0; i < showmethefile.childElementCount ; i++){
                    showmethefile.children[i].setAttribute('onclick','')
                }
                return
            }
            showmethefile.style.border = '1px solid black'
            writeItem.mainimg.value = event.id
            for(let i = 0; i < showmethefile.childElementCount ; i++){
            	if(showmethefile.children[i].id === event.id){
                    var checkidx = 0
            		for(let j = 0; j < showbox.childElementCount; j++){
                        if(showbox.children[j].nodeName === 'DIV'){
                            
                            console.log('현제 : ' + checkidx)
            				if(i == checkidx){
            					showbox.children[j].remove()
            				}

                            checkidx += 1

                        }   
            		}
            	}
                showmethefile.children[i].setAttribute('onclick','')
            }
        }

        // 색 선택시 맞는 색에 border and pdcolor에 값 넣어주는것
        function selectcolor(e) {
            
            for(let i = 0; i < divcheckbox.length ; i++){
                if(divcheckbox[i].id === e.id){
                    divcheckbox[i].style.border = '5px solid black'
                    writeItem.pdcolor.value = e.id
                }
                else{
                    divcheckbox[i].style.border = ''
                }
            }
        }
 
        // 수정으로 들어왔는지 확인하기 위해 로드 될때마다 체크
		window.onload = getinfodto()
        
		// 이미지가 바뀔때 마다 이벤트 추가
        function getchanged(event){
        	var input = document.createElement('input')
            var msgid = Math.random()
        	input.type = 'file'
            input.id = msgid
        	input.setAttribute('multiple', 'multiple')
        	input.setAttribute('onchange', 'getchanged(this)')
        	input.accept = 'image/*'
        	input.name = 'files'

        	filelist.appendChild(input)

            for(let i = 0; i < filelist.childElementCount; i++){
                    if(filelist.children[i].id === event.id){
                        filelist.insertBefore(input,filelist.children[i+2])
                    }
            }
            
        	event.style.display = 'none'
        	
            if(event.files && event.files[0]){
                var fileArray = Array.from(event.files)
                
                if(fileArray.length == 1){
                    fileArray.forEach(e => {
                    var reader = new FileReader()
                    reader.readAsDataURL(e)
                    reader.onload = function(e2) {

                        var div = document.createElement('div')
                        var div2 = document.createElement('div')
                        var img = document.createElement('img')
                        var img2 = document.createElement('img')
                        img.src = e2.target.result
                        img2.src = e2.target.result
                        div2.id = event.files[0].name
                        img.style.width = 'auto'
                        img.style.height = 'auto'
                        img2.style.width = '100px'
                        img2.style.height = '100px'
                        div2.appendChild(img2)
                        showmethefile.appendChild(div2)
                        img.id = msgid
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
                else{
                    var div = document.createElement('div')
                    var div2 = document.createElement('div')
                    div2.id = event.files[0].name
                    fileArray.forEach(e => {
                        var reader = new FileReader()
                        reader.readAsDataURL(e)
                        
                        reader.onload = function(e2) {
                        var img = document.createElement('img')
                        var img2 = document.createElement('img')
                        img.src = e2.target.result
                        img2.src = e2.target.result
                        img.style.width = 'auto'
                        img.style.height = 'auto'
                        img2.style.width = '100px'
                        img2.style.height = '100px'
                        img.style.display = 'block'
                        img.id = msgid
                        div.id = Math.random()
                        div.setAttribute('onclick', 'getthisfocus(this)')
                        div.setAttribute('onkeydown', 'getthiskeys(this)')
                        div.setAttribute('contenteditable', 'true')
                        div.style.cursor = 'pointer'
                        div.style.color = 'white'
                        div.appendChild(img)
                        div2.appendChild(img2)
                    }
                })
                showmethefile.appendChild(div2)
                showbox.appendChild(div)
            }
        }
    }
		
        // 미리보기에서 이미지에 특수키 (enter, backspace)가 입력을 받았을때 이벤트 수행
        function getthiskeys(e) {
            if(event.keyCode == 46 || event.keyCode == 8){
                var checkidx = 0

                for(let i = 0; i < showbox.childElementCount; i++){
                    if(showbox.children[i].id === e.id){
                        showmethefile.children[checkidx].remove()

                        for(let j=0; j < filelist.childElementCount; j++){
                            
                            if(filelist.children[j].id === showbox.children[i].children[0].id){
                                filelist.children[j-1].remove(showbox.children[i].children[0].id)
                            }
                        }
                        showbox.children[i].remove(e.id)
                    }

                    if(showbox.children[i].nodeName === 'DIV'){
                        checkidx += 1
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
        
		// 카테고리에서 엔터 눌렀을때 이벤트 발생
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
        
		// 미리보기에서 어디에 focus둘건지 체크하기 위한 함수
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

		// 미리보기에서 글작성후 특수키(enter, backspace)입력을 확인
        function penter(e) {
            if(event.keyCode == 8 && e.textContent === ''){
                for(let i = 0; i < showbox.childElementCount; i++){
                    if(showbox.children[i].id === e.id){
                        showbox.children[i].remove(e.id)
                        showbox.children[i-1].focus()
                    }
                }
            }
            else if(event.keyCode == 13){
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
        
        
		// 엔터누를떄 마다 창 늘어나게
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
        
        // 글작성버튼을 클릭시
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
        
     	// 수정버튼을 클릭시
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
        
     	// 지금까지 작성된 카테고리를 모아서 제출하기 위한 함수
        function createpdcode() {
        	var result = ''
        	for(let i = 0; i < categoryDiv.childElementCount; i++){
        		if(categoryDiv.children[i].nodeName === 'DIV'){
        			result += categoryDiv.children[i].textContent + ','
                }
        	}
        	category.value = result
        }
        
     	// 지금까지 작성된 내용을 모아서 제출하기 위한 함수
        function createcontent() {
            for(let i = 0; i < showbox.childElementCount; i++){
                if(showbox.children[i].nodeName === 'DIV'){
                    if(showbox.children[i].childElementCount == 1){
                        content.innerText = content.textContent + '<img src="">'
                    }
                    else{
                        for(let j = 0; j < showbox.children[i].childElementCount; j++){
                            content.innerText = content.textContent + '<img src="">'
                        }
                    }
                }
                else{
               		content.innerText = content.textContent + '<p>' + showbox.children[i].textContent + '</p>'	
                }
            }
        }
        
        
    </script>


<%@ include file="../footer.jsp" %>