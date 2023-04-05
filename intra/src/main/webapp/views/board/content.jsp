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
   section table{
     border-spacing:4px;
   }
   section table td{
     height:30px;
   }
   section table .tt{
     width:90px;
     text-align:center;
     background:#eeeeee;
   }
   section table a{
     text-decoration:none;
     color:black;
     border:1px solid #cccccc;
     display:inline-block;
     width:80px;
   }
   section table a:hover{
     color:white;
     border:1px solid #cccccc;
     background:#cccccc;
   }
   section #cont{
     width:400px;
     height:200px;
     overflow:auto;
   }
   
   </style>
</head> 
<body>
 <section>
   <table width="500" align="center">
     <tr>
       <td class="tt"> 제 목 </td>
       <td> ${bvo.title} </td>
     </tr>
     <tr>
       <td class="tt"> 작성자 </td>
       <td> ${bvo.name} </td>
     </tr>
     <tr>
       <td class="tt"> 조회수 </td>
       <td> ${bvo.readnum} </td>
     </tr> 
       <td class="tt"> 작성일 </td>
       <td> ${bvo.writeday} </td>
     </tr> 
     <tr>
       <td class="tt"> 내 용 </td>
       <td> ${bvo.content} </td>
     </tr>
     <tr>
       <td colspan="2" align="center">
         <a href="list"> 목록 </a>
        <c:if test="${sawon==bvo.sawon}">
         <a href="update?id=${bvo.id}"> 수정 </a>
         <a href="delete?id=${bvo.id}"> 삭제 </a>
       </c:if>
       </td>
     </tr>
   </table> 
   </section>
</body>
</html>








