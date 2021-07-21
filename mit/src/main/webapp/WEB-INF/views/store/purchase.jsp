<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<h1>Hello</h1>

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


<%@ include file="../footer.jsp"%>