<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
.store {
    justify-content: center;
    display: flex;
	padding: 100px 50px;
}

.showwritestore {
	padding: 100px 50px;
	background-color: grey;
}

fieldset {
    border: 3px solid;
    border-radius: 25px;
	width: 60%;
}

h2 {
	margin-left: 50px;
    margin-top: 30px;
    margin-bottom: 30px;
}
hr {
	border: 2px solid;
	width: 93%;
}

.showwritestore>form>fieldset>div {
	display: flex;
	width: 100%;
	text-align: left;
	background-color: honeydew;
	border-bottom: 1px solid black;
	height: 100px;
	transition-delay: 0.5s;
	transition-duration: 2s;
}

#showmethefile {
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

.categoryDivTag {
	width: 100px;
	/* background-color: gray; */
}

#nomalsetting {
	display: flow-root;
}

.divwrap {
	margin: 80px 45px;
    display: flex;
    justify-content: center;
    height: 50px;
    border-bottom: 1px solid black;
}

.divwrap>div {
	width: 20%;
    font-size: 15px;
    text-align: center;
    line-height: 40px;
    margin-right: 50px;
    margin-left: 50px;
    font-weight: bold;
}

.divwrap > div > label {
	cursor: pointer;
}

/* .divwrap > div > label:hover { */
/* 	background-color: black; */
/* 	color: white;  */
/* } */

input {
	    width: 90%;
    border: none;
    padding-left: 25px;
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
	padding: 40px 45px;
	text-align: center;
	width: 100%;
}

#selectCheck>p {
	  width: 100px;
    line-height: 200%;
    font-size: 17px;
    font-weight: bold;
    border-right: 1px solid silver;
}

.divcheckbox {
	width: 20px;
    height: 20px;
    margin: 10px;
    cursor: pointer;
    margin-top: 25px;
}

#borderbox {
	display: flex;
    border: 2px solid black;
    height: 600px;
    overflow: scroll;
    align-content: center;
    justify-content: center;
    overflow-x: hidden;
}

#showBox {
	width: 90%;
	height: auto;
	text-align: center;
	/* border:1px solid blue; */
}

#selectImg {
	width: 100px;
    height: 40px;
    border: 1px solid black;
    cursor: pointer;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-right: 40px;
}

#selectImg:hover {
	background-color: black;
	color: white; 
}

#priviewImg {
	width: 100px;
    height: 40px;
    border: 1px solid black;
    cursor: pointer;
    display: flex;
    justify-content: center;
    align-items: center;
}

#priviewImg:hover {
	background-color: black;
	color: white; 
}

.buttons {
	display: flex;
	margin-top: 25px;
}

.buttons>input {
	width: 9%;
    font-size: 12px;
    padding: 0;
    margin-right: 20px;
    height: 40px;
    background-color: white;
    border: 1px solid;
    cursor: pointer;
}

.buttons>input:hover {
	background-color: black;
	color: white; 
}

.wrapimgdiv {
	cursor: pointer;
	color: white;
	align-items: center;
	display: flex;
	flex-flow: column;
}
.uploadmerchandice {
	width: 76%;
}
.totalwrap {
	width: 100%;
    display: flex;
    justify-content: center;
}
#writeItem {
	margin-top: 60px;
}
.categorydivclass > input{
	display: none;
}
.writedetaleheader {
	margin-top: 50px;
	display: flex;
}
.submitbtn{
	width: 100%;
    height: 40px;
    background-color: white;
    border: 2px solid;
    font-size: 21px;
    cursor: pointer;
    margin-bottom: 20px;
    margin-top: 10px;
}
.submitbtn:hover{
	background-color: black;
	color: white; 
}
</style>

