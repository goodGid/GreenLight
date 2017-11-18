package member;
import member.*;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;


public class AgeSearchServlet extends HttpServlet{
   public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
      request.setCharacterEncoding("UTF-8");
      Connection conn = DBConnection.getConnection();
      MemberDAO dao = new MemberDAO(conn);
      String search = null;
      String age = request.getParameter("age");
      String live = request.getParameter("live");
      System.out.println(age);
      System.out.println(live);
      List<MemberDTO> list=null;
      try {
         list = dao.getAgeData(age, live);
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      /*
      for(int i=0;i<list.size();i++){
         MemberDTO dto = list.get(i);
         System.out.println();
         System.out.println("ID:"+dto.getID());
         System.out.println("PW:"+dto.getPW());
         System.out.println("LIVE:"+dto.getlive());
         System.out.println("HOBBY:"+dto.gethobby());
         System.out.println("RELI:"+dto.getreli());
         System.out.println("PHOTO:"+dto.getPhoto());
         System.out.println("CLASSOF:"+dto.getClassof());
         System.out.println("AGE:"+dto.getAge());
         System.out.println("GENDER"+dto.getgender());
         System.out.println("INTRODUCE:"+dto.getintroduce());
         System.out.println("HOBBY:"+dto.gethobby());
      }
   */   
      HttpSession session = request.getSession();
      session.setAttribute("list", list);
      RequestDispatcher dispatcher = request.getRequestDispatcher("services.jsp");
      dispatcher.forward(request,response);
      //response.sendRedirect("services.html");
   }
   
}