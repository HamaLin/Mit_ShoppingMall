<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %> 
<c:set var="cpath" value="${pageContext.request.contextPath }" />     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	* { font-family: "Noto Sans KR" !important; }
	
	html, body {
        width: 100%;
        height: 100%;
        margin: 0;
        padding: 0;
    }
    header {
        width: 100%;
        position: fixed;
        top: 0;
        height: 80px;
        background-color: white;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 20px;
        box-sizing: border-box;
        box-shadow: 0 1px 25px rgba(65, 65, 65, 0.05);
    }
    .logo{
    	width: 100px;
    	text-align: center;
    	font-size: 25pt;
    }
    .menu {
        display: flex;
        width: 900px;
        justify-content: center;
    }
    a {
	   	 text-decoration: none;
	   	 color: inherit;
    }
    a:hover, button:hover {
    	cursor: pointer;
    	color: grey;
    }
    nav a {
        margin-right: 30px;
        text-decoration: none;
        color: inherit;
    }
    .menu span {
        margin-right: 30px;
    }
    .miniinfo {
        width: 20px;
        height: 20px;
        margin-right: 5px;
        background-image: url('https://imgur.com/i82VqUu.png');
        background-repeat: no-repeat;
        background-size: 100%;
    }
    .search {
        width: 200px;
        height: 40px;
    }
	.banner {
	    width: 100%;
	    height: 600px;
	    background-color: gray;
	    overflow: hidden;
	}
	.banner ul {
	    padding: 0;
	    margin: 0;
	    list-style: none;
	    display: flex;
	}
	.banner ul li {
	    width: inherit;
	}
	.article {
	    width: 600px;
	    margin: auto;
	    margin-top: 150px;
	    margin-bottom: 75px;
	}
	.article h2 {
	    text-align: center;
	    font-weight: 400;
	}
	.banner2 {
	    display: flex;
	    justify-content: center;
	}
	.banner2 div{
	    width: 300px;
	    height: 400px;
	    background-color: gray;
	    margin: 0 10px 200px 10px;
	}      
	footer {
	    border-top: 1px solid black;
	    text-align: center;
	}
	.footerinfo > ul {
	    list-style: none;
	}
</style>
</head>
<body>
	 <header>
        <div class="logo"><a href="${cpath }">MIT.</a></div>
        <div class="menu">
            <nav>
                <a href="">BEST</a>
                <a href="">NEW</a>
                <a href="${cpath }/store/store">SHOP</a>
                <a href="${cpath }/user/qna">Q&A</a>
                <span>|</span>
                <c:if test="${not empty login || not empty admin}">
	                <a href="${cpath }/user/logout">LOGOUT</a> 
                </c:if>
                 <c:if test="${not empty login}">
	                <a href="${cpath }/user/mypage">MYPAGE</a>
                </c:if>
                <c:if test="${empty login && empty admin }">
	                <a href="${cpath }/user/login">LOGIN</a> 
                </c:if>
            </nav>
            <c:if test="${not empty login || not empty admin}">
            		<span>|</span><div class="miniinfo"></div><span>${login.username} ${admin.username }님</span>
            </c:if>
        </div>
        <input class="search"type="search" placeholder="검색">
    </header>
    <!-- 테스트 -->
    <!-- 테스트2 수현 -->
