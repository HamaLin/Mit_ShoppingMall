<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.join {
		width: 350px;
		height: 800px;
		padding-left: 100px;
		margin: 150px auto;
	}
	.join input[type="text"], input[type="password"]{
	    width: 270px;
	    height: 40px;
	    border: 1px solid rgb(65, 65, 65);
	    padding-left: 15px;
	}
	.join button{
		cursor: pointer;
		border: 1px solid rgb(65, 65, 65);
		background-color: #e9e9e9;
		width: 289px;
	    height: 44px;
	}
	.policy {
		color: black;
		font-size: 9.7pt;
	}
	.gender {
		padding-left: 12px;
		cursor: pointer;
		border: 1px solid rgb(65, 65, 65);
		background-color: white;
		color: black;
		width: 289px;
	    height: 44px;
	}
	.birth {
		height: 42px;
		width: 94px;
		padding-left: 12px;
		cursor: pointer;
		border: 1px solid rgb(65, 65, 65);
		background-color: white;
		color: black;
	}
	.idmsg, .phonemsg, .passwordmsg {
		width: 270px;
	    font-size: 10pt;
	}
	.passwordmsg  {
		width: 250px;
	}
	.hidden {
		display: none;
	}
	.false {
		color: #DC143C;
	}
	.true{
		color: #4169E1;
	}
</style>
</head>
<body>

<div class="join">
	<h2>회원가입</h2>
	<form method="POST" name="join_form">
		<p><input type="text" name="userid" placeholder="아이디" keypress="checkId()"></p>
		<p id ="checkIdMsg" class="idmsg hidden"></p> <!-- 아이디 중복확인 메시지 -->
		<p><input type="password" name="userpw" placeholder="비밀번호"></p>
		<p id ="checkPasswordMsg" class="passwordmsg hidden"></p> <!-- 비밀번호 유효성 메시지 -->
		<p><input type="text" name="username" placeholder="이름"></p>
		<p><input type="text" name="usermail" placeholder="이메일"></p>
		<p><input type="text" name="userphone" placeholder="연락처( -제외 숫자만 입력 )"></p>
		<p id ="checkPhoneMsg" class="phonemsg hidden"></p> <!-- 연락처 숫자만 입력 체크 메시지 -->
		<p>
			<select class="birth" name="userbirth_1" id="year">
			</select>
			<select class="birth" name="userbirth_2" id="month">
			</select>
			<select class="birth" name="userbirth_3" id="day">
			</select>
		</p>
		<p>
			<select class="gender" name="usergender">
				<option value="">성별</option>
				<option value="남">남성</option>
				<option value="여">여성</option>
			</select>
		</p>
		<div class="policy">
			<label><p><input type="checkbox" class="checkAll" name="check">모두 동의합니다.</p></label>
			<p><input type="checkbox" class="check" name="check"><label><a href="${cpath }/policy">(필수) 이용약관과 개인정보처리방침에 동의합니다.</a></label></p>
			<label><p><input type="checkbox" class="check" name="check">(필수) 만 14세 이상입니다.</p></label>
		</div>
		<p><button type="button" onclick="joinform_check();">회원가입</button></p>
	</form>
</div>

<c:if test="${row == 1 }">
	<script>
		alert("회원가입이 완료되었습니다.")
		location.href = '${cpath}/user/login'
	</script>
</c:if>

<c:if test="${row == 0 }">
	<script>
		alert("다시 시도해주세요.")
	</script>
</c:if>

<script>
// 아이디 유효성 검사
const userid = document.querySelector('input[name="userid"]')
const checkIdMsg = document.getElementById('checkIdMsg')
const idmsg = document.querySelector('.idmsg')
const idcheck = /^[A-Za-z0-9+]*$/; //영문, 숫자만 허용

userid.oninput = function() {
	idmsg.classList.remove('hidden')
	
	// 아이디 중복 체크 AJAX
	const url = '${cpath}/user/checkId/' + userid.value + '/'
	const opt = {
		method: 'GET'
	}	
	fetch(url, opt)						
	.then(function(resp) {				
		return resp.text()
	})
	.then(function(text) {		
		// 중복 검사 통과 못함
		if(text == 1) {	
			// 아이디는 영문 or 숫자만 허용
			if(!idcheck.test(userid.value)) {	
				idmsg.classList.remove('true')
				idmsg.classList.add('false')
				checkIdMsg.innerText = ''
				checkIdMsg.innerText = '아이디는 영문, 숫자 5자~20자로 입력해주세요.'
				return
			}
			// 유저 아이디는 길이 5~20으로 제한
			if(userid.value.length < 5 || userid.value.length > 20){
				idmsg.classList.remove('true')
				idmsg.classList.add('false')
				checkIdMsg.innerText = ''
				checkIdMsg.innerText = '아이디는 영문, 숫자 5자~20자로 입력해주세요.'
				return
			}
			idmsg.classList.remove('true')
			idmsg.classList.add('false')
			checkIdMsg.innerText = ''
			checkIdMsg.innerText = '이미 사용중인 아이디입니다.'
		}else if(text == -1) {
			idmsg.classList.remove('true')
			idmsg.classList.add('false')
			checkIdMsg.innerText = ''
			checkIdMsg.innerText = '아이디를 입력하세요.'
		}
		
		// 중복 검사 통과
		else { 
			// 아이디는 영문 or 숫자만 허용
			if(!idcheck.test(userid.value)) {	
				idmsg.classList.remove('true')
				idmsg.classList.add('false')
				checkIdMsg.innerText = ''
				checkIdMsg.innerText = '아이디는 영문, 숫자 5자~20자로 입력해주세요.'
				return
			}
			// 유저 아이디는 길이 5~20으로 제한
			if(userid.value.length < 5 || userid.value.length > 20){
				idmsg.classList.remove('true')
				idmsg.classList.add('false')
				checkIdMsg.innerText = ''
				checkIdMsg.innerText = '아이디는 영문, 숫자 5자~20자로 입력해주세요.'
				return
			}
			idmsg.classList.add('true')
			idmsg.classList.remove('false')
			checkIdMsg.innerText = ''
			checkIdMsg.innerText = '사용 가능한 아이디입니다.'	
		}
	})
}

</script>

<script>
// 비밀번호 유효성
// 비밀번호 규칙 정규식
// : 숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력
    const password = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{1,50}).{8,50}$/;
    const userpw = document.querySelector('input[name="userpw"]')
    const checkPasswordMsg = document.getElementById('checkPasswordMsg')
	const passwordmsg = document.querySelector('.passwordmsg')
	
	userpw.oninput = function() {
    	if(password.test(userpw.value)) {
    		checkPasswordMsg.innerText = ''
   			passwordmsg.classList.remove('false')
   			passwordmsg.classList.add('hidden')	
    	}else if (userpw.value == '') {
    		checkPasswordMsg.innerText = ''
       		checkPasswordMsg.innerText = '비밀번호를 입력해주세요.'
   			passwordmsg.classList.add('false')
      		passwordmsg.classList.remove('hidden')
    	}
    	else {
    		checkPasswordMsg.innerText = ''
    		checkPasswordMsg.innerText = '비밀번호는 영문, 숫자, 특수문자를  포함하여 8자 이상으로 입력해주세요.'
			passwordmsg.classList.add('false')
   			passwordmsg.classList.remove('hidden')
    	}
    }
</script>

<script>
	//연락처는 숫자만! 
	const userphone = document.querySelector('input[name="userphone"]')
	const checkPhoneMsg = document.getElementById('checkPhoneMsg')
	const phonemsg = document.querySelector('.phonemsg')
	const phone = /^[0-9]*$/; // 숫자만 체크 정규식
	
	userphone.oninput = function() {
		if(phone.test(userphone.value)) {
			checkPhoneMsg.innerText = ''
			phonemsg.classList.remove('false')
			phonemsg.classList.add('hidden')	
		}
		else {
			checkPhoneMsg.innerText = ''
			checkPhoneMsg.innerText = '연락처는 숫자만 입력해주세요.'
			phonemsg.classList.add('false')
			phonemsg.classList.remove('hidden')
		}
	}
</script>

<script>
// 회원가입폼 전체 유효성 검사
function joinform_check(event) {
	const check = document.querySelectorAll('.check')
	const userid = document.querySelector('input[name="userid"]')
	const userpw = document.querySelector('input[name="userpw"]')
	const username = document.querySelector('input[name="username"]')
	const usermail = document.querySelector('input[name="usermail"]')
	const userphone = document.querySelector('input[name="userphone"]')
	const usergender = document.querySelector('select[name="usergender"]')
	
	// 빨간색 메시지 여부 체크용
	const idmsg = document.querySelector('.idmsg')
	const phonemsg = document.querySelector('.phonemsg')
	const passwordmsg = document.querySelector('.passwordmsg')
	
	// 빨간색 메시지 있으면 통과 불가
	if(idmsg.classList.contains("false")) {
		alert("아이디를 다시 입력해주세요.");
		userid.value = ""
		userid.focus();
		return false;
	}
	
	if(userid.value == "") {
		alert("아이디를 입력하세요.");
		userid.focus();
		return false;
	}
	
	// 빨간색 메시지 있으면 통과 불가
	if(passwordmsg.classList.contains("false")) {
		alert("비밀번호를 다시 입력해주세요.");
		userpw.value = ""
		userpw.focus();
		return false;
	}
	
	if(userpw.value == "") {
		alert("비밀번호를 입력하세요.");
		userpw.focus();
		return false;
	}
	if(username.value == "") {
		alert("이름을 입력하세요.");
		username.focus();
		return false;
	}
	
	// 이메일 양식 검사
	// 이메일 양식 정규식
	const email_check = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	
	if(usermail.value == "") {
		alert("이메일을 입력하세요.");
		usermail.focus();
		return false;
	}
	
    if (!email_check.test(usermail.value)) {
        alert("이메일 형식이 올바르지 않습니다");
        usermail.value = "";
        usermail.focus();
        return false;
    }
    
    // 빨간색 메시지 있으면 통과 불가
    if(phonemsg.classList.contains("false")) {
		alert("연락처를 다시 입력해주세요.");
		userphone.value = ""
		userphone.focus();
		return false;
	}
       
	if(userphone.value == "") {
		alert("연락처를 입력하세요.");
		userphone.focus();
		return false;
	}

	if(usergender.value == "") {
		alert("성별을 선택하세요.");
		usergender.focus();
		return false;
	}
	
	for(let i = 0; i < check.length; i++) {
		if(check[i].checked == false) {
			alert("약관에 동의해주세요.");
			return false;
		}
	}
	document.join_form.submit();
}
	
</script>

<script>
//모두 동의 클릭시 전체 선택
const checkAll = document.querySelector('.checkAll')
const check = document.querySelectorAll('.check')

checkAll.onclick = function() {
	if(checkAll.checked == false) {
		for(let i = 0; i < check.length; i++) {
			check[i].checked = false;
		}
	}else {
		for(let i = 0; i < check.length; i++) {
			check[i].checked = true;
		}
	}
}
</script>

<script>
// 생년월일 옵션 넣기
appendYear();
appendMonth();
appendDay();

function appendYear(){
	var date = new Date();
	var year = date.getFullYear();
	var selectValue = document.getElementById("year");
	var optionIndex = 0;

	for(var i=year-100;i<=year;i++){	// 100년전부터 가져오기
		selectValue.add(new Option(i+"년",i),optionIndex++);                        
	}
}

function appendMonth(){
	var selectValue = document.getElementById("month"); 
	var optionIndex = 0;

	for(var i=1;i<=12;i++){
		if(i < 10) {
			selectValue.add(new Option(i+"월","0"+i),optionIndex++);
		}else {
			selectValue.add(new Option(i+"월",i),optionIndex++);
		}
	}
}

function appendDay(){
	var selectValue = document.getElementById("day");
	var optionIndex = 0;
	
	for(var i=1;i<=31;i++){
		if(i < 10) {
			selectValue.add(new Option(i+"일","0"+i),optionIndex++);
		}else {
			selectValue.add(new Option(i+"일",i),optionIndex++);
		}
	}
} 

</script>

<%@ include file="../footer.jsp" %>