<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
   #mform div{
     margin-top:4px;
     margin-left:10px;
   }
   #mform select{
      width:160px;
      height:30px;
      outline:none;
   }
   #mform input[type=text]{
      width:328px;
      height:30px;
      outline:none;
   }
   #mform textarea{
      width:330px;
      height:150px;
      outline:none;
   }
   #mform input[type=submit]{
      width:336px;
      height:34px;
      outline:none;
   }
  </style>
  <script>
    function getName(depart)
    {
    	var chk=new XMLHttpRequest();
    	chk.onload=function()
    	{
    		//alert(chk.responseText);
    		var data=JSON.parse(chk.responseText);
    		
    		var str="";
    		
    		for(mem in data)
    		{
    			str=str+"<option value='"+data[mem].sawon+"'>"+data[mem].name+"</option>";
    		    //  <option value='c002'> 홍길동 </option> 
    		}
    		//alert(str);
    		document.getElementById("gname").innerHTML=str;
    	}
    	chk.open("get","getName?depart="+depart);
    	chk.send();
    }
    
  </script>
</head>
<body>
  <div id="mform">
   <form method="post" action="sendmemo_ok">
    <div>
      <select name="depart" onchange="getName(this.value)">
        <option> 선택 </option>
        <c:forEach items="${list}" var="dvo">
          <option value="${dvo.code}">${dvo.name} </option>
        </c:forEach>  
      </select>
      <select name="resawon" id="gname">
        
      </select>
    </div>
    <div><input type="text" name="title"></div>
    <div><textarea name="content"></textarea></div>
    <div><input type="submit" value="쪽지보내기"></div>
   </form>
  </div>
</body>
</html>