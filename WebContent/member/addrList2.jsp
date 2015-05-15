<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="mycine.post.*"%>
<jsp:useBean id="pDAO" class="mycine.post.PostDAO" />
<%
   request.setCharacterEncoding("UTF-8");
%>
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
<script type="text/javascript">
function autoInput(zipcode){
   
}
</script>
</head>
<body>
   <%
      String requestDong = request.getParameter("dong");
      ArrayList<PostDTO> arr = pDAO.findAddr(requestDong);
      String zipcode = null;
      String addr = null;
   %>
   <form name="addrListForm">
      <%
            if (requestDong == null || requestDong.equals("")) {
         %>
            <h3>검색어를 입력하지 않았습니다.</h3>
         <%
            }else{
               if(arr==null||arr.size()==0){
                  %>
                  <h3>검색하신 주소는 없는 주소 입니다.</h3>
                  <%
               }else{
                  %>
                  <table border="1" id="addrlist">
                  <thead>
                  <tr>
               <th style="font-size:15px; font-weight: bold; text-align: center;">우편번호</th>
               <th style="font-size:15px; font-weight: bold; text-align: center;">주소</th>
                  </tr>
                  </thead>
                  <%
               for (int i = 0; i < arr.size(); i++) {
                  String sido = arr.get(i).getSido() == null ? "" : arr
                        .get(i).getSido();
                  String gugun = arr.get(i).getGugun() == null ? "" : arr
                        .get(i).getGugun();
                  String dong = arr.get(i).getDong() == null ? "" : arr
                        .get(i).getDong();
                  String ri = arr.get(i).getRi() == null ? "" : arr.get(i)
                        .getRi();
                  String bunji = arr.get(i).getBunji() == null ? "" : arr
                        .get(i).getBunji();
                  String bldg = arr.get(i).getBldg() == null ? "" : arr
                        .get(i).getBldg();
                  zipcode = arr.get(i).getZipcode();

                  addr = sido + gugun + dong + ri + bunji + bldg;
         %>
         <tr>
            <td width="125;" style="text-align: center; padding: 5px;"><%=zipcode %></td>
            <td width="700" style="padding-left: 15px;"><a href="updateSearchAddr_ok.jsp?zipcode=<%=zipcode %>&addr=<%=addr%>"><%=addr %></a></td>
         </tr>
         <%
               }
               }
         }
         %>
      </table>
   </form>
</body>
</html>