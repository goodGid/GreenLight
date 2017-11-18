package member;
import java.io.IOException;
import java.util.*;
import javax.servlet.http.*;

import com.mysql.jdbc.PreparedStatement;

import javax.servlet.*;
import java.io.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;


public class RegisterServlet extends HttpServlet{
   public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
      response.setContentType("UTF-8");
      Connection conn = DBConnection.getConnection();
      MemberDAO dao = new MemberDAO(conn);
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      PrintWriter out = response.getWriter();
      
      
      
      
      
      String ID = request.getParameter("ID");
      String password = request.getParameter("PASSWORD");
      String live = request.getParameter("LIVE");
      String character = request.getParameter("CHARACTER");
      String hobby = request.getParameter("HOBBY");
      String reli = request.getParameter("RELI");
      String name = request.getParameter("NAME");
      String classof = request.getParameter("CLASSOF");
      String age = request.getParameter("AGE");
      String introduce = request.getParameter("INTRODUCE");
      String gender = request.getParameter("GENDER");
      String lasttime = "12345";
      int light=4;
      String sql="select * from member where id=?";
      
      try{
			 pstmt = (PreparedStatement) conn.prepareStatement(sql);
			 pstmt.setString(1, ID);
			 rs = pstmt.executeQuery();

			 if(rs.next()){
				 out.println("<script>");
				out.println("alert('ID Alreadt Exist');");
					out.println("location.href='login.html'");
					out.println("</script>");
					out.close();
			 }
			 else{
				 MemberDTO dto = new MemberDTO();
			      dto.setID(ID);
			      dto.setPW(password);
			      dto.setlive(live);
			      dto.setCharacter(character);
			      dto.sethobby(hobby);
			      dto.setreli(reli);
			      dto.setName(name);
			      dto.setClassof(classof);
			      dto.setAge(age);
			      dto.setintroduce(introduce);
			      dto.setgender(gender);
			      dto.setlight(light);
			      dto.setlasttime(lasttime);
			      dao.insertData(dto);
			      
			      out.println("<script>");
			      out.println("alert('SUCCESS');");
			      out.println("location.href='login.html'");
			      out.println("</script>");
			      out.close();
			 }
			 rs.close();
			 pstmt.close();
			 conn.close();
			 
		 }catch(SQLException se){
			 System.out.println(se.getMessage());
		 }
      
   }
}