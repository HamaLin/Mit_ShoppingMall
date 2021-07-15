<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.userInfo {
		width: 350px;
		height: 800px;
		padding-left: 100px;
		margin: 150px auto;
	}
	.userInfo input[type="text"], input[type="password"]{
	    width: 270px;
	    height: 40px;
	    border: 1px solid rgb(65, 65, 65);
	    padding-left: 15px;
	}
	.userInfo button{
		cursor: pointer;
		border: 1px solid rgb(65, 65, 65);
		width: 289px;
	    height: 44px;
	}
	.modify {
		background-color: white;
	}
	.return {
		background-color: #e9e9e9;
	}
	.userImg {
		border-radius: 50%;
		border: 3px solid black;
		width: 100px;
		height: 100px;
		overflow: hidden;
	}
</style>
</head>
<body>

<div class="userInfo">
	<form id="userInfo">
		<img src="${cpath}/image/${login.userimg} " class="userImg" >
		<p><input type="file" name="img" accept="image/*" multiple></p>
		<p><input type="hidden" name="userimg" value="${login.userimg }"></p>
		<p><input type="hidden" name="userid" value="${login.userid }"></p>
		<p><input type="text" name="usernick" value="${login.usernick }" placeholder="닉네임"></p>
		<p><input type="text" name="usermail" value="${login.usermail }" placeholder="이메일"></p>
		<p><input type="text" name="userphone" value="${login.userphone }" placeholder="연락처( -제외 숫자만 입력 )"></p>
		<p><input type="text" name="useraddress" value="${login.useraddress }" placeholder="주소"></p>
		<p><input class="gender" type="text" name="usergender" placeholder="성별" readonly></p>
		<p><button class="modify" type="submit">정보수정</button></p>
		<p><button class="return" type="button" onclick="redirect();">돌아가기</button></p>
	</form>

</div>

<!-- 로그인 상태가 아니면 로그인페이지로 보내기 -->
<c:if test="${empty login }">
	<script>
		location.replace("${cpath}/user/login")
	</script>
</c:if>

<!-- 성별 선택 -->
<c:if test="${login.usergender == '남' }">
	<script>
		const gender = document.querySelector('.gender')
		gender.value = '남성'
	</script>
</c:if>

<c:if test="${login.usergender == '여' }">
	<script>
		const gender = document.querySelector('.gender')
		gender.value = '여성'
	</script>
</c:if>

<script>
	const userInfo = document.getElementById('userInfo')
	
	userInfo.onsubmit = function(event){
		event.preventDefault()
		const formData = new FormData(event.target)
		
		const url = '${cpath}/user/userInfo'
		const opt = {
				method: 'POST',
				body: formData,
		}
		fetch(url, opt).then(resp => resp.text())
		.then(text =>{
			if(text == 1){
				alert('정상적으로 처리되었습니다.')
				alert('다시 로그인해주세요.')
				location.replace("${cpath}/user/login")
			}
			else{
				alert('다시 시도해주세요.')
			}
		})
	}
</script>

<!-- 돌아가기 버튼 -->
<script>
	const redirect = function() {
		location.replace("${cpath}/user/mypage")
	}
</script>

<%@ include file="../footer.jsp" %>