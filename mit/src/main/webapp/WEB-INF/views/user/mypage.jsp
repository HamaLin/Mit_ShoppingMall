<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.mypage {
		width: 1000px;
		height: 800px;
		margin: 150px auto;
		align-content: center;
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
<!-- 로그인 상태가 아니면 로그인페이지로 보내기 -->
<c:if test="${empty login }">
	<script>
		location.replace("${cpath}/user/login")
	</script>
</c:if>

<div class="mypage">
	<h2>마이페이지</h2>
	<div class="userpro">
		<div><img src="${cpath}/image/${login.userimg} " class="userImg" ></div>
		<div>${login.username }님 안녕하세요</div>
		<div>닉네임 : ${login.usernick }</div>
	</div>
	<div class="userInfoMenu">
		<a href="${cpath }/user/userInfo">회원정보 수정</a>
		<span> | </span>
		<a href="${cpath }/user/userDelete">탈퇴하기</a>
	</div>	
</div>

<%@ include file="../footer.jsp" %>