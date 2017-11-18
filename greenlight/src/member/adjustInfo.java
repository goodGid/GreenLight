package member;
import java.io.IOException;
import java.util.*;

import javax.servlet.http.*;
import javax.servlet.*;

import java.io.*;
import java.sql.Connection;

import member.MemberDTO;
import member.DBConnection;

public class adjustInfo extends HttpServlet{
   public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("text/html; charset=UTF-8");
      Connection conn = DBConnection.getConnection();
      MemberDAO dao = new MemberDAO(conn);
      HttpSession session = request.getSession();
      MemberDTO dto = (MemberDTO)session.getAttribute("login_session");
     
      String url = request.getRequestURI();
      String ID = dto.getID();
      String password = request.getParameter("PW");
      String live = request.getParameter("live");
      String character = request.getParameter("character");
      String hobby = request.getParameter("hobby");
      String reli = request.getParameter("reli");
      String name = request.getParameter("name");
      String introduce = request.getParameter("introduce");
      String gender = request.getParameter("gender");
      String classof = request.getParameter("classof");
      String age = request.getParameter("age");
      

      System.out.println(ID);
      System.out.println(password);
      System.out.println(live);
      System.out.println(character);
      System.out.println(hobby);
      System.out.println(reli);
      System.out.println(name);
      System.out.println(classof);
      System.out.println(age);
      System.out.println(introduce);
      
     
      dto.setID(ID);
      dto.setPW(password);
      dto.setlive(live);
      dto.setCharacter(character);
      dto.sethobby(hobby);
      dto.setreli(reli);
      dto.setName(name);
      dto.setClassof(classof);
      dto.setAge(age);
      dto.setgender(gender);
      dto.setintroduce(introduce);

      
      
      dao.updateData(dto, ID);
      
      
      response.sendRedirect("Mypage.jsp");
   }
}