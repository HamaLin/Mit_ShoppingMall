<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<c:set var="cpath" value="${pageContext.request.contextPath }" />      

<footer>
<div class="footerinfo">
    <ul>
        <li>MEET IT.</li>
        <li>고객센터 | 070.000.0000 | 10:00 ~ 17:00</li>
        <li>
        	<a href ="${cpath }/privacy">개인정보처리방침</a>
        	|
        	<a href ="${cpath }/policy">이용약관</a>
        </li>
        <li>Copyright © 2021 by MEET IT. all rights reserved.</li>
    </ul>
</div>
</footer>

</body>
</html>