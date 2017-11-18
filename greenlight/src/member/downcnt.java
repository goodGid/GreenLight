package member;
import java.util.*;

import javax.servlet.http.*;
import javax.servlet.*;

import java.io.*;
import java.sql.Connection;

import member.MemberDTO;
import member.DBConnection;

public class downcnt extends HttpServlet{
   public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
      request.setCharacterEncoding("UTF-8");
         response.setCharacterEncoding("UTF-8");
         response.setContentType("text/html; charset=UTF-8");
         PrintWriter out = response.getWriter();
         
      Connection conn = DBConnection.getConnection();

      MemberDAO dao = new MemberDAO(conn);
      HttpSession session = request.getSession();
      MemberDTO dto = (MemberDTO)session.getAttribute("login_session");
     
      String url = request.getRequestURI();
     // String ID = dto.getID();
      String ID=request.getParameter("ID");
      int temp = dto.getlight();
      
      System.out.println("MY ID :  " + ID);
      
    if(temp>0)
    {
      temp-=1;   
      dto.setlight(temp);
      dao.updatelight(dto, ID);
      response.sendRedirect("detailfinal.jsp");
    }else
    {
       temp=0;
       dto.setlight(temp);
        dao.updatelight(dto, ID);
        out.println("<script>"); 
        out.println("alert('전구가 부족합니다.');");
        out.println("location.href='detail.jsp'");
        out.println("</script>"); 
        out.close();
    
    }    
   }
}