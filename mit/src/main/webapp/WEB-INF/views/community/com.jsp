<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp" %>

<h1>커뮤니티</h1>

<a href="${cpath }/community/writing">글쓰기</a>
<%-- 깃 테스트 히히 --%>
<div id="com">
<ul>
<c:forEach var="list" items="${list }">
	
	<li>
	<a href="${cpath }/"><img src="${list.filename }">
	${list.cmtitle }</a>:${list.cmdate }
	</li>

</c:forEach>
</ul>
</div>

	<script>
//     const com=document.getElementById('com')
//     function list(){
//         const url='${cpath}/com'
//         const opt={
//             method:'GET'
//         }
//         fetch(url.opt).then(resp=>resp.text())
//         .then(list=>{
//             for(let i=0;i<list.length;i++){
//                 const dto =list[i]
//                 const div=createDiv(dto)
//                 com.appendChild(div)
//             }
//         })
//     }
//     window.onload=list
    
//     function createDiv(dto) {
// 		const div = document.createElement('div')
// 		div.innerHTML = dto.dday+'<pre>' + dto.title + '</pre>'
		
// 		div.className = 'title'						
// 		return div						
// 	}
</script>


<%@ include file="../footer.jsp" %>