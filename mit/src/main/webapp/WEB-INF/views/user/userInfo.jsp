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
		height: 1000px;
		padding-left: 100px;
		margin: 150px auto;
	}
	.userInfo input[type="text"], input[type="password"]{
	    width: 270px;
	    height: 40px;
	    border: 1px solid rgb(65, 65, 65);
	    padding-left: 15px;
	}
	.userInfo button {
		cursor: pointer;
		border: 1px solid rgb(65, 65, 65);
		width: 289px;
	    height: 44px;
	}
	.address input[type="button"] {
		cursor: pointer;
		border: 1px solid rgb(65, 65, 65);
		background-color: white;
		width: 289px;
	    height: 44px;
	}
	.address input[type="button"]:hover {
		color: grey;
	}
	.modify {
		background-color: white;
	}
	.return, .password {
		background-color: #e9e9e9;
	}
	.userImg {
		border-radius: 50%;
		border: 3px solid black;
		width: 100px;
		height: 100px;
		overflow: hidden;
	}
	.address {
		width: 290px;
		margin-top: 30px;
		margin-bottom: 30px;
	}
</style>
</head>
<body>

<!-- 유저 주소를 우편번호와 주소로 구분해주기 -->
<c:set var="addressAll" value="${login.useraddress}" />
<c:set var="postcode" value="${fn:substringBefore(addressAll, '/') }" />
<c:set var="address" value="${fn:substringAfter(addressAll, '/') }" />

<div class="userInfo">
	<form id="userInfo" enctype="multipart/form-data">
		<img src="${cpath}/image/${login.userimg} " class="userImg" >
		<h3>${login.username }님의 회원 정보</h3>
		<p><input type="file" name="img" accept="image/*"></p>
		<p><input type="hidden" name="userimg" value="${login.userimg }"></p>
		<p><input type="hidden" name="userid" value="${login.userid }"></p>
		<p><input type="text" name="usernick" value="${login.usernick }" placeholder="닉네임"></p>
		<p><input type="text" name="usermail" value="${login.usermail }" placeholder="이메일"></p>
		<p><input type="text" name="userphone" value="${login.userphone }" placeholder="연락처( -제외 숫자만 입력 )"></p>
		<p><input class="gender" type="text" name="usergender" placeholder="성별" readonly></p>
		<div class="address">
			<h3>주소 등록하기</h3>
			<p><input type="button" onclick="address_execDaumPostcode()" value="우편번호 검색하기"></p>
			<p><input type="text" name="postcode" id="postcode" value="${postcode }" placeholder="우편번호"></p>
			<p><input type="text" name="address" id="address" value="${address }" placeholder="주소"></p>
		</div>
		<p><button class="modify" type="submit">정보수정</button></p>
		<p><button class="return" type="button" onclick="redirect();">돌아가기</button></p>
		<p><button class="password" type="button" onclick="passwordModify();">비밀번호 변경하기</button></p>
	</form>

</div>

<!-- 우편 번호 검색(다음 우편번호 apt) -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function address_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
         
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
            }
        }).open();
    }
</script>

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


<!-- 돌아가기, 비밀번호 변경하기 버튼 -->
<script>
	const redirect = function() {
		history.back()
	}
	
	const passwordModify = function() {
		location.replace("${cpath}/user/passwordModify")
	}
</script>

<%@ include file="../footer.jsp" %>