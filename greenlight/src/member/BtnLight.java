package member;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import member.*;

/**
 * Servlet implementation class BtnLight
 */
@WebServlet("/BtnLight")
public class BtnLight extends HttpServlet {
   private static final long serialVersionUID = 1L;
   private Connection con = null;
   
   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      HttpSession session = request.getSession();
      Statement stmt = null;
      String sql;
      String nowName;
      
      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      
      MemberDTO nowDto = (MemberDTO)session.getAttribute("login_session");
      
      String targetName=request.getParameter("name");
      nowName = nowDto.getName();
      
      

      
      
      
         
      System.out.println("nowID : " + nowName );
      System.out.println("targetID :  " + targetName);
      
      sql = "insert into ssome (`greenSend`,`greenReceive`) VALUES ('" + nowName +"', '" + targetName +"')";      
      try {
         
         con = (Connection) DBConnection.getConnection();
           stmt = (Statement) con.createStatement();
         
           System.out.println(sql);
         stmt.execute(sql);

         System.out.println("Record is updated to DBUSER table!");

      } catch (SQLException e) {

         System.out.println(e.getMessage());
      
      }
      
      out.println("<script>"); 
      out.println("alert('그린라이트를 보냈습니다');");
      out.println("location.href='services.jsp'");
      out.println("</script>"); 
      out.close();
      
//          response.sendRedirect("services.jsp");
   
   }

}