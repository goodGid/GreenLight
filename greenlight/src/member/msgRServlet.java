package member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class msgboxServelt
 */
public class msgRServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request,response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
         request.setCharacterEncoding("UTF-8");
         Connection conn = DBConnection.getConnection();
         MemberDAO dao = new MemberDAO(conn);
         System.out.println("servlet1 connect");
         HttpSession session = request.getSession();
         
         MemberDTO dto = (MemberDTO)session.getAttribute("login_session");
         String sid = dto.getName();
         List<msgDTO> Rlist=null;
         Rlist = dao.receiveMessagebox(sid);
         
         HttpSession session1 = request.getSession();
         session1.setAttribute("Receivelist", Rlist);
         RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
         dispatcher.forward(request,response);
   }
}
