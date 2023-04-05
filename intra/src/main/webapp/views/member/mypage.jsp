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
    section #comm {
      font-size:13px;
    }
    section #inner {
      position:absolute;
      width:400px;
      height:300px;
      border:1px solid black;
      overflow-y:auto;
      visibility:hidden;
      background:white;
    }
 
  </style>
  <script>
    function mopen()
    {
    	myopen=window.open("sendmemo","","width=400,height=400"); // open("문서","target","윈도우설정")
    	var w=screen.availWidth;
    	var h=screen.availHeight;
    	//alert(w+" "+h);
    	w=w/2-200;
    	h=h/2-200;
    	//alert(w);
    	myopen.moveTo(w,h);
    }
    
    function getSendMemo()
    {
    	// 쪽지 보기 레이어를 보이게 하고 위치를 잡아준다..
    	document.getElementById("inner").style.visibility="visible";
    	var w=window.innerWidth;
    	var h=window.innerHeight;
    	//alert(w+" "+h);
    	w=w/2-200;
    	h=h/2-150;
    	
    	document.getElementById("inner").style.left=w+"px";
    	document.getElementById("inner").style.top=h+"px";
    	
    	var chk=new XMLHttpRequest();
    	chk.onload=function()
    	{
    		//alert(chk.responseText);
    		var data=JSON.parse(chk.responseText);
    		
    		var str="<table cellspacing='0' width='380' align='center'>";
    		str=str+"<caption> <h3> 보낸쪽지 </h3> </caption>";
    		for(mem of data)
    	    {   
    			if(mem.state==1) 
    			   var imsi=" bgcolor='#eeeeee'";	
    			else
    			   var imsi="";
    			str=str+"<tr align='center'"+imsi+">";
    			str=str+"<td width='80'>"+mem.name+"</td>";
    			str=str+"<td onclick='view("+mem.id+",1)'>"+mem.title+"</td>";
    			str=str+"<td width='80'>"+mem.writeday.substring(5)+"</td>";
    			str=str+"</tr>";
    	    }
    		str=str+"<tr align='center'> <td colspan='3' onclick='memoclose()'> 닫기 </td> </tr>";
    		str=str+"</table>";
    		
    		document.getElementById("inner").innerHTML=str;
    	}
    	chk.open("get","getSendMemo");
    	chk.send();
    }
    
    function view(id,n)
    {
    	 
    	var chk=new XMLHttpRequest();
    	chk.onload=function()
    	{
    		// alert(chk.responseText);
    		var data=JSON.parse(chk.responseText);
    		var str="<table width='380' align='center'>";
    		str=str+"<tr>";
    		str=str+" <td> "+data.title+"</td>";
    		str=str+"</tr>";
    		str=str+"<tr>";
    		str=str+" <td> "+data.content+"</td>";
    		str=str+"</tr>";
    		str=str+"<tr>";
    		if(n==1)
    		   str=str+" <td onclick='getSendMemo()'> 닫기 </td>";
    		else
    		   str=str+" <td onclick='getReceiveMemo()'> 닫기 </td>";
    		str=str+"</tr>"
    		str=str+"</table>";
    		document.getElementById("inner").innerHTML=str;
    	}
    	chk.open("get","viewmemo?id="+id+"&n="+n);
    	chk.send();
    }
    
    function memoclose()
    {
    	document.getElementById("inner").innerText="";
    	document.getElementById("inner").style.visibility="hidden";
    }
    //받은쪽지
    function getReceiveMemo()
    {
    	// 쪽지 보기 레이어를 보이게 하고 위치를 잡아준다..
    	document.getElementById("inner").style.visibility="visible";
    	var w=window.innerWidth;
    	var h=window.innerHeight;
    	//alert(w+" "+h);
    	w=w/2-200;
    	h=h/2-150;
    	
    	document.getElementById("inner").style.left=w+"px";
    	document.getElementById("inner").style.top=h+"px";
    	
    	var chk=new XMLHttpRequest();
    	chk.onload=function()
    	{
            var data=JSON.parse(chk.responseText);
    		 
    		var str="<table cellspacing='0' width='380' align='center'>";
    		
    		str=str+"<caption> <h3> 받은쪽지 </h3> </caption>";
    		for(mem of data)
    	    {
    			if(mem.state==1) 
     			   var imsi=" bgcolor='#eeeeee'";	
     			else
     			   var imsi="";
    			
    			str=str+"<tr align='center'"+imsi+">";
    			str=str+"<td width='80'>"+mem.name+"</td>";
    			str=str+"<td onclick='view("+mem.id+",2)'>"+mem.title+"</td>";
    			str=str+"<td width='80'>"+mem.writeday.substring(5)+"</td>";
    			str=str+"</tr>";
    	    }
    		str=str+"<tr align='center'> <td colspan='3' onclick='memoclose()'> 닫기 </td> </tr>";
    		str=str+"</table>";
 
    		document.getElementById("inner").innerHTML=str;
    	}
    	chk.open("get","getReceiveMemo");
    	chk.send();
    }
  </script>
</head>
<body>
  <section>
    <div id="inner"></div>
    <table width="800" align="center">
      <caption> <h3> 회원 정보 <a href="" style="font-size:13px">정보수정</a> </h3></caption>
      <tr>
        <td width="80"> 이름 </td>
        <td width="160"> ${mvo.name} </td>
        <td width="80"> 아이디 </td>
        <td width="160"> ${mvo.userid} </td>
        <td width="80"> 사원코드 </td>
        <td width="160"> ${mvo.sawon} </td>
      </tr>
      <tr>
        <td> 부서 </td>
        <td> ${depart} </td>
        <td> 입사일 </td>
        <td> ${mvo.ipsa} </td>
        <td> 전화번호 </td>
        <td> ${mvo.phone} </td>
      </tr>
    </table>
    
    <h3 align="center"> 출퇴근 정보 
      <c:if test="${chk==1}">
       <span id="comm"> <a href="towork"> 출근찍기 </a></span>
      </c:if>
      <c:if test="${chk==2}">
       <span id="comm"> <a href="tohome"> 퇴근찍기 </a></span>
      </c:if>
      <c:if test="${chk==3}">
       <span id="comm"> 출퇴근완료 </span>
      </c:if>
      <c:if test="${chk==4}">
        <span id="comm"> 휴가 </span>
      </c:if>
    </h3>
    
    <table width="400" align="center">
      <caption><h3> 쪽지 관련 
        <span id="comm"> <a href="javascript:mopen()"> 쪽지 보내기 </a></span>
      </h3></caption>
      <tr>
        <td> <a href="#" onclick="getSendMemo()"> 보낸 쪽지 </a></td>
        <td> <a href="#" onclick="getReceiveMemo()"> 받은 쪽지 </a></td>
      </tr>
        <tr>
        <td> 총 ${chongcnt}건   (${readcnt} /  ${chongcnt-readcnt}) </td>
        <td> 총 ${chongcnt2}건    (${readcnt2}  /  ${chongcnt2-readcnt2}) </td>
      </tr>
     
    </table>
  </section>
</body>
</html>






