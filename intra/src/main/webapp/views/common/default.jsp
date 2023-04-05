<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
     boday {
        margin:0px;
        
     }
     #first{
       width:1000px;
       height:30px;
       margin:auto;
       text-align:center;
     }
     header {
       width:1000px;
       height:40px;
       text-align:right;
       margin:auto;
     }
     nav{
       width:1000px;
       height:50px;
       margin:auto;
     }
     nav .menu{
       display:inline-block;
       width:200px;
       height:30px;
       padding-top:8px;
       text-align:center;
       border:1px solid black;
       margin-left:25px;
     }
    
     footer{
       width:1000px;
       height:100px;
       margin:auto;
       background:black;
     }
  </style>
  <sitemesh:write property="head"/>
</head>
<body>
<div id="first"> 우리 회사 </div>
  <header>
   <c:if test="${sawon==null}">
     <a href="../member/login">로그인</a> 
   </c:if>
   <c:if test="${sawon!=null}">
     <a href="../member/logout">로그아웃 </a>  |
     <a href="../member/mypage">마이페이지</a>
   </c:if>
   <c:if test="${level>=60}">
     | <a href="../member/member_input">사원추가</a>
   </c:if>
   <c:if test="${level==100}">
     | <a href="../member/member_commute"> 출퇴근 </a>
   </c:if>  
  </header> <!-- 로그인 관련 -->
  <nav>
    <div id="allmenu">
      <div class="menu"><a href="../board/list">게시판</a></div>
      <div class="menu">근태관리</div>
      <div class="menu">급여관리</div>
      <div class="menu">각종서류</div>
    </div>
  </nav> <!-- 메뉴관련 -->
  
  <sitemesh:write property="body"/>
  
  <footer>회사의 기본정보</footer> <!-- 아래에 제공되는 정보 -->
</body>
</html>