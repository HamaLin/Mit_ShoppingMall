<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.login {
		width: 300px;
		height: 500px;
		padding-left: 60px;
		margin: 150px auto;
	}
	.login input[type="text"], input[type="password"]  {
	    width: 250px;
	    height: 40px;
	    border: 1px solid rgb(65, 65, 65);
	    padding-left: 15px;
	}
	.login input[type="submit"], button {
		cursor: pointer;
		border: 1px solid rgb(65, 65, 65);
		background-color: white;
		width: 269px;
	    height: 44px;
	}
	button {
		background-color: #e9e9e9;
	}
</style>
</head>
<body>

<div class="login">
	<h2>로그인</h2>
	<form method="POST">
		<p><input type="text" name="userid" placeholder="아이디"></p>
		<p><input type="password" name="userpw" placeholder="비밀번호"></p>
		<p><input type="submit" value="로그인"></p>
	</form>
	<div>
		<p><button><a href="${cpath }/user/join">회원가입</a></button></p>
		<p><button><a href="">비밀번호 찾기</a></button></p>
	</div>
</div>

<c:if test="${not empty login || not empty admin }">
	<script> 
	alert("로그인 되었습니다.")
	location.href = '${cpath}'
	</script>
</c:if>

<c:if test="${loginResult == 0 }">
	<script> 
	alert("다시 시도해주세요.")
	</script>
</c:if>

<%@ include file="../footer.jsp" %>