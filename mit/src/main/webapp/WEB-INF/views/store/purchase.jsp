<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.purchase {
	width: 700px;
	height: 900px;
	margin: 150px auto;
}
h2 {
	height: 50px;
	border-bottom: 2px solid grey;
}
.total {
	width: 100%;
	height: 70px;
	border-top: 1px solid grey;
	border-bottom: 1px solid grey;
	line-height: 70px;
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
.address input[type="button"], .buy {
	cursor: pointer;
	border: 1px solid rgb(65, 65, 65);
	background-color: white;
	width: 289px;
    height: 44px;
}
.address input[type="button"]:hover {
	color: grey;
}
.pay {
	width: 100%;
	height: 100px;
}
.buy {
	cursor: pointer;
	border: 3px solid grey;
	width: 100%;
    height: 80px;
	background-color: white;
	font-size: 17pt;
}
.address {
	width: 100%;
	border-top: 1px solid grey;
	border-bottom: 1px solid grey;
}

</style>
</head>
<body>

<!-- 유저 주소를 우편번호와 주소로 구분해주기 -->
<c:set var="addressAll" value="${login.useraddress}" />
<c:set var="postcode" value="${fn:substringBefore(addressAll, '/') }" />
<c:set var="address" value="${fn:substringAfter(addressAll, '/') }" />

<div class="purchase">
<form id="purchase">
	<h2>주문하기</h2>
	<div class="itemList">
		<h3>주문 목록</h3>
		<div class="img"></div>
		<div class="pdtitle"></div>
		<div class="pdInfo">
			<div class="pdSize"></div>
			<div class="pdPrice"></div>
			<div class="pdCount"></div>
		</div>
	</div>
	
	<h3 class="total">주문 합계 : </h3>
	
	<div class="userInfo">
	<h3>주문자 정보</h3> <!-- 이름, 이메일, 연락처 -->
		<p><input type="text" name="username" value="${login.username }"></p>
		<p><input type="text" name="usermail" value="${login.usermail }" placeholder="이메일"></p>
		<p><input type="text" name="userphone" value="${login.userphone }" placeholder="연락처( -제외 숫자만 입력 )"></p>
		<div class="address">
			<h3>배송지</h3> 
			<button class="addressNew" type="button" onclick="addressNew();">신규 배송지 등록</button>
			<p><input type="button" onclick="address_execDaumPostcode()" value="우편번호 검색하기"></p>
			<p><input type="text" name="postcode" id="postcode" value="${postcode }" placeholder="우편번호"></p>
			<p><input type="text" name="address" id="address" value="${address }" placeholder="주소"></p>
		</div>
	</div>
	
	<div class="pay">
		<h3>결제 방법</h3>
		
	</div>
	
	<p><button class="buy" type="button" onclick="addPurchase();">결제하기</button></p>
</form>
</div>


<script>
	var url= '${cpath}/store/showmethepurchase'+ document.location.search
	var opt = {
			method: 'GET'
	}
	fetch(url,opt).then(resp => resp.text())
	.then(text => {
		console.log(text)
	})
</script>

<!-- 결제하기 -->
<script>
	const userInfo = document.getElementById('userInfo')
	const addPurchase = function() {
		
	}
</script>

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

<!-- 주소 신규 등록 -->
<script>
	const addressNew = function() {
		const postcode = document.querySelector('input[name="postcode"]')
		const address = document.querySelector('input[name="address"]')
		postcode.value = ''
		address.value = ''
	}
</script>

<%@ include file="../footer.jsp"%>