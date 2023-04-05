<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    section {
      width:1000px;
      height:400px;
      margin:auto;
      text-align:center;
    }
    section div {
      margin-top:8px;
    }
    section input[type=text]{
      width:300px;
      height:40px;
      outline:none;
     
    }
     section input[type=password]{
      width:300px;
      height:40px;
      outline:none;
     
     
    }
     section input[type=submit]{
      width:308px;
      height:44px;
      outline:none;
     
    }
    section select {
      width:308px;
      height:44px;
      outline:none;
    }
  </style>
</head>
<body> <!-- member_input -->
  <section>
    <div id="member">
      <form method="post" action="member_input_ok">
         <div class="member"> <input type="text" name="userid" placeholder="아이디"></div>
         <div class="member"> <input type="text" name="name" placeholder="이름"></div>
         <div class="member"> <input type="text" name="pwd" placeholder="비밀번호"></div>
         <div class="member"> <input type="text" name="sawon" value="${code}" readonly></div>
         <div class="member">
             <select name="depart">
               <option> 부서선택 </option>
             <c:forEach items="${list}" var="dvo">
                <option value="${dvo.code}"> ${dvo.name} </option>
             </c:forEach>>
               </select>    
         </div>
         <div class="member"> 
            <select name="level">
               <option> 레벨선택 </option>
               <option value="80"> 상급관리자 </option>
               <option value="60"> 중급관리자 </option>
               <option value="40"> 하급관리자 </option>
               <option value="20"> 평직원 </option>
             </select>
           </div>
           <div class="member">
             <input type="submit" value="등록하기">    
            </div>
      </form>
    </div>
  </section>
</body>
</html>