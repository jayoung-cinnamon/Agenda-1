<%@page import="java.util.List"%>
<%@page import="com.agenda.schedule.ScheduleDto"%>
<%@page import="com.agenda.schedule.ScheduleDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/header/loginMain.css"
	type="text/css" media="screen" />
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
<%
	String member_id = request.getParameter("member_id");
	System.out.println("  :  " + member_id);
	
%>


$(function(){
	 var member_id = "<%= member_id %>";
	 console.log("reload")
	 console.log("member id : " + member_id);
	 var arr;
		 
		  $.ajax({				
				type: "post",
				url: "./ScheduleController?command=Alrim",
				data : {
					member_id : member_id
					},
				success: function(list){
					$.ajaxSettings.traditional = true;
					arr = list.dataList;
					console.log(list);
					console.log(arr);
					if(window.Notification){
				         Notification.requestPermission();
				      }
				    
				    printTime(arr);
				},
				error : function(msg) {  
				        alert("통신실패");
				     }
			}); 
	  
	  
		   
     /* if(window.Notification){
         Notification.requestPermission();
      }
    
    printTime();*/
   		
    
      
   });
   function printTime(arr) {
	    
	   for(var i in arr){
	   	arr[i];
	   	console.log(arr);
	   }
	   
	
	   
	   var clock = document.getElementById("clock");            // 출력할 장소 선택
	   var now = new Date();                                                  // 현재시간
	   var nowTime = /*now.getFullYear() + "년" + (now.getMonth()+1) + "월" + now.getDate() + "일" +*/ now.getHours() + ":" + now.getMinutes()  ;  
	   
	  
	   		if(arr.includes(nowTime)){
		  
	   			clock.innerHTML = nowTime + "q";    // 현재시간을 출력
	   	 		var set = setTimeout(function(){
	       		notify();
	   			}, 1000);
	   			return;
	   			
	   		}
	   
		
	   else{
		   		//console.log(nowTime);
		   		
		   		
		  
	   		}
	   
       setTimeout("printTime()",1000);         // setTimeout(“실행할함수”,시간) 시간은1초의 경우 1000

}

  function notify(){
       if(Notification.permission !== 'granted'){
          alert('notification is disabled');
       }
       else {
          var notification = new Notification('요리조리', {
             icon : './img/warning.jpg',
             body : '방송이 시작되었습니다.',
          });
          
          /* 푸쉬알림 클릭 시 어디로 이동할건지 : 우리페이지로.. */
          notification.onclick = function(){
             window.open('http://naver.com');
          };
       } 
      
    }
   
 
 
</script>
</head>
<body>



			

	<header>
		<div class="wrapper">
			<div id="header-bar" onclick="location.href='${pageContext.request.contextPath}/main/main.jsp'">
				<img src="${pageContext.request.contextPath}/header/resources/img/medicine.png">
				<span>AGENDA</span>
			</div>
			<nav>
			<c:choose>
				<c:when test="${logindto.member_role eq 'ADMIN' }">
					<ul class="header-menu">
					<li><button onclick="location.href='${pageContext.request.contextPath}/AlrimController?command=Alrimlist&member_id=${logindto.member_id }'">알람 보기</button></li>
					<li><a href="${pageContext.request.contextPath}/adController?command=adminpage&member_id=${logindto.member_id }"><span class="mypage"><button id="mypage">Mypage</button></span></a></li>
					<li><a href="${pageContext.request.contextPath}/LoginController?command=logout"><span class="logout"><button id="logout">Log out</button></span></a></li>
					<li><a href="#"><span class="list" onclick="openNav()">&#9776;</span></a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="header-menu">
					<li><button onclick="location.href='${pageContext.request.contextPath}/AlrimController?command=Alrimlist&member_id=${logindto.member_id }'">알람 보기</button></li>
					<li><a href="${pageContext.request.contextPath}/MyinfoController?command=myinfo&member_id=${logindto.member_id }"><span class="mypage"><button id="mypage">Mypage</button></span></a></li>
					<li><a href="${pageContext.request.contextPath}/LoginController?command=logout"><span class="logout"><button id="logout">Log out</button></span></a></li>
					<li><a href="#"><span class="list" onclick="openNav()">&#9776;</span></a></li>
					</ul>
				</c:otherwise>
			</c:choose>
			<div id="mySidenav" class="sidenav">
				<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
				<p>SERVICE</p>
				<a href="${pageContext.request.contextPath}/MainController?command=mediSearch" 
					onmouseover="this.innerHTML='Medication check'"
					onmouseout="this.innerHTML='의약품조회'">의약품조회
				</a> 
				<a href="${pageContext.request.contextPath}/MainController?command=findPharm"
					onmouseover="this.innerHTML='Finding Pharmacy'"
					onmouseout="this.innerHTML='약국찾기'"><span>약국찾기</span>
				</a> 
				<a
					href="${pageContext.request.contextPath}/MediLockerRegistController?command=mediLocker" 
					onmouseover="this.innerHTML='Prescription'"
					onmouseout="this.innerHTML='처방전'"><span>처방전</span>
				</a> <br>
				<br> <br>
				<p>NOTICE</p>
				<a href="${pageContext.request.contextPath}/MainController?command=notice" 
					onmouseover="this.innerHTML='Notice'"
					onmouseout="this.innerHTML='공지사항'">공지사항</a>
				<p>SUPPORT</p>
				<a href="${pageContext.request.contextPath}/MainController?command=qna"
					onmouseover="this.innerHTML='Questions and Answers'"
					onmouseout="this.innerHTML='Q&A'">Q&A
				</a>
			</div>
			</nav>
		</div>
		<script>
			function openNav() {
				document.getElementById("mySidenav").style.width = "400px";
			}

			function closeNav() {
				document.getElementById("mySidenav").style.width = "0";
			}

		</script>
	</header>
</body>
</html>