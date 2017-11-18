<%@ page language="java" contentType="text/html; charset=EUC-KR"
     pageEncoding="EUC-KR"%>
 <%
  request.setCharacterEncoding("UTF-8");
  
  session.invalidate();
 //username 으로 들어온 session을 제거
 response.sendRedirect("login.html");
 // 페이지의 메인으로 이동
%>