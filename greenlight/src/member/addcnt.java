
package member;
import java.util.*;
import java.lang.StringBuffer;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import javax.servlet.http.*;
import javax.servlet.*;

import java.io.*;
import java.sql.Connection;

import member.MemberDTO;
import member.DBConnection;

public class addcnt extends HttpServlet{
   public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
      request.setCharacterEncoding("UTF-8");
         response.setCharacterEncoding("UTF-8");
         response.setContentType("text/html; charset=UTF-8");
         PrintWriter out = response.getWriter();
         
      Connection conn = DBConnection.getConnection();

      MemberDAO dao = new MemberDAO(conn);
      HttpSession session = request.getSession();
      MemberDTO dto = (MemberDTO)session.getAttribute("login_session");
      
      Calendar now = Calendar.getInstance();
      int yy = now.get(Calendar.YEAR);
      int mm = now.get(Calendar.MONTH);
      int dd = now.get(Calendar.DAY_OF_MONTH);
      StringBuffer sb = new StringBuffer();
      sb.append(yy);
      sb.append("-");
      sb.append(mm+1);
      sb.append("-");
      sb.append(dd);
      String nowDate = sb.toString();
      System.out.println("logouttime=" + nowDate);
      String url = request.getRequestURI();
      String ID=dto.getID();
      String time = nowDate;
      
      System.out.println("MY ID?? :  " + ID);
      System.out.println("logouttime=" + time);
      dto.setlasttime(time);
      dao.updatelasttime(dto, ID);
      response.sendRedirect("logout.jsp");
  
   }
}