<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    section input[type=text] {
      width:300px;
      height:40px;
      outline:none;
     }
 
    section input[type=submit] {
      width:308px;
      height:44px;
      outline:none;
    }
    section select {
      width:308px;
      height:44px;
      outline:none;
    }
    section textarea {
      width:300px;
      height:200px;
      outline:none;
    }
 </style>
</head>
<body>
  <section>
   <form method="post" action="write_ok">
    <table width="300" align="center">
      <caption> <h3> 게시판 글쓰기 </h3></caption>
      <tr>
        <td> <input type="text" name="title" placeholder="제 목"> </td>
      </tr>
      <tr>
        <td> <textarea name="content" placeholder="내 용"></textarea> </td>
      </tr>
      <tr>
        <td> 
           <select name="level">
             <option> 레벨선택 </option>
             <option value="80"> 상급관리자 </option>
             <option value="60"> 중급관리자 </option>
             <option value="40"> 하급관리자 </option>
             <option value="20"> 평직원 </option>
           </select>
        </td>
      </tr>
      <tr>
        <td> <input type="submit" value="저장하기"> </td>
      </tr>
    </table>
   </form>
  </section>
</body>
</html> 