<div class="store">
	<fieldset>
		<form id="writeItem">
			<h2>?????? ??????</h2>
			<hr>
			<!-- ?????? ?????? -->
			<input type="hidden" name="pdwriter" value="${admin.userid }">

			<div class="totalwrap">
				<div class="uploadmerchandice">
					<div class="divwrap">
						<div>?????????</div>
						<input type="text" name="pdtitle" placeholder="????????? ?????? ??????" required>
					</div>
					<p id ="checkTitleMsg" class="titlemsg hidden" style="text-align: center; color: red;"></p>
					<div class="divwrap">
						<div>?????? ?????????</div>
						<input type="text" name="pdname"
							placeholder="????????? ?????? ?????? (?????? ?????? + ?????? ??????)" required>
					</div>
				</div>
			</div>

			<br>
			<h2>?????? ??????</h2>
			<hr>

			<div class="totalwrap">
				<div class="uploadmerchandice">
					<div class="divwrap">
						<div>?????? ?????? / ??????</div>
						<input type="number" name="pdprice" placeholder="?????? ??????" required>

					</div>

					<div class="divwrap">
						<div>s / ??????</div>
						<input type="number" name="pdscount" placeholder="?????? ?????? " required>
					</div>
					<div class="divwrap">
						<div>m / ??????</div>
						<input type="number" name="pdmcount" placeholder="?????? ??????" required>
					</div>
					<div class="divwrap">
						<div>l / ??????</div>
						<input type="number" name="pdlcount" placeholder="?????? ??????" required>
					</div>
					<div class="divwrap">
						<div>xl / ??????</div>
						<input type="number" name="pdxlcount" placeholder="?????? ??????" required>
					</div>
				</div>
			</div>

			<div id="selectCheck">
				<p>?????? ??????</p>

				<div class="divcheckbox" onclick="selectcolor(this)" id="brown"
					style="background-color: brown;"></div>
				<div class="divcheckbox" onclick="selectcolor(this)" id="red"
					style="background-color: red;"></div>
				<div class="divcheckbox" onclick="selectcolor(this)" id="chocolate"
					style="background-color: chocolate;"></div>
				<div class="divcheckbox" onclick="selectcolor(this)" id="coral"
					style="background-color: coral;"></div>
				<div class="divcheckbox" onclick="selectcolor(this)" id="khaki"
					style="background-color: khaki;"></div>
				<div class="divcheckbox" onclick="selectcolor(this)" id="yellow"
					style="background-color: yellow;"></div>
				<div class="divcheckbox" onclick="selectcolor(this)" id="gold"
					style="background-color: gold;"></div>
				<div class="divcheckbox" onclick="selectcolor(this)" id="aquamarine"
					style="background-color: aquamarine;"></div>
				<div class="divcheckbox" onclick="selectcolor(this)" id="lime"
					style="background-color: lime;"></div>
				<div class="divcheckbox" onclick="selectcolor(this)" id="green"
					style="background-color: green;"></div>
				<div class="divcheckbox" onclick="selectcolor(this)" id="darkgreen"
					style="background-color: darkgreen;"></div>
				<div class="divcheckbox" onclick="selectcolor(this)" id="olive"
					style="background-color: olive;"></div>
				<div class="divcheckbox" onclick="selectcolor(this)" id="violet"
					style="background-color: violet;"></div>
				<div class="divcheckbox" onclick="selectcolor(this)" id="hotpink"
					style="background-color: hotpink;"></div>
				<div class="divcheckbox" onclick="selectcolor(this)" id="darkviolet"
					style="background-color: darkviolet;"></div>
				<div class="divcheckbox" onclick="selectcolor(this)" id="purple"
					style="background-color: purple;"></div>
				<div class="divcheckbox" onclick="selectcolor(this)" id="skyblue"
					style="background-color: skyblue;"></div>
				<div class="divcheckbox" onclick="selectcolor(this)" id="neonblue"
					style="background-color: rgb(28, 172, 255);"></div>
				<div class="divcheckbox" onclick="selectcolor(this)" id="blue"
					style="background-color: blue;"></div>
				<div class="divcheckbox" onclick="selectcolor(this)" id="navy"
					style="background-color: navy;"></div>
				<div class="divcheckbox" onclick="selectcolor(this)" id="white"
					style="background-color: white; border: 1px solid"></div>
				<div class="divcheckbox" onclick="selectcolor(this)" id="grey"
					style="background-color: grey;"></div>
				<div class="divcheckbox" onclick="selectcolor(this)" id="black"
					style="background-color: black;"></div>
				
			</div>
				<input type="hidden" name="pdcolor" value="">

			<div class="divwrap" style="justify-content: left;" id="divwrapid">
				<div>????????????</div>
				<div name="categorydiv" class="categorydivclass">
					<input type="checkbox" name="pdcode" id="top" value="??????"
						onclick="checkOnlyOne(this)"> <label for="top">??????</label>
				</div>
				<div name="categorydiv" class="categorydivclass">
					<input type="checkbox" name="pdcode" id="bottom" value="??????"
						onclick="checkOnlyOne(this)"> <label for="bottom">??????</label>
				</div>
				<div name="categorydiv" class="categorydivclass">
					<input type="checkbox" name="pdcode" id="bag" value="??????"
						onclick="checkOnlyOne(this)"> <label for="bag">??????</label>
				</div>
				<div name="categorydiv" class="categorydivclass">
					<input type="checkbox" name="pdcode" id="glasses" value="??????"
						onclick="checkOnlyOne(this)"> <label for="glasses">??????</label>
				</div>
				<div name="categorydiv" class="categorydivclass">
					<input type="checkbox" name="pdcode" id="hat" value="??????"
						onclick="checkOnlyOne(this)"> <label for="glasses">??????</label>
				</div>
			</div>

			<input type="hidden" name="mainimg" value="">

			<h2>?????? ?????? ??????</h2>
			<hr>

			<div class="totalwrap">
				<div class="uploadmerchandice" style="width: 93%;">
					<div class=writedetaleheader>
						<p>????????? ?????????</p>
						<div style="display: flex; margin-left: 689px;">
							<div id="selectImg" onclick="selectMainImg(this)">?????? ?????????</div>
							<div id="priviewImg" onclick="selectpriviewImg(this)">????????? ??????</div>
						</div>
					</div>
						<div id="showmethefile"></div>



					<div class="buttons">
						<input type="button" class="BOLD" value="B"
							onclick="document.execCommand('bold')" /> <input type="button"
							class="ITALIC" value="Italic"
							onclick="document.execCommand('Italic')" /> <input type="button"
							class="UNDERBAR" value="abc"
							onclick="document.execCommand('Underline')" /> <input
							type="button" class="BAR" value="abc"
							onclick="document.execCommand('StrikeThrough')" /> <input
							type="button" class="aignLeft" value="?????? ??????"
							onclick="document.execCommand('justifyleft')" /> <input
							type="button" class="aignCenter" value="????????? ??????"
							onclick="document.execCommand('justifycenter')" /> <input
							type="button" class="aignRight" value="????????? ??????"
							onclick="document.execCommand('justifyright')" />
						<div id="filelist">
							<p>
								<input type="file" id="test" name="files" accept="image/*"
									onchange="getchanged(this)" multiple>
							</p>
						</div>
					</div>

					<div id="borderbox">
						<div id="showBox" onchange="getStatus(this)">
							<p id="conetent1" contenteditable="true" onkeydown="penter(this)"></p>
						</div>
					</div>

					<p>
						<textarea name="pdcontent" id="content" style="display: none;"></textarea>
					</p>
					<input type="submit" class="submitbtn" value="??????"></form>
</div>
</div>
</fieldset>
</div>
    
    <script>
        const writeItem = document.getElementById('writeItem')
        const content = document.getElementById('content')
        const writebox = document.getElementById('writeBox')
        const showbox = document.getElementById('showBox')
        const test = document.getElementById('test')
        const emphasisdiv = document.getElementById('emphasisdiv')
        const borderbox = document.getElementById('borderbox')
        const filelist = document.getElementById('filelist')
        const showmethefile = document.getElementById('showmethefile')
        const divcheckbox = document.getElementsByClassName('divcheckbox')
        
        const pdtitle = document.querySelector('input[name="pdtitle"]')
        const checkTitleMsg = document.getElementById('checkTitleMsg')
        const titlemsg = document.querySelector('.titlemsg')
        
        // ??????????????? ???????????? ??? input??? value?????? ??????
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
        			
        			writeItem.pdscount.value = json.pdscount
        			writeItem.pdmcount.value = json.pdmcount
        			writeItem.pdlcount.value = json.pdlcount
        			writeItem.pdxlcount.value = json.pdxlcount
        			
        			writeItem.pdcolor.value = json.pdcolor
        			
        			const input = document.createElement('input')
        			input.type = 'hidden'
        			input.name = 'idx'
        			input.value = idx
        			writeItem.appendChild(input)
        			
        			var msg = json.pdcontent
        			var idx2 = 0
        			while(msg.length > 0){
        				if(msg.indexOf('<img src="">') == 0) {
        					var div = document.createElement('div')
        					var img = document.createElement('img')
        					img.src = json.filename[idx2]
        					div.id = Math.random()
        					div.setAttribute('onclick', 'getthisfocus(this)')
                        	div.setAttribute('onkeydown', 'getthiskeys(this)')
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
        			divwrapid.remove()
        			writeItem.id = 'modifyItem'
        	}
        }
        // ????????? ????????? ??????
        function selectpriviewImg(e) {
            if(borderbox.style.border == '5px solid black'){

                borderbox.style.border = '1px solid black'

                for(let i = 0; i < divcheckbox.length ; i++){
                if(showbox.children[i].nodeName == 'DIV'){
                    showbox.children[i].setAttribute('onclick','')
                }
            }
            }
            
            window.scrollTo({top:borderbox.offsetTop-100, behavior:'smooth'})
            
            borderbox.style.border = '5px solid black'
            for(let i = 0; i < divcheckbox.length ; i++){
                if(showbox.children[i].nodeName == 'DIV'){
                    showbox.children[i].setAttribute('onclick','thisispriview(this)')
                }
            }
        }

        // ?????? ????????? ?????? ????????? ?????? ??????
        function selectMainImg(event) {
        	
        	if(showmethefile.style.border == '5px solid black'){

        		showmethefile.style.border = '1px solid black'

                for(let i = 0; i < showmethefile.childElementCount ; i++){
                	showmethefile.children[i].setAttribute('onclick','')
           		}
        		return
        	}
        	
        	window.scrollTo({top:showmethefile.offsetTop - 200, behavior:'smooth'})
        	showmethefile.style.zIndex = 5
        	
            showmethefile.style.border = '5px solid black'
            for(let i = 0; i < showmethefile.childElementCount ; i++){
                showmethefile.children[i].setAttribute('onclick','thisismain(this)')
            }
            
        }

        // ?????? ????????? ????????? ?????????
        function thisismain(event){
            writeItem.mainimg.value = event.id
            showmethefile.style.border = '1px solid black'
            for(let i = 0; i < showmethefile.childElementCount ; i++){
            	if(showmethefile.children[i].id === event.id){
                    showmethefile.children[i].style.border = '5px solid red'
            	}
                else{
                    showmethefile.children[i].style.border = ''
                }
                showmethefile.children[i].setAttribute('onclick','')
            }
        }

        //????????? ????????? ????????? ????????? ??????
        function thisispriview(event) {
            if(event.childElementCount >1) {
                alert('?????? ???????????? ???????????? ??? ????????????.')
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

        // ???????????? ?????? ????????? ??????
        function checkOnlyOne(element) {
  
        const checkboxes = document.getElementsByName("pdcode");
        const categorydiv = document.getElementsByName("categorydiv");
  
        checkboxes.forEach((cb) => {
	            cb.checked = false;
        })
        
        
        for(let i = 0; i < checkboxes.length ; i++){
        	if(categorydiv[i].children[0].id == element.id){
        		categorydiv[i].style.border = '1px solid black'
        		categorydiv[i].style.backgroundColor = 'grey'
        	}
        	else{
        		categorydiv[i].style.border = ''
        		categorydiv[i].style.backgroundColor = 'white'
        	}
        }
        
        console.log(writeItem.pdcode.value)
        element.checked = true;
        }



        // ??? ????????? ?????? ?????? border and pdcolor??? ??? ???????????????
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
 
        // ???????????? ??????????????? ???????????? ?????? ?????? ???????????? ??????
		window.onload = getinfodto()
		
		pdtitle.oninput = function() {
			console.log(pdtitle.value)
			
			titlemsg.classList.remove('hidden')
			var url = '${cpath}/store/checktitle/'+pdtitle.value
			var opt = {
					method: 'GET'
			}
			fetch(url, opt).then(resp => resp.text())
			.then(text => {
				if(text == 1){
					titlemsg.classList.remove('true')
					titlemsg.classList.add('false')
					checkTitleMsg.innerText = ''
					checkTitleMsg.innerText = '?????? ???????????? ???????????????.'
				}
				else{
					titlemsg.classList.remove('true')
					titlemsg.classList.add('false')
					checkTitleMsg.innerText = ''
				}
			})
        }
        
		// ???????????? ????????? ?????? ????????? ??????
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
                        div.className = 'wrapimgdiv'
                        var img = document.createElement('img')
                        img.src = e2.target.result
                        img.style.width = 'auto'
                        img.style.height = 'auto'
                        img.id = event.files[0].name
                        div.id = msgid
                        div.setAttribute('onkeydown', 'getthiskeys(this)')
                        div.setAttribute('contenteditable', 'true')
                        div.appendChild(img)
                        showbox.appendChild(div)
                        }
                    })
                }
                else{
                    var div = document.createElement('div')
                    div.className = 'wrapimgdiv'
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
                        div.appendChild(img)
                    }
                })
                showbox.appendChild(div)
            }
        }
    }
		
        // ?????????????????? ???????????? ????????? (enter, backspace)??? ????????? ???????????? ????????? ??????
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

		// ?????????????????? ???????????? ?????????(enter, backspace)????????? ??????
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
        
        
		// ??????????????? ?????? ??? ????????????
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
        
        // ?????????????????? ?????????
        writeItem.onsubmit = function(event){
            event.preventDefault()
            
            if(writeItem.pdcolor.value == ''){
            	alert('?????? ??????????????????!')
            	return
            }
            
            const formDataTest = new FormData(event.target)
            
            var flag = true
            for(let test of formDataTest.entries()){
            	if(test[0] == 'pdcode'){
            		flag = false
            	}
            	else if(test[0] == 'mainimg' && test[1] == ''){
            		alert('?????????????????? ??????????????????!')
            		return
            	}
            }
            
            if(flag){
            	alert('??????????????? ??????????????????!')
        		return
            }
            
            createcontent()
            createviewimglist()
            const formData = new FormData(event.target)
            
            const url = '${cpath}/store/writeItem'
            const opt = {
                    method: 'POST',
                    body: formData,
            }
            fetch(url, opt).then(resp => resp.text())
            .then(text =>{
                if(text == 1){
                    alert('?????? ??????!!')
    				location.replace("${cpath}/store/store")
                }
                else{
                    alert('?????? ?????? ??????')
                }
            })
        }
        
     	// ??????????????? ?????????
        modifyItem.onsubmit = function(event){
            event.preventDefault()
            
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
                    alert('?????? ??????!!')
    				location.replace("${cpath}/store/store")
                }
                else{
                    alert('?????? ?????? ??????')
                }
            })
        }
     	
     	function createviewimglist() {
     		if(showmethefile.childElementCount == 0){
     			var input = document.createElement('input')
                input.type = 'text'
                input.name = 'viewimglist'
               	writeItem.appendChild(input)
                return
     		}
     		for(let i = 0; i < showmethefile.childElementCount; i++){
                 var input = document.createElement('input')
                 input.type = 'text'
                 input.name = 'viewimglist'
                 input.value = showmethefile.children[i].id
                writeItem.appendChild(input)
     		}
     	}
        
     	// ???????????? ????????? ????????? ????????? ???????????? ?????? ??????
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