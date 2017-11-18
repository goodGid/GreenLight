package member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class greenlistServlet
 */
@WebServlet("/greenlistServlet")
public class greenlistServlet extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request, response);
   }

   public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
         request.setCharacterEncoding("UTF-8");
         Connection conn = DBConnection.getConnection();
         MemberDAO dao = new MemberDAO(conn);
         HttpSession session = request.getSession();
         MemberDTO dto = (MemberDTO)session.getAttribute("login_session");
         String name = dto.getName();
        
       
         
         ArrayList<String> list=null;
         list = dao.greenList(name);
       
         HttpSession se = request.getSession();
         se.setAttribute("Glist", list);
         RequestDispatcher dispatcher = request.getRequestDispatcher("Mypage.jsp");
         dispatcher.forward(request,response);
         //response.sendRedirect("services.html");
      }

}