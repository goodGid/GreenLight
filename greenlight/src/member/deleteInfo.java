package member;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.*;
import javax.servlet.*;

import java.io.*;
import java.sql.Connection;

import member.MemberDTO;
import member.DBConnection;

public class deleteInfo extends HttpServlet{
   public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
      request.setCharacterEncoding("UTF-8");
      Connection conn = DBConnection.getConnection();
      MemberDAO dao = new MemberDAO(conn);
      HttpSession session = request.getSession();
      MemberDTO dto = (MemberDTO)session.getAttribute("login_session");
     
     System.out.println("ggod");
      String ID = dto.getID();
      dao.deleteData(ID);
      System.out.println("ggod");
      PrintWriter out = response.getWriter();
      out.println("<script>");
      out.println("alert('SUCCESS');");
      out.println("location.href='login.html'");
      out.println("</script>");
      out.close();
   }
}