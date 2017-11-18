package member;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class deleteMessage
 */
public class deleteMessage2 extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      response.setCharacterEncoding("UTF-8");
	      response.setContentType("text/html; charset=UTF-8");
	      request.setCharacterEncoding("UTF-8");
	      PrintWriter out = response.getWriter();
		 int deleteOn = 0;
         Connection conn = DBConnection.getConnection();
         MemberDAO dao = new MemberDAO(conn);
         System.out.println("servlet1 connect");
         HttpSession session = request.getSession();
         
         MemberDTO dto = (MemberDTO)session.getAttribute("login_session");
         String rName = request.getParameter("name");
         String sName = dto.getName();
         try {
			dao.deleteMessage(rName, sName);

			  out.println("<script>"); 
		      out.println("alert('삭제에 성공했습니다.');");
		      out.println("location.href='sendMessagebox'");
		      out.println("</script>"); 
		      out.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         
         
       
         
        
        
        
         
         
        
         //RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
         //dispatcher.forward(request,response);
	}

}
