<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>처방전 파일 업로드!</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function selfClose(){
// "${pageContext.request.contextPath}/MediLockerScanController;
formTag.action="${pageContext.request.contextPath}/MediLockerScanController";
formTag.submit();
//window.open("about:blank, "_self").close();
 
} 
</script>
</head>
<body>
	<form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/MediLockerScanController">
	<table>
          <tr>
              <td>사진을 선택해주세요</td>
              <td><input type="file" value="파일 선택" name="file"/></td>
          </tr>
          <tr>
          	  <td><input type="submit" value="파일 업로드"/></td>
          </tr>
         
    

     </table>
     </form>
</body>
</html>