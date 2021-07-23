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
           	text-align: center;
            /* border:1px solid blue; */
        }
        #selectImg{
            width: 200px;
            height: 100px;
            border: 1px solid black;
            cursor: pointer;
        }
        .buttons{
            display: flex;
        }
        .buttons > input{
            width: 5%;
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

            </div>

            <div class="divwrap">
                <div style="width: 400px;">s / 재고</div>
            <input type="number" name="pdscount" placeholder="재고 수량" >
            </div>
            <div class="divwrap">
                <div style="width: 400px;">m / 재고</div>
            <input type="number" name="pdmcount" placeholder="재고 수량" >
            </div>
            <div class="divwrap">
                <div style="width: 400px;">l / 재고</div>
            <input type="number" name="pdlcount" placeholder="재고 수량" >
            </div>
            <div class="divwrap">
                <div style="width: 400px;">xl / 재고</div>
            <input type="number" name="pdxlcount" placeholder="재고 수량" >
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
                <div>
                    <input type="checkbox" name="pdcode" id="top" value="상의" onclick="checkOnlyOne(this)">
                    <label for="top">상의</label>
                </div>
                <div>
                    <input type="checkbox" name="pdcode" id="bottom" value="하의" onclick="checkOnlyOne(this)">
                    <label for="bottom">하의</label>
                </div>
                <div>
                    <input type="checkbox" name="pdcode" id="bag" value="가방" onclick="checkOnlyOne(this)">
                    <label for="bag">가방</label>
                </div>
                <div>
                    <input type="checkbox" name="pdcode" id="glasses" value="안경" onclick="checkOnlyOne(this)">
                    <label for="glasses">안경</label>
                </div>
            </div>
            
            <input type="hidden" name="mainimg" value="">
            
            <h2>상품 상세 정보</h2>
        	<hr>
            <div>
                <div id="selectImg" onclick="selectMainImg(this)">대문 이미지</div>
                <div id="priviewImg" onclick="selectpriviewImg(this)">프리뷰 이미지</div>
                <p>프리뷰 이미지 등록</p>
                <div id="showmethefile"></div>
            </div>
            


			<div class="buttons">
                <input type="button" class="BOLD" value="B" onclick="document.execCommand('bold')" />
                <input type="button" class="ITALIC" value="Italic" onclick="document.execCommand('Italic')" />
                <input type="button" class="UNDERBAR" value="abc" onclick="document.execCommand('Underline')" />
                <input type="button" class="BAR" value="abc" onclick="document.execCommand('StrikeThrough')" />
                <input type="button" class="aignLeft" value="왼쪽 정렬" onclick="document.execCommand('justifyleft')" />
                <input type="button" class="aignCenter" value="가운데 정렬" onclick="document.execCommand('justifycenter')" />
                <input type="button" class="aignRight" value="오른쪽 정렬" onclick="document.execCommand('justifyright')" />
                <div id="filelist">
                    <p><input type="file" id="test" name="files" accept="image/*" onchange="getchanged(this)" multiple></p>
                </div>
            </div>
            
            <div id="borderbox">
                <div id="showBox" onchange="getStatus(this)">
                	<p id="conetent1" contenteditable="true" onkeydown="penter(this)"></p>
                </div>
            </div>
            
            <p><textarea name="pdcontent" id="content" style="display: none;"></textarea></p>
            <input type="submit" value="등록">
        </form>
        
        </fieldset>
    </div>
    <br>
    
    <script>
        const writeItem = document.getElementById('writeItem')
        const content = document.getElementById('content')
        const writebox = document.getElementById('writeBox')
        const showbox = document.getElementById('showBox')
        const test = document.getElementById('test')
        const borderbox = document.getElementById('borderbox')
        const filelist = document.getElementById('filelist')
        const showmethefile = document.getElementById('showmethefile')
        const divcheckbox = document.getElementsByClassName('divcheckbox')
        // const selectImg = document.getElementsByClassName('selectImg')
        
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
        // 프리뷰 이미지 등록
        function selectpriviewImg(e) {
            if(borderbox.style.border == '5px solid black'){

                borderbox.style.border = '1px solid black'

                for(let i = 0; i < divcheckbox.length ; i++){
                if(showbox.children[i].nodeName == 'DIV'){
                    showbox.children[i].setAttribute('onclick','')
                }
            }
            }
            borderbox.style.border = '5px solid black'
            for(let i = 0; i < divcheckbox.length ; i++){
                if(showbox.children[i].nodeName == 'DIV'){
                    showbox.children[i].setAttribute('onclick','thisispriview(this)')
                }
            }
        }

        // 메인 이미지 버튼 클릭시 함수 부여
        function selectMainImg(event) {
            showmethefile.style.border = '5px solid black'
            for(let i = 0; i < showmethefile.childElementCount ; i++){
                showmethefile.children[i].setAttribute('onclick','thisismain(this)')
            }
            
        }

        // 메인 이미지 클릭시 이벤트
        function thisismain(event){
            writeItem.mainimg.value = event.id
            showmethefile.style.border = '1px solid black'
            for(let i = 0; i < showmethefile.childElementCount ; i++){
            	if(showmethefile.children[i].id === event.id){
                    console.log('a')
                    showmethefile.children[i].style.border = '5px solid red'
            	}
                else{
                    showmethefile.children[i].style.border = ''
                }
                showmethefile.children[i].setAttribute('onclick','')
            }
        }

        //이미지 클릭시 프리뷰 이미지 지정
        function thisispriview(event) {
            if(event.childElementCount >1) {
                alert('다중 이미지는 선택하실 수 없습니다.')
                borderbox.style.border = '1px solid black'
                for(let i = 0; i < showbox.childElementCount ; i++){
                    showbox.children[i].setAttribute('onclick','')
                }
                return
            }

            borderbox.style.border = '1px solid black'
            for(let i = 0; i < showbox.childElementCount ; i++){
            	if(showbox.children[i].id === event.id){
                    var img = document.createElement('img')
                    img.src = event.children[0].src
                    img.id = event.children[0].id
                    showmethefile.appendChild(img)
            	}
                if(showbox.children[i].nodeName == 'DIV'){
                    showbox.children[i].setAttribute('onclick','')
                }
            }
        }

        // 카테고리 버튼 하나만 클릭
        function checkOnlyOne(element) {
  
        const checkboxes = document.getElementsByName("pdcode");
  
        checkboxes.forEach((cb) => {
            cb.checked = false;
        })
  
        element.checked = true;
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
                        var img = document.createElement('img')
                        img.src = e2.target.result
                        img.style.width = 'auto'
                        img.style.height = 'auto'
                        img.id = event.files[0].name
                        div.id = msgid
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
                    fileArray.forEach(e => {
                        var reader = new FileReader()
                        reader.readAsDataURL(e)
                        
                        reader.onload = function(e2) {
                        var img = document.createElement('img')
                        img.src = e2.target.result
                        img.style.width = 'auto'
                        img.style.height = 'auto'
                        img.style.display = 'block'
                        img.id = event.files[0].name
                        div.id = msgid
                        div.setAttribute('onkeydown', 'getthiskeys(this)')
                        div.setAttribute('contenteditable', 'true')
                        div.style.cursor = 'pointer'
                        div.style.color = 'white'
                        div.appendChild(img)
                    }
                })
                showbox.appendChild(div)
            }
        }
    }
		
        // 미리보기에서 이미지에 특수키 (enter, backspace)가 입력을 받았을때 이벤트 수행
        function getthiskeys(e) {
            if(event.keyCode == 46 || event.keyCode == 8){
                for(let i = 0; i < showbox.childElementCount; i++){
                    if(showbox.children[i].id === e.id){
                        for(let j = 0 ; j < showmethefile.childElementCount; j++){
                            if(showmethefile.children[j].id == e.id){
                                showmethefile.children[j].remove()
                            }
                        }
                        for(let j=0; j < filelist.childElementCount; j++){
                            
                            if(filelist.children[j].id === showbox.children[i].id){
                                filelist.children[j-1].remove(showbox.children[i].id)
                            }
                        }
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

		// 미리보기에서 글작성후 특수키(enter, backspace)입력을 확인
        function penter(e) {
			if(showbox.children[0].id === e.id){
				return
			}
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
            createviewimglist()
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
     	
     	function createviewimglist() {
     		for(let i = 0; i < showmethefile.childElementCount; i++){
                 var input = document.createElement('input')
                 input.type = 'text'
                 input.name = 'viewimglist'
                 input.value = showmethefile.children[i].id
                writeItem.appendChild(input)
     		}
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