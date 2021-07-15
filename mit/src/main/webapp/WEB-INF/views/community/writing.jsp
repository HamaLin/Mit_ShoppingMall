<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
	form{
		display: flex;
		flex-direction: column;
		justify-content: center;
	}
	p{
		margin: auto;
	}
	#cmcontent{
		border: 1px solid black;
		width: 1000px;
		margin: 0 auto; 
		height: 300px;
	}
	.community{
		padding: 100px 50px;
	}
</style>

<div class="community">
<form method="post" enctype="multipart/form-data" action="${cpath }/community/writing">
<p><input type="text" name="cmtitle" placeholder="게시글 이름"></p>
<p><input type="text" name="cmwriter" placeholder="글쓴이"></p>
<p><input type="text" name="writerimg" placeholder="글쓴이 프사"></p>
<!-- <div id="cmcontent" contenteditable="true"> -->

<!-- </div> -->
<p><textarea name="cmcontent"></textarea></p>
<p><input type="file" name="cmimg" accept="image/*" multiple></p>
<p><input type="submit" value="글적기"></p>
</form>
</div>




<%@ include file="../footer.jsp" %>