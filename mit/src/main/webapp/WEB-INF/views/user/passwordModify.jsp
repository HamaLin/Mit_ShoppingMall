<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.passwordModify {
		width: 300px;
		height: 400px;
		margin: 150px auto;
	}
	.inform {
		width: 280px;
	    height: 80px;
	}
	.passwordModify input[type="password"]  {
	    width: 250px;
	    height: 40px;
	    border: 1px solid rgb(65, 65, 65);
	    padding-left: 15px;
	}
	.passwordModify input[type="submit"], button {
		cursor: pointer;
		border: 1px solid rgb(65, 65, 65);
		width: 269px;
	    height: 44px;
	}
	.passwordModify input[type="submit"]:hover, button:hover {
		color: grey;
	} 
	.passwordModify input[type="submit"] {
		background-color: white;
	}
	button {
		background-color: #e9e9e9;
	}
	
</style>
</head>
<body>

<!-- 로그인 상태가 아니면 로그인페이지로 보내기 -->
<c:if test="${empty login }">
	<script>
		location.replace("${cpath}/user/login")
	</script>
</c:if>

<div class="passwordModify">
	<div class="inform">
		<h2>비밀번호 변경하기</h2>
		현재 비밀번호를 입력해주세요.
	</div>
	<form id="passwordModify">
		<p><input type="password" name="password" placeholder="비밀번호"></p>
		<p><input type="hidden" name="userid" value="${login.userid }"></p>
		<p><input type="hidden" name="userpw" value="${login.userpw }"></p>
		<p><input type="submit" value="변경하기"></p>
		<p><button class="return" type="button" onclick="redirect();">돌아가기</button></p>
	</form>
</div>

<script>
	const passwordModify = document.getElementById('passwordModify')
	const password = document.querySelector('input[name="password"]')
	
	passwordModify.onsubmit = function(event){
		// 비밀번호를 입력안하면?
		if(password.value == "") {
			alert("비밀번호를 입력하세요.");
			password.focus();
			return false;
		}
		
		event.preventDefault()
		const formData = new FormData(event.target)
		
		const url = '${cpath}/user/passwordModify'
		const opt = {
				method: 'POST',
				body: formData,
		}
		fetch(url, opt).then(resp => resp.text())
		.then(text =>{
			if(text == 1){
				location.replace("${cpath}/user/passwordModifyResult")
			}
			else{
				alert('다시 시도해주세요.')
				password.value = ''
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