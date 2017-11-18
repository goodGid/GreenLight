package member;
import java.util.*;

import javax.servlet.http.*;
import javax.servlet.*;

import java.io.*;
import java.sql.Connection;
import java.sql.SQLException;

import member.MemberDTO;
import member.DBConnection;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MessageServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
       doPost(request,response);
    }
   public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
      response.setCharacterEncoding("UTF-8");
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");

      Connection conn = DBConnection.getConnection();
      MemberDAO dao = new MemberDAO(conn);
      System.out.println("servlet connect");
      HttpSession session = request.getSession();
      
      MemberDTO dto = (MemberDTO)session.getAttribute("login_session");
      String sid = dto.getName();
      HttpSession session1 = request.getSession();
      String rid = (String)session1.getAttribute("rID");
      String content = request.getParameter("Content");
      System.out.println(sid);
      System.out.println(rid);
      System.out.println(content);
      int n=0;
      try {
      n=dao.sendMessage(rid, sid, content);
      
   
   } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
      
   }
      if(n==0){
    	  PrintWriter out = response.getWriter();
          out.println("<script>"); 
          out.println("alert('쪽지를 전송하지 못했습니다. 그린라이트를 확인하세요');");
          out.println("location.href='detail.jsp'");
          out.println("</script>"); 
          out.close();
      }
      PrintWriter out = response.getWriter();
      out.println("<script>"); 
      out.println("alert('쪽지 전송 성공');");
      out.println("location.href='detail.jsp'");
      out.println("</script>"); 
      out.close();
     
      //RequestDispatcher dispatcher = request.getRequestDispatcher("detail.jsp");
     // dispatcher.forward(request,response);
   }
}