<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.passwordFind {
		width: 300px;
		height: 400px;
		margin: 150px auto;
	}
	.inform {
		width: 280px;
	    height: 80px;
	}
	.passwordFind input[type="text"], input[type="email"]  {
	    width: 250px;
	    height: 40px;
	    border: 1px solid rgb(65, 65, 65);
	    padding-left: 15px;
	}
	.passwordFind input[type="submit"], button {
		cursor: pointer;
		border: 1px solid rgb(65, 65, 65);
		width: 269px;
	    height: 44px;
	}
	.passwordFind input[type="submit"]:hover, button:hover {
		color: grey;
	} 
	.passwordFind input[type="submit"] {
		background-color: white;
	}
	button {
		background-color: #e9e9e9;
	}
	
</style>
</head>
<body>


<div class="passwordFind">
	<div class="inform">
		<h2>비밀번호 찾기</h2>
		아이디와 이메일을 입력해주세요.
	</div>
	<form id="passwordFind">
		<p><input type="text" name="userid" placeholder="아이디"></p>
		<p><input type="email" name="usermail" placeholder="이메일"></p>
		<p><input type="submit" value="임시 비밀번호 받기"></p>
		<p><button class="return" type="button" onclick="redirect();">돌아가기</button></p>
	</form>
</div>

<script>
	const passwordFind = document.getElementById('passwordFind')
	const userid = document.querySelector('input[name="userid"]')
	const usermail = document.querySelector('input[name="usermail"]')
	
	passwordFind.onsubmit = function(event){
		// 아이디,이메일 입력안하면?
		if(userid.value == "") {
			alert("아이디를 입력하세요.");
			userid.focus();
			return false;
		}
		if(usermail.value == "") {
			alert("이메일을 입력하세요.");
			usermail.focus();
			return false;
		}
		
		event.preventDefault()
		const formData = new FormData(event.target)
		
		const url = '${cpath}/user/passwordFind'
		const opt = {
				method: 'POST',
				body: formData,
		}
		fetch(url, opt).then(resp => resp.text())
		.then(text =>{
			
			if(text == 1){	// 회원 정보가 있으면 임시 비밀 번호 발급
				const url = '${cpath}/mailto/' + usermail.value + '/' + userid.value + '/'
				const opt = {
					method: 'GET'
				}
				fetch(url, opt).then(resp => resp.text())
				.then(text => {
					if(text.length == 128) {	// 이메일 전송 성공
						alert('이메일로 임시 비밀번호가 발급되었습니다.')
						location.replace("${cpath}/user/login")
					}
					else {	// 이메일 전송 실패						
						alert('다시 시도해주세요.')
						userid.value = ''
						usermail.value = ''
					}
				})
			}
			else{
				alert('입력하신 정보와 일치하는 회원이 없습니다.')
				userid.value = ''
				usermail.value = ''
			}
		})
	}
</script>

<!-- 돌아가기 버튼 -->
<script>
	const redirect = function() {
		history.back()
	}
</script>


<%@ include file="../footer.jsp" %>