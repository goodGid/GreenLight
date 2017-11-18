package member;
import member.*;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;


public class detailServlet extends HttpServlet{
   public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
	   Connection con = null;
       java.sql.Statement stmt = null;
       ResultSet rs = null;
       String url =null;
       RequestDispatcher dispatcher = null;
       String id = request.getParameter("id");
       System.out.println(id);
       try {
               
               con = DBConnection.getConnection();
               stmt = con.createStatement();
               String sql = "select `ID`, `PW`, `live`, `character`, `hobby`, `reli`, `name`, `classof`,`age`,`fileurl`,`introduce`, `gender`,`light`,`fileurl1`,`fileurl2`,`fileurl3`,`lasttime` from member where ID=+'"+id+"'"; 
               rs = stmt.executeQuery(sql);
               String target_id = null;
               String target_pw = null;
                String target_live =null;
                String target_character =null;
                String target_hobby =null;
                String target_reli =null;
                String target_name =null;
                String target_classof =null;
                String target_age =null;
                String target_fileurl =null;
                String target_introduce=null;
                String target_gender=null;
                String target_fileurl1=null;
                String target_fileurl2=null;
                String target_fileurl3=null;
                String target_lasttime=null;
                int target_lihgt=0;
        
               while(rs.next()){
                  target_id = rs.getString("ID");
                  target_pw = rs.getString("PW");
                   target_live =rs.getString("live");
                   target_character =rs.getString("character");
                   target_hobby =rs.getString("hobby");
                   target_reli =rs.getString("reli");
                   target_name =rs.getString("name");
                   target_classof =rs.getString("classof");
                   target_age =rs.getString("age");
                   target_fileurl =rs.getString("fileurl");
                   target_introduce=rs.getString("introduce");
                   target_gender=rs.getString("gender");
                   target_lihgt=rs.getInt("light");
                   target_fileurl1=rs.getString("fileurl1");
                   target_fileurl2=rs.getString("fileurl2");
                   target_fileurl3=rs.getString("fileurl3");
                   target_lasttime=rs.getString("lasttime");
                   System.out.println(target_id);
                   System.out.println(target_pw);
                   System.out.println(target_live);
                   System.out.println(target_character);
                   System.out.println(target_hobby);
                   System.out.println(target_reli);
                   System.out.println(target_name);
                   System.out.println(target_fileurl);
                   System.out.println(target_fileurl1);
                   System.out.println(target_fileurl2);
                   System.out.println(target_fileurl3);
                   System.out.println(target_lasttime);
               }
               HttpSession session = request.getSession();
               session.setAttribute("targetsession", new MemberDTO(target_id, target_pw ,target_live, target_character,target_hobby,target_reli,target_name, target_classof,target_age,target_fileurl,target_introduce,target_gender,target_lihgt,target_fileurl1,target_fileurl2,target_fileurl3,target_lasttime));
               dispatcher = request.getRequestDispatcher("detail.jsp");
               dispatcher.forward(request,response);
       }
           catch (SQLException e) {
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