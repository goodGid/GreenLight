


package member;
import java.util.*;

import javax.servlet.http.*;


import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
 
import member.MemberDTO;
import member.DBConnection;


import javax.servlet.*;
import com.mysql.jdbc.Statement;
import java.io.IOException;



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
public class totalcnt extends HttpServlet {
   private static final long serialVersionUID = 1L;
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request,response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
	   
	   request.setCharacterEncoding("UTF-8");
	      response.setCharacterEncoding("UTF-8");
	      response.setContentType("text/html; charset=UTF-8");
         Connection conn = DBConnection.getConnection();
         MemberDAO dao = new MemberDAO(conn);
         PrintWriter out = response.getWriter();
         System.out.println("servlet connect");

        
         ArrayList<Integer> colCountAll = new ArrayList<Integer>();
         try {
        	 colCountAll=dao.totalcnt();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         //out.println("총회원"+a);
        // out.println("여자"+b);
        // out.println("남자"+c);
      
           out.println("total= "+colCountAll.get(0));
           out.println("male= "+colCountAll.get(1));
           out.println("femal= "+colCountAll.get(2));
           HttpSession session = request.getSession();
           session.setAttribute("list", colCountAll);
           RequestDispatcher dispatcher = request.getRequestDispatcher("membership.jsp");
           dispatcher.forward(request,response);
        
         
   }
}
