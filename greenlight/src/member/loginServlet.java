package member;
import member.MemberDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.*;
import com.mysql.jdbc.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
/**
 * Servlet implementation class joinServlet
 */
public class loginServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
	      response.setCharacterEncoding("UTF-8");
	      response.setContentType("UTF-8");
	      request.setCharacterEncoding("UTF-8");

      Connection con = null;
       java.sql.Statement stmt = null;
       ResultSet rs = null;
       ResultSet rs1 = null;
       PrintWriter out = response.getWriter();
       String url =null;
       RequestDispatcher dispatcher = null;
       String id = request.getParameter("ID");
       String pw = request.getParameter("PASSWORD");
       
       
           try {
               
               con = DBConnection.getConnection();
               stmt = con.createStatement();
               String sql = "select `ID`, `PW`, `live`, `character`, `hobby`, `reli`, `name`, `classof`,`age`,`fileurl`,`introduce`, `gender`,`light`,`fileurl1`,`fileurl2`,`fileurl3`,`lasttime` from member where ID=+'"+id+"'"; 
               rs = stmt.executeQuery(sql);
               String db_id = null;
               String db_pw = null;
                String db_live =null;
                String db_character =null;
                String db_hobby =null;
                String db_reli =null;
                String db_name =null;
                String db_classof =null;
                String db_age =null;
                String db_fileurl =null;
                String db_introduce=null;
                String db_gender=null;
                String db_fileurl1=null;
                String db_fileurl2=null;
                String db_fileurl3=null;
                String db_lasttime=null;
                int db_light=0;
               
        
               while(rs.next()) {
                  db_id = rs.getString("ID");
                  db_pw = rs.getString("PW");
                   db_live =rs.getString("live");
                   db_character =rs.getString("character");
                   db_hobby =rs.getString("hobby");
                   db_reli =rs.getString("reli");
                   db_name =rs.getString("name");
                   db_classof =rs.getString("classof");
                   db_age =rs.getString("age");
                   db_fileurl =rs.getString("fileurl");
                   db_introduce=rs.getString("introduce");
                   db_gender=rs.getString("gender");
                   db_light=rs.getInt("light")+1;
                   db_fileurl1=rs.getString("fileurl1");
                   db_fileurl2=rs.getString("fileurl2");
                   db_fileurl3=rs.getString("fileurl3");
                   db_lasttime=rs.getString("lasttime");
               }
               if (db_id != null) {
                   if (db_pw.equals(pw)) {
                       // 로그인성공
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
                       System.out.println("logintime=" + nowDate);
                         
                       if (db_lasttime.equals(nowDate)) 
                     {
                         System.out.println("하루 안지남");
                     }else
                     {
                        db_light+=1;
                        System.out.println("하루지남");
                     }
                       HttpSession session = request.getSession();
                       session.setAttribute("login_session", new MemberDTO(db_id, db_pw ,db_live, db_character,db_hobby,db_reli,db_name, db_classof,db_age,db_fileurl,db_introduce,db_gender,db_light,db_fileurl1,db_fileurl2,db_fileurl3,db_lasttime));
                        
                       url = "index.jsp";
                       response.sendRedirect(url);
    
                   } else {
                       // password를 확인해주세요
                       request.setAttribute("login_failure_message","password를 확인해주세요");
                       out.println("<script>");
               		   out.println("alert(' Check Password !');");
               		   out.println("location.href='login.html'");
               		   out.println("</script>");
               		   out.close();
                   }
               } else {
                   // id를 확인해주세요
                   request.setAttribute("login_failure_message", "id를 확인해주세요");
                   out.println("<script>");
           		   out.println("alert(' ID Not Exist !');");
           	       out.println("location.href='login.html'");
           		   out.println("</script>");
           		   out.close();
               }
    
           } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
               //request.setAttribute("error_message", e.getMessage());
               //url = "./res/error.jsp";
               //dispatcher=request.getRequestDispatcher(url);
               //dispatcher.forward(request, response);
           } finally {
               if(rs!=null){
                   try {
                       rs.close();
                   } catch (SQLException e) {
                       // TODO Auto-generated catch block
                       e.printStackTrace();
                   }
               }
               if (stmt != null) {
                   try {
                       stmt.close();
                   } catch (SQLException e) {
                       // TODO Auto-generated catch block
                       e.printStackTrace();
                   }
               }
               if (con != null) {
                   try {
                       con.close();
                   } catch (SQLException e) {
                       // TODO Auto-generated catch block
                       e.printStackTrace();
                   }
               }
    
           }
       }
}