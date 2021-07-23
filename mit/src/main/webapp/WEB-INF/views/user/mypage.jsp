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
		width: 800px;
		height: auto;
		margin: 150px auto;
		align-content: center;
	}
	.userInfo{
		display: flex;
		margin-bottom: 50px;
	}
	.userImg {
		border-radius: 50%;
		border: 3px solid black;
		width: 100px;
		height: 100px;
		overflow: hidden;
	}
	.userInfoMenu {
		margin-left: 20px;
		padding-top: 15px;
	}
	.myQNA {
		width: inherit;
		height: auto;
	}
	table {
		width: inherit;
		height: auto;
		text-align: left;
		border-collapse: collapse;
	}
	td {
 		border-bottom: 1px solid #d5d5d5; 
 		padding: 5px;
 	}
	table tr td:first-child {
		width: 120px;
	}
	table tr td:nth-child(2) {
		text-align: center;
		width: 100px;
	}
	.title:hover {
		cursor: pointer;
		color: grey;
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

	<h2>회원 정보</h2>
	<div class="userInfo">
		<div>
			<img src="${cpath}/image/${login.userimg}" class="userImg" >
		</div>
		<div class="userInfoMenu">
			<div>${login.username }님 안녕하세요</div>
			<div>닉네임 : ${login.usernick }</div>
			<a href="${cpath }/user/userInfo">회원정보 수정</a>
			<span> | </span>
			<a href="${cpath }/user/userDelete">탈퇴하기</a>
		</div>
	</div>
	
	<h2>내가 쓴 글</h2>
	<div class="myQNA">
	</div>	
	
	<h2>장바구니</h2>
	<div class="cart">
	</div>	
</div>


<script>

// 내가 쓴 글
const userid = '<%= session.getAttribute("userid") %>'

const myQNA = document.querySelector('.myQNA')

function getqnalist() {
	const url = '${cpath}/user/getQnaList/'+ userid
	const opt = {
			method: 'GET'
	}
	fetch(url, opt).then(resp => resp.json())
	.then(arr => {
		if(arr.length < 1) {
			myQNA.innerText = '내가 쓴 글이 없습니다.'
		}
		var table = document.createElement('table')
		for(let i = 0 ; i < arr.length ; i++){
			var dto = arr[i]
			var tr = createtr(dto, i)
			table.appendChild(tr)
		}
		myQNA.appendChild(table)
	})
}

function createtr(dto, idx) {
	var tr = document.createElement('tr')
	var tddate = document.createElement('td')
	var tdmenu = document.createElement('td')
	var tdtitle = document.createElement('td')
	
	tddate.innerText = dto.qnadate
	tr.appendChild(tddate)
		
	tdmenu.innerText = dto.qnamenu
	tr.appendChild(tdmenu)
	
	tdtitle.innerText = '[' +dto.qnaresult + '] ' +dto.qnatitle
	tdtitle.classList.add('title')
	tr.appendChild(tdtitle)
	
	tdtitle.onclick = function(e) {
		location.href = '${cpath}/user/qna/'+dto.idx
	}
	
	return tr
}

window.onload = getqnalist()

</script>

<%@ include file="../footer.jsp" %>