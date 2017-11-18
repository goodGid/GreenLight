<%@page import="member.MemberDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 성공</title>
</head>
<body>
    <%
        MemberDTO mem = (MemberDTO) session.getAttribute("login_session");
    %>
    <table align="center">
        <tr>
            <td>id :</td>
            <td><%=mem.getID()%></td>
 
        </tr>
      	 <tr>
            <td>이름 :</td>
            <td><%=mem.getName()%></td>
 
        </tr>
        <tr>
            <td colspan=2 align="center">님 <b>환영합니다.</b>
 
            </td>
        </tr>
        <tr>
            <td colspan=2>
            </td>
        </tr>
        <tr>
            <td colspan=2>
            </td>
        </tr>
        <tr>
            <td colspan=2>
            </td>
        </tr>
        <tr>
            <td colspan=2>
            </td>
        </tr>
        <tr>
            <td colspan=2><input type = "button" onclick="location.href = '../Logout'" value = "로그아웃">
            </td>
        </tr>
         <tr>
            <td colspan=2><input type = "button" onclick="location.href = 'Home.html'" value = "Home">
            </td>
        </tr>
    </table>
 
</body>
</html>