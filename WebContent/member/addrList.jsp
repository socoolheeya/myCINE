<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색주소</title>
<style type="text/css">
#addrlist {
   margin: 0px auto;
}

#zipcode {
   margin: 3px auto;
   padding: 4px;
}
</style>
</head>
<body>
   <form name="addrListForm">
      ${requestScope.str };
   </form>
</body>
</html>