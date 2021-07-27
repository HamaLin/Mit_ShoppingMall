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
	    height: 55px;
	    border-radius: 5px;
	}
	.login input[type="submit"]:hover {
		color:grey;
	}
	button {
		background-color: #e9e9e9;
	}
	.loginMenu {
		display: flex;
		justify-content: center;
		width: 200px;
		margin-left: 33px;
	}
	.loginMenu p {
		width: 90px;
		font-size: 14px;
		color: gray;
		text-align: center;
	}
	.loginMenu a:hover {
		color: black;
	}
	.
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
		<!-- 네이버아이디로로그인 버튼 노출 영역 -->
		<div id="naver_id_login" style="text-align:center; width: 269px;">
		<a href="${cpath}/user/naverLogin"><img style="width: 269px;" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
	</div>
	<div class="loginMenu">
		<p><a href="${cpath }/user/join">회원가입</a></p>
		<p><a href="${cpath }/user/passwordFind">비밀번호 찾기</a></p>
	</div>
</div>

<c:if test="${not empty url }">
	<script>
	 	self.location = '${url}'
	</script>
</c:if>

<c:if test="${not empty login || not empty admin }">
	<c:if test="${not empty naverUser }">
		<script> 
			alert("네이버로 로그인되었습니다.")
			location.href = '${cpath}'
		</script>
	</c:if>
	<script> 
		alert("로그인 되었습니다.")
		location.href = '${cpath}'
	</script>
</c:if>

<c:if test="${not empty naverId }">
	<script> 
	alert("네이버로 로그인되었습니다.")
	location.href = '${cpath}'
	</script>
</c:if>

<c:if test="${loginResult == 0 }">
	<script> 
	alert("다시 시도해주세요.")
	</script>
</c:if>

<%@ include file="../footer.jsp" %>