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
        z-index: 15;
    }
    .logo{
    	width: 100px;
    	text-align: center;
    	font-size: 25pt;
    }
    .menu {
        display: flex;
        width: 900px;
        justify-content: flex-end;
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
    #getSearch {
	   border: 1px solid black;
	   border-radius: 8px;
	   width: 200px;
	   height: 40px;
	}	
    #submit {
      padding-top: 5px;
       background-color: white;
       border: none;
       cursor: pointer;
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
	nav > .category {
        all: unset;
    }
    .category > ul {
        padding: 10px;
        position: absolute;
        top: 40px;
        width: 70px;
        font-size: 14px;
        text-align: center;
        padding-top: 10px;
        margin: 10px;
        margin-left: 130px;
        display: flex; 
        font-size: 13px;
        flex-flow: wrap;
    }
    .category > ul > li {
        text-align: left;
        display: none;
        width: 90px;
        padding: 5px;
        font-weight: normal;
        background-color: white;
        z-index: 6;
    }
    .category:hover > ul > li {
        display: block;
    }
</style>
</head>
<body>
	 <header>
        <div class="logo"><a href="${cpath }">MIT.</a></div>
        <div class="menu">
            <nav>
                <a href="${cpath }/store/best10">BEST</a>
                <a href="${cpath }/store/new">NEW</a>
                <li class="category">
                    <a href="${cpath }/store/store">SHOP</a>
                        <ul>
                            <li><a href="${cpath }/store/top">상의</a></li>
                            <li><a href="${cpath }/store/bottom">하의</a></li>
                            <li><a href="${cpath }/store/hat">모자</a></li>
                            <li><a href="${cpath }/store/backpack">백팩</a></li>
                            <li><a href="${cpath }/store/glasses">안경</a></li>
                        </ul>
                </li>
                <a href="${cpath }/user/qna">Q&A</a>
                <span>|</span>
                <c:if test="${not empty login || not empty admin }">
	                <a href="${cpath }/user/logout">LOGOUT</a> 
                </c:if>
                 <c:if test="${not empty login}">
	                <a href="${cpath }/user/mypage">MYPAGE</a>
                </c:if>
                <c:if test="${empty login && empty admin }">
	                <a href="${cpath }/user/login">LOGIN</a> 
                </c:if>
            </nav>
            <c:if test="${not empty login || not empty admin }">
            		<span>|</span><div class="miniinfo"></div><span>${login.username }${admin.username }님</span>
            </c:if>
        </div>
        <form id="searchForm">
       		<input id="getSearch" name="search">
       	</form>
    </header>
    
    <script>
    	const searchForm = document.getElementById('searchForm')
//         const getSearch = document.querySelector('.getSearch')
		const getSearch = document.querySelector('input[name="search"]')
		
        searchForm.onsubmit = function() {
    		event.preventDefault()
            location.href = '${cpath}/store/storeSearch/?search=' + getSearch.value
        }

    </script>

