package member;
import java.io.IOException;
import java.util.*;

import javax.servlet.http.*;
import javax.servlet.*;

import java.io.*;
import java.sql.Connection;

import member.MemberDTO;
import member.DBConnection;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class adjustPhoto3 extends HttpServlet{
   public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
      request.setCharacterEncoding("euc-kr");
      Connection conn = DBConnection.getConnection();
      MemberDAO dao = new MemberDAO(conn);
      HttpSession session = request.getSession();
      MemberDTO dto = (MemberDTO)session.getAttribute("login_session");
      String realFolder = "";
      int maxSize = 1024*1024*5;
      String filename="";
      String encType = "euc-kr";
      String savefile = "img";
      ServletContext scontext = getServletContext();
      realFolder = scontext.getRealPath(savefile);
      try{
         MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
         Enumeration<?> files = multi.getFileNames();
            String file1 = (String)files.nextElement();
            filename = multi.getFilesystemName(file1);
        } catch(Exception e) {
         e.printStackTrace();
        }
      
      String fullpath = "img/" + filename;

      
      String ID = dto.getID();
      dto.setPhoto3(fullpath);
      System.out.println(fullpath);
    
        //session.setAttribute("login_session", new MemberDTO(fileurl));
      
      dao.updatePhoto3(fullpath, ID);
      
      
      response.sendRedirect("Mypage.jsp");
   }
}