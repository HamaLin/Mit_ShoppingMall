<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.QNA {
		width: 800px;
		height: auto;
		margin: 150px auto;
		align-content: center;
	}
	.qnaList {
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
	table tr td:last-child {
		text-align: right;
	}
	.title:hover {
		cursor: pointer;
		color: grey;
	}

</style>

</head>
<body>

<div class="QNA">
	<h2>Q&A</h2>
	<div class="qnaList">
	</div>
</div>


<script>

// 전체 문의

const qnaList = document.querySelector('.qnaList')

function getqnaAll() {
	const url = '${cpath}/user/getQnaList'
	const opt = {
			method: 'GET'
	}
	fetch(url, opt).then(resp => resp.json())
	.then(arr => {
		if(arr.length < 1) {
			qnaList.innerText = '문의글이 없습니다.'
		}
		var table = document.createElement('table')
		for(let i = 0 ; i < arr.length ; i++){
			var dto = arr[i]
			var tr = createtr(dto, i)
			table.appendChild(tr)
		}
		qnaList.appendChild(table)
	})
}

function createtr(dto, idx) {
	var tr = document.createElement('tr')
	var tddate = document.createElement('td')
	var tdmenu = document.createElement('td')
	var tdtitle = document.createElement('td')
	var tdwriter = document.createElement('td')
	
	tddate.innerText = dto.qnadate
	tr.appendChild(tddate)
		
	tdmenu.innerText = dto.qnamenu
	tr.appendChild(tdmenu)
	
	if(dto.qnareplycnt > 0) {
		tdtitle.innerText = '[답변 완료] ' + dto.qnatitle + ' (' + dto.qnareplycnt + ')'
	} else {
		tdtitle.innerText = '[답변 대기] ' + dto.qnatitle 
	}

	tdtitle.classList.add('title')
	tr.appendChild(tdtitle)
	
	tdtitle.onclick = function(e) {
		location.href = '${cpath}/user/qna/'+ dto.idx
	}
	
	// 문자열 검색해서 중간 글자 *로 만들기
	var maskingName = function(strName) {
	  if (strName.length > 2) {
	    var originName = strName.split('');
	    originName.forEach(function(name, i) {
	      if (i === 0 || i === originName.length - 1) return;
	      originName[i] = '*';
	    });
	    var joinName = originName.join();
	    return joinName.replace(/,/g, '');
	  } 
		// 2글자면 마지막 글자만
	  else {
	    var pattern = /.$/; // 정규식
	    return strName.replace(pattern, '*');
	  }
	};
	
	var strName = dto.qnawriter
	tdwriter.innerText = maskingName(strName)
	tr.appendChild(tdwriter)
	
	return tr
}

window.onload = getqnaAll()

</script>

<%@ include file="../footer.jsp" %>