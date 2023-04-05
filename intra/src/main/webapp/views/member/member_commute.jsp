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
     height:500px;
     margin:auto;
   }
</style>
</head>
<body>
  <section>
    <table width="800" align="center">
       <caption> <h3> ${today} 출퇴근정보 </h3></caption>
       <tr>
         <td> 이름 </td>
         <td> 사원번호 </td>
         <td> 출근시간 </td>
         <td> 퇴근시간 </td>
         <td> 상태 </td>
        </tr>
        <c:forEach items="${list}" var="cvo">
         
          <tr>
           <td> ${cvo.name} </td>
           <td> ${cvo.sawon} </td>
           <td> ${cvo.towork} </td>
           <td> ${cvo.tohome} </td>
           <td>
             <c:if test="${cvo.state==0 }">
              정상
             </c:if>
             <c:if test="${cvo.state==1}">
              지각
             </c:if>
             <c:if test="${cvo.state==2}">
               조퇴
             </c:if>
             <c:if test="${cvo.state==3}">
              지각&조퇴
             </c:if>
             <c:if test="${cvo.state==4}">
               휴가
             </c:if>
              <c:if test="${cvo.state==5}">
                결근
              </c:if>
           </td>
        </tr>
        </c:forEach> 
    </table>
  </section>
</body>
</html>