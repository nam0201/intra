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
     height:600px;
     margin:auto;
   }
   section a {
     text-decoration:none;
     color:black;
   }
    section table {
     border-spacing:0px;
   }
   section table td{
     height:30px;
     border-bottom:1px solid #cccccc;
   }
   section table tr:first-child td{
     font-weight:900;
     text-align:center;
     border-bottom:2px solid #cccccc;
   }
   section table tr:last-child td{
     border-bottom:2px solid #cccccc;
   }
  </style>
</head>
<body>
   <section>
     <table width="800" align="center">
        <caption> <h3> ${dname} 게시판 </h3></caption>
        <tr>
          <td> 제 목 </td>
          <td> 작성자 </td>
          <td> 조회수 </td>
          <td> 작성일 </td>
        </tr>
       <c:forEach items="${list}" var="bvo">
         <tr>
         <c:if test="${bvo.level <= level or bvo.sawon==sawon}">
           <td><a href="readnum?id=${bvo.id}">${bvo.title}</a> </td>
          </c:if>
          <c:if test="${ !(bvo.level <= level or bvo.sawon==sawon) }">
           <td>${bvo.title} </td>
          </c:if>
           <td align="center"> ${bvo.name}  </td>
           <td align="center"> ${bvo.readnum} </td>
           <td align="center"> ${bvo.writeday} </td>
         </tr> 
       </c:forEach>    
       <tr>
         <td colspan="4" align="center"> <a href="write">글쓰기 </a></td>
       </tr>  
     </table>
   </section>
</body>
</html>