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
      height:400px;
      margin:auto;
    }
    section input[type=text]{
      width:300px;
      height:40px;
      outline:none;
      margin-top:40px;
    }
     section input[type=password]{
      width:300px;
      height:40px;
      outline:none;
      margin-top:40px;
     
    }
     section input[type=submit]{
      width:308px;
      height:44px;
      outline:none;
      margin-top:20px;
    }
  </style>
</head>
<body>
   <section>
    <form method="post" action="login_ok">
      <div align="center"> <input type="text" name="userid"></div>
      <div align="center"> <input type="password" name="pwd"></div>
      <div align="center"> <input type="submit" value="로그인"> </div>
     </form>
   </section>
</body>
</html>