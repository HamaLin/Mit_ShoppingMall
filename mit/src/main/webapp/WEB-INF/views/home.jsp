<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* slide banner */
.slideWrapper {
    position: relative;
    width: 100%;
    height: 480px;
    overflow: hidden;
    margin-top: 80px;
    margin-bottom: 35px;
}
.slide {
    padding: 0;
    margin: 0;
    display: flex;
    position: absolute;
    width: 300%;
    left: 0;
    top: 0;
}
.animated {
    transition: 0.5s ease-out;
    /* transition: opacity 600ms ease 0s, visibility 600ms ease 0s; */
}
.slide li {
    list-style: none;
    width: 100%;
    height: 480px;
    background-position: center;
    background-repeat: no-repeat;
    background-size: 100%;
}
.bannerBtn {
    text-align: center;
    display: flex;
    width: 100%;
    height: 480px;
    justify-content: space-between;
    align-items: center;
}
.bannerBtn div {
    width: 80px;
    height: 80px;
    z-index: 1;
    background-size: 40%;
    background-repeat: no-repeat;
    background-position: center;
}
.prev {
    background-image: url('https://imgur.com/SNyVFfi.png');
}
.next {
    background-image: url('https://imgur.com/f67UiuT.png');
}
</style>
</head>
<body>

<div class="slideWrapper">
        <ul class="slide">
            <li style="background-image: url('https://www.covernat.net/SkinImg/img/main_ban01_2021_12_210712_1.jpg')"></li>
            <li style="background-image: url('https://m.diamondlayla.com/file_data/diamondlayla/gallery/2021/02/03/5ad782c19fd21e9c06b88ed5730978a3.jpg');"></li>
            <li style="background-image: url('https://m.diamondlayla.com/file_data/diamondlayla/gallery/2020/04/21/c8838d9aeff3c9eea0dd1a458f6fc93b.jpg')"></li>
        </ul>
	    <div class="bannerBtn">
	        <div class="prev"></div>
	        <div class="next"></div>
	    </div>
    </div>

<div class="article">
        <h2>BEST PRODUCTS</h2>
    </div>
    <div class="banner2">
        <div></div>
        <div></div>
        <div></div>
        <div></div>
    </div>
    
<script>
    const slide = document.querySelector('.slide')
    const content = document.querySelectorAll('.slide li')
    let currentIdx = 0,
    contentCount = content.length,
    contentWidth = content[0].offsetWidth
    prevBtn = document.querySelector('.prev'),
    nextBtn = document.querySelector('.next')

    makeClone()

    function makeClone() {
        for(let i = 0; i < contentCount; i++) {
            let cloneContent = content[i].cloneNode(true)
            cloneContent.classList.add('clone')
            slide.appendChild(cloneContent)
        }
        for(let i = contentCount - 1; i >= 0; i--) {
            let cloneContent = content[i].cloneNode(true)
            cloneContent.classList.add('clone')
            slide.prepend(cloneContent)
        }
        calcWidth()
        setInitialPosition()
        
        setTimeout(function(){
            slide.classList.add('animated')
        })
    }

    function calcWidth() {
        let currentContent = document.querySelectorAll('.slide li')
        let newWidth = currentContent.length * contentWidth
        slide.style.width = newWidth + 'px'
    }

    function setInitialPosition() {
        let initalTranslateValue = -contentWidth * contentCount
        slide.style.transform = 'translateX(' + initalTranslateValue + 'px)'
    }

    nextBtn.onclick = function() {
        moveSlide(currentIdx + 1)
    }

    prevBtn.onclick = function() {
        moveSlide(currentIdx - 1)
    }

    function moveSlide(num) {
        slide.style.left = (-num * contentWidth) + 'px'
        currentIdx = num
        if(currentIdx == contentCount || currentIdx == -contentCount) {
            setTimeout(function(){
                slide.classList.remove('animated')
                slide.style.left = '0px'
                currentIdx = 0;
            },400)
            setTimeout(function(){
                slide.classList.add('animated')
            },500)
        }
    }

    let timer = undefined

    function autoSlide() {
        if(timer == undefined) {
            timer = setInterval(function(){
                moveSlide(currentIdx + 1)
            }, 3000)
        }
    }

    autoSlide()

    function stopSlide(){
        clearInterval(timer)
        timer = undefined
    }
    slide.onmouseover = stopSlide
    slide.onmouseout = autoSlide
    prevBtn.onmouseover = stopSlide
    nextBtn.onmouseover = stopSlide

</script>

<%@ include file="footer.jsp" %>
