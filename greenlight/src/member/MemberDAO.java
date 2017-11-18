package member;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.Date;
import java.util.*;
import java.text.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class MemberDAO {
 
   //생성자 -> 오라클 데이터베이스 연결 객체 지정
   private Connection conn = null;
   public MemberDAO(Connection conn) {
     this.conn = conn;       
   }
 
   public MemberDAO() {}
   //입력 메소드
   public void insertData(MemberDTO dto) {
     
     PreparedStatement pstmt = null;
     int result = 0;
     try {
       //hitcount는 0, created는 SYSDATE로 입력.
      
        

       String sql = "insert into member (`ID`,`PW`, `live`, `character`,`hobby`,`reli`,`name`,`classof`,`age`,`fileurl`, `introduce`, `gender`,`light`,`lasttime`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)"; 
       

       pstmt = conn.prepareStatement(sql);   
       pstmt.setString(1, dto.getID());
       pstmt.setString(2, dto.getPW());
       pstmt.setString(3, dto.getlive());
       pstmt.setString(4, dto.getCharacter());
       pstmt.setString(5, dto.gethobby());
       pstmt.setString(6, dto.getreli());
       pstmt.setString(7, dto.getName());
       pstmt.setString(8, dto.getClassof());
       pstmt.setString(9, dto.getAge());
       pstmt.setString(10, dto.getPhoto());
       pstmt.setString(11, dto.getintroduce());
       pstmt.setString(12, dto.getgender());
       pstmt.setInt(13, dto.getlight());
       pstmt.setString(14, dto.getlasttime());
       System.out.println("111");
       pstmt.executeUpdate();
        System.out.println("111");
      //   stmt = conn.prepareStatement(sql);
      // pstmt.setString(1, dto.getName());  
       //pstmt.setString(2, dto.getClassof());  //userPwd
       //pstmt.setString(3, dto.getAge());  //userName
      // stmt.setString(1, dto.getCharacter());  //birth
      // stmt.setString(2, dto.getlive());  //tel
       //stmt.setString(3, dto.gethobby());
       //pstmt.setString(7, dto.getreli());
       
       
       
       //stmt.executeUpdate(sql);
       System.out.println("111");

      // System.out.println(result);   
       pstmt.close();
       
     } catch (Exception e) {
       System.out.println(e.toString());
     }
     //return result;
   }
   
   //전체 자료 읽기 메소드(오버로딩)
   
   
 //삭제 메소드
   public int deleteData(String userId){
       int result = 0;
       
       PreparedStatement pstmt = null;
       String sql;
       
       try {
           
           sql="DELETE from member where `ID`='"+userId+"'";
           
           pstmt = conn.prepareStatement(sql);
          
           result=pstmt.executeUpdate();
           
       } catch (Exception e) {
           System.out.println(e.toString());
       }

       return result;
   }
   /*
   //관리자용 삭제 메소드(오버로딩)
   public int deleteData(String userId) {
     int result = 0;
     PreparedStatement pstmt = null;
     String sql;
     try {
       sql = "DELETE FROM member WHERE userId=?";
       pstmt = conn.prepareStatement(sql);
       pstmt.setString(1, userId);  //userId
       result = pstmt.executeUpdate();
       pstmt.close();
     } catch (Exception e) {
        System.out.println(e.toString());
     }
     return result;
   }
   
   //특정 회원 읽기 메소드
   public MemberDTO getReadData(String id, String pw) {
     MemberDTO dto = null;
     PreparedStatement pstmt = null;
     ResultSet rs = null;
     String sql = "";
     try {
      sql = "SELECT userId, userName, TO_CHAR(birth, 'YYYY-MM-DD') as birth, tel, TO_CHAR(created, 'YYYY-MM-DD') as created";
       sql += " FROM member WHERE userId=? AND userPwd=?";
       pstmt = conn.prepareStatement(sql);
       pstmt.setString(1, id);
       pstmt.setString(2, pw);
       rs = pstmt.executeQuery();
       if (rs.next()) {
         dto = new MemberDTO();
         dto.setUserId(rs.getString(1));  //userId
         dto.setUserName(rs.getString(2));  //userName
         dto.setBirth(rs.getString(3));  //birth
         dto.setTel(rs.getString(4));  //tel
         dto.setCreated(rs.getString(5));  //created
       }
       rs.close();
       pstmt.close();
     } catch (Exception e) {
       System.out.println(e.toString());
     }
     return dto;
   }
   
   //특정 회원 읽기 메소드 (오버라이딩)
   public MemberDTO getReadData(String id) {
     MemberDTO dto = null;
     PreparedStatement pstmt = null;
     ResultSet rs = null;
     String sql = "";
     try {
       sql = "SELECT userId, userName, TO_CHAR(birth, 'YYYY-MM-DD') as birth, tel, TO_CHAR(created, 'YYYY-MM-DD') as created";
       sql += " FROM member WHERE userId=?";
      pstmt = conn.prepareStatement(sql);
       pstmt.setString(1, id);
       rs = pstmt.executeQuery();
       if (rs.next()) {
         dto = new MemberDTO();
         dto.setUserId(rs.getString(1));  //userId
         dto.setUserName(rs.getString(2));  //userName
         dto.setBirth(rs.getString(3));  //birth
         dto.setTel(rs.getString(4));  //tel
         dto.setCreated(rs.getString(5));  //created
       }
       rs.close();
       pstmt.close();
     } catch (Exception e) {
       System.out.println(e.toString());
     }
     return dto;
   }
   */
 public void updateData(MemberDTO dto, String ID) {
       PreparedStatement pstmt = null;
        String sql;
        try {
          
          sql = "UPDATE member SET `ID`=?,`PW`=?, `live`=?, `character`=?,`hobby`=?,`reli`=?,`name`=?,`classof`=?,`age`=?,`gender`=?,`introduce`=? where `ID`=+'"+ID+"'";
     
       pstmt = conn.prepareStatement(sql);
       
         pstmt.setString(1, dto.getID());
         pstmt.setString(2, dto.getPW());
         pstmt.setString(3, dto.getlive());
         pstmt.setString(4, dto.getCharacter());
         pstmt.setString(5, dto.gethobby());
         pstmt.setString(6, dto.getreli());
         pstmt.setString(7, dto.getName());
         pstmt.setString(8, dto.getClassof());
         pstmt.setString(9, dto.getAge());
         pstmt.setString(10, dto.getgender());
         pstmt.setString(11, dto.getintroduce());
         
       pstmt.executeUpdate();
       pstmt.close();
       }
         catch (Exception e) {
          System.out.println(e.toString());
        }
      }
 
 
 
 
 public void updatePhoto(String photo, String ID) {
       PreparedStatement pstmt = null;
        String sql;
        try {
          
          sql = "UPDATE member SET `fileurl`=? where `ID`=+'"+ID+"'";
     
       pstmt = conn.prepareStatement(sql);
       
       pstmt.setString(1, photo);
       
       pstmt.executeUpdate();
       pstmt.close();
       }
         catch (Exception e) {
          System.out.println(e.toString());
        }
      }
 public void updatePhoto1(String photo, String ID) {
     PreparedStatement pstmt = null;
      String sql;
      try {
        
        sql = "UPDATE member SET `fileurl1`=? where `ID`=+'"+ID+"'";
   
     pstmt = conn.prepareStatement(sql);
     
     pstmt.setString(1, photo);
     
     pstmt.executeUpdate();
     pstmt.close();
     }
       catch (Exception e) {
        System.out.println(e.toString());
      }
    }
 public void updatePhoto2(String photo, String ID) {
     PreparedStatement pstmt = null;
      String sql;
      try {
        
        sql = "UPDATE member SET `fileurl2`=? where `ID`=+'"+ID+"'";
   
     pstmt = conn.prepareStatement(sql);
     
     pstmt.setString(1, photo);
     
     pstmt.executeUpdate();
     pstmt.close();
     }
       catch (Exception e) {
        System.out.println(e.toString());
      }
    }
 public void updatePhoto3(String photo, String ID) {
     PreparedStatement pstmt = null;
      String sql;
      try {
        
        sql = "UPDATE member SET `fileurl3`=? where `ID`=+'"+ID+"'";
   
     pstmt = conn.prepareStatement(sql);
     
     pstmt.setString(1, photo);
     
     pstmt.executeUpdate();
     pstmt.close();
     }
       catch (Exception e) {
        System.out.println(e.toString());
      }
    }
 public List<MemberDTO> getListsData(String name, String gender) throws SQLException {
     List<MemberDTO> lists = new ArrayList<MemberDTO>();
     PreparedStatement pstmt = null;
     ResultSet rs = null;
     String search=null;
     
     System.out.println(gender);
     System.out.println(name);
     //전체 데이터를 읽어오는 것으로 작성함.
   if(name=="")
      search ="select * from member where gender ='"+gender+"'";
   else if(gender==null)
      search ="select * from member where name ='"+name+"'";
   else
        search ="select * from member where gender ='"+gender+"' and name='"+name+"'";
   
     pstmt = conn.prepareStatement(search);
     rs = pstmt.executeQuery(search);
     System.out.println(search);
     try {
        System.out.println("5234534");
       while (rs.next()) {
         //데이터 항목이 여러개인 경우
         //MemberDTO 객체에 저장해서 관리
          System.out.println("2");
         MemberDTO dto = new MemberDTO();
         dto.setID(rs.getString(2));
         dto.setPW(rs.getString(3));
         dto.setlive(rs.getString(4));
         dto.setCharacter(rs.getString(5));
         dto.sethobby(rs.getString(6));
         dto.setreli(rs.getString(7));
         dto.setName(rs.getString(8));
         dto.setClassof(rs.getString(9));
         dto.setAge(rs.getString(10));
         dto.setPhoto(rs.getString(11));
         dto.setintroduce(rs.getString(13));
         dto.setgender(rs.getString(12));
         
         //데이터베이스에서 읽어온 데이터가 여러개인 경우
         //컬렉션에 추가
         lists.add(dto);
         System.out.println("3");
       }
       rs.close();
       pstmt.close();
     } catch(SQLException se){
         System.out.println(se.getMessage());
      }finally{
         try{
            if(rs!=null)  rs.close();
            if(pstmt!=null)  pstmt.close();
            if(conn!=null)  conn.close();
         }catch(SQLException se){
            System.out.println(se.getMessage());
         }
      }
     return lists;
   }


 public List<MemberDTO> getAgeData(String age, String live) throws SQLException {
     List<MemberDTO> lists = new ArrayList<MemberDTO>();
     PreparedStatement pstmt = null;
     ResultSet rs = null;
     String search=null;
     System.out.println(age);
     System.out.println(live);

     //전체 데이터를 읽어오는 것으로 작성함.
   if(live.equals("시/도를입력하세요"))
      search ="select * from member where age ='"+age+"'";
   else if(age=="")
      search ="select * from member where live ='"+live+"'";
   else
        search ="select * from member where age ='"+age+"' and live='"+live+"'";
   
     pstmt = conn.prepareStatement(search);
     rs = pstmt.executeQuery(search);
     System.out.println(search);
     try {
       while (rs.next()) {
         //데이터 항목이 여러개인 경우
         //MemberDTO 객체에 저장해서 관리
         MemberDTO dto = new MemberDTO();
         dto.setID(rs.getString(2));
         dto.setPW(rs.getString(3));
         dto.setlive(rs.getString(4));
         dto.setCharacter(rs.getString(5));
         dto.sethobby(rs.getString(6));
         dto.setreli(rs.getString(7));
         dto.setName(rs.getString(8));
         dto.setClassof(rs.getString(9));
         dto.setAge(rs.getString(10));
         dto.setPhoto(rs.getString(11));
         dto.setintroduce(rs.getString(13));
         dto.setgender(rs.getString(12));
         
         //데이터베이스에서 읽어온 데이터가 여러개인 경우
         //컬렉션에 추가
         lists.add(dto);
       }
       rs.close();
       pstmt.close();
     } catch(SQLException se){
         System.out.println(se.getMessage());
      }finally{
         try{
            if(rs!=null)  rs.close();
            if(pstmt!=null)  pstmt.close();
            if(conn!=null)  conn.close();
         }catch(SQLException se){
            System.out.println(se.getMessage());
         }
      }
     return lists;
   }


public ArrayList<MemberDTO> getListsData(String ID) {
    ArrayList<MemberDTO> lists = new ArrayList<MemberDTO>();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql;
    
    System.out.println("4");
   
    //전체 데이터를 읽어오는 것으로 작성함.
    
    try {
      sql ="select * from member where ssome ='"+ID+"'";
      pstmt = conn.prepareStatement(sql);
     
      rs = pstmt.executeQuery(sql);
     
      //데이터베이스에서 읽어온 데이터가 여러개인 경우
      //반복문으로 처리 
      while (rs.next()) {
        //데이터 항목이 여러개인 경우
        //MemberDTO 객체에 저장해서 관리
        MemberDTO dto = new MemberDTO();
        dto.setID(rs.getString(2));
        dto.setPW(rs.getString(3));
        dto.setlive(rs.getString(4));
        dto.setCharacter(rs.getString(5));
        dto.sethobby(rs.getString(6));
        dto.setreli(rs.getString(7));
        dto.setName(rs.getString(8));
        dto.setClassof(rs.getString(9));
        dto.setAge(rs.getString(10));
        dto.setPhoto(rs.getString(11));
        dto.setgender(rs.getString(13));
        dto.setintroduce(rs.getString(14));
        
        //데이터베이스에서 읽어온 데이터가 여러개인 경우
        //컬렉션에 추가
        lists.add(dto);
      }
      rs.close();
      pstmt.close();
      
    } catch (Exception e) {
      System.out.println(e.toString());

    }
    return lists;
  }



public int sendMessage(String rID, String sID, String content) throws SQLException, IOException {
    

    PreparedStatement pstmt = null;
    
     Connection con = null;
     con = DBConnection.getConnection();
     int k=0;
     String sql;
      String sql1=null;
      String sql2=null;
      ResultSet rs1 =null;
      ResultSet rs2 =null;                           
      int num1=0 , num2=0;
      sql1 = "select num from ssome where `greenSend` ='"+rID+"'and `greenReceive`= '"+sID+"'";
      sql2 = "select num from ssome where `greenSend` ='"+sID+"'and `greenReceive`='"+rID+"'";
      pstmt=conn.prepareStatement(sql1);
      rs1 = pstmt.executeQuery();
      if(rs1.next()){
         num1 = rs1.getInt("num");
      }
      pstmt = conn.prepareStatement(sql2);
      rs2 = pstmt.executeQuery();
      if(rs2.next()){
         num2 = rs2.getInt("num");    
      }
      System.out.println(num1);
      System.out.println(num2);
      if(num1 != 0 && num2 !=0){
      try {
        pstmt = null;
        sql = "insert into messagebox (`recipient`,`sender`, `content`, `date`) VALUES (?,?,?,?)"; 
        pstmt = conn.prepareStatement(sql);
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
        String today = formatter.format(new java.util.Date());
     
       pstmt.setString(1, rID);
       pstmt.setString(2, sID);
       pstmt.setString(3, content);
       pstmt.setString(4, today);
     pstmt.executeUpdate();
     pstmt.close();
     k=1; }
       catch (Exception e) {
        System.out.println(e.toString());
      }
     }
      else{
       System.out.println("쪽지를 보낼 수 없습니다.");
       k=0;
      }
      return k;
    }

public ArrayList<String> coupleId(String rID, String sID) throws SQLException{
    
	ArrayList<String> lists = new ArrayList<String>();
	 PreparedStatement pstmt = null;
	    
     Connection con = null;
     con = DBConnection.getConnection();

     String sql;
      String sql1=null;
      String sql2=null;
      ResultSet rs = null;
      ResultSet rs1 =null;
      ResultSet rs2 =null;                           
      int num1=0 , num2=0;
      sql1 = "select num from ssome where `greenSend` ='"+rID+"'and `greenReceive`= '"+sID+"'";
      sql2 = "select num from ssome where `greenSend` ='"+sID+"'and `greenReceive`='"+rID+"'";
      pstmt=conn.prepareStatement(sql1);
      rs1 = pstmt.executeQuery();
      if(rs1.next()){
         num1 = rs1.getInt("num");
      }
      pstmt = conn.prepareStatement(sql2);
      rs2 = pstmt.executeQuery();
      if(rs2.next()){
         num2 = rs2.getInt("num");    
      }
      System.out.println(num1);
      System.out.println(num2);
      try {
        pstmt = null;
        sql = "select greenSend from ssome where `num` ='"+num1+"'";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery(sql);
        while(rs.next()){
            //데이터 항목이 여러개인 경우
            //MemberDTO 객체에 저장해서 관리
            
            
            
            //데이터베이스에서 읽어온 데이터가 여러개인 경우
            //컬렉션에 추가
            lists.add(rs.getString(1));
          }
          rs.close();
          pstmt.close();
          
        } catch (Exception e) {
          System.out.println(e.toString());

        }

	return lists;
    }

 public ArrayList<msgDTO> recieveMessagebox(String sID){
    ArrayList<msgDTO> lists = new ArrayList<msgDTO>();
     ResultSet rs = null;
    PreparedStatement pstmt = null;
     String sql;
     try {
         System.out.println("1234");

       sql = "select recipient, sender, content from messagebox where `recipient` ='"+sID+"'";
  
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery(sql);
    System.out.println("1234");
    System.out.println(rs.next());
    while (rs.next()) {
      //데이터 항목이 여러개인 경우
      //MemberDTO 객체에 저장해서 관리
      msgDTO dto = new msgDTO();
      System.out.println("345");
      dto.setReci(rs.getString(1));
      System.out.println("678");
      dto.setSender(rs.getString(2));
      System.out.println("910");
      dto.setContent(rs.getString(3));
      System.out.println("1112");
     System.out.println(dto.getReci());
     System.out.println(dto.getSender());
     System.out.println(dto.getContent());
      //데이터베이스에서 읽어온 데이터가 여러개인 경우
      //컬렉션에 추가
      lists.add(dto);
    }
    rs.close();
    pstmt.close();
   }
      catch (Exception e) {
       System.out.println(e.toString());
     }
     return lists;
}
 
 public ArrayList<String> greenList(String name) {
     ArrayList<String> lists = new ArrayList<String>();
     PreparedStatement pstmt = null;
     ResultSet rs = null;
     String sql;
     
     System.out.println("4");
    
     //전체 데이터를 읽어오는 것으로 작성함.
     
     try {
       sql ="select greenSend from ssome where greenReceive ='"+name+"'";
       pstmt = conn.prepareStatement(sql);
      
       rs = pstmt.executeQuery(sql);
      
       //데이터베이스에서 읽어온 데이터가 여러개인 경우
       //반복문으로 처리 
       while(rs.next()){
         //데이터 항목이 여러개인 경우
         //MemberDTO 객체에 저장해서 관리
         
         
         
         //데이터베이스에서 읽어온 데이터가 여러개인 경우
         //컬렉션에 추가
         lists.add(rs.getString(1));
       }
       rs.close();
       pstmt.close();
       
     } catch (Exception e) {
       System.out.println(e.toString());

     }
     return lists;
   }
 
 public void deleteMessage(String rName, String sName ) throws SQLException, IOException
 {
    

     PreparedStatement pstmt = null;
    System.out.println(rName);
    System.out.println(sName);
     Connection con = null;
     con = DBConnection.getConnection();

     String sql;
      
      int rs =0;
      try {
      sql = "delete from messagebox where `sender` ='"+sName+"'and `recipient`= '"+rName+"'";
      System.out.println(sql);
      pstmt=conn.prepareStatement(sql);
      rs = pstmt.executeUpdate(sql);
      System.out.println(rs);

      }
       catch (Exception e) {
        System.out.println(e.toString());
      }
   
      
 }
 
 public  ArrayList<Integer> totalcnt() throws SQLException, IOException {
     

     java.sql.Statement stmt1 = null;
     java.sql.Statement stmt2 = null;
     java.sql.Statement stmt3 = null;
     java.sql.Statement stmt4 = null;
      Connection con = null;
      con = DBConnection.getConnection();
      String Gender1= "MALE";
      String Gender2= "FEMALE";
      //String sql;
      String sql1;
      String sql2;
      String sql3;
      String sql4;
      ResultSetMetaData rsmd1;
      //ResultSetMetaData rsmd2;
       ResultSet rs1 =null;
       ResultSet rs2 =null;
       ResultSet rs3 =null;
       ResultSet rs4 =null;
      int colCount1=0;
      int colCount2=0;
      int colCount3=0;
      
       ArrayList<Integer>  colCountAll = new ArrayList<Integer>();

       sql1= "select * from member where ID";
       sql2 ="select * from member where gender ='"+Gender1+"'";
       sql3 ="select * from member where gender ='"+Gender2+"'";
    
       stmt1 = con.createStatement();
       stmt2 = con.createStatement();
       stmt3 = con.createStatement();
       
         rs1 = stmt1.executeQuery(sql1);
         rs2 = stmt2.executeQuery(sql2);
         rs3 = stmt3.executeQuery(sql3);
     
       try {
      //  PreparedStatement pstmt = null;
         
          while (rs1.next()) 
          {
             colCount1 +=1;
          }
          colCountAll.add(colCount1);
          rs1.close();
          while (rs2.next()) 
          {
             colCount2 +=1;
          }
          colCountAll.add(colCount2);
          rs2.close();
         while (rs3.next())
         {
              colCount3 +=1;
               
          }
         colCountAll.add(colCount3);
           rs3.close();
       //  rsmd1 = rs1.getMetaData();
         //rsmd2 = rs2.getMetaData();
         //pstmt = conn.prepareStatement(sql);
        // java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
       //  String today = formatter.format(new java.util.Date());
        // int colCount1 = rsmd1.get
        
         System.out.println("총 회원 수 : " + colCount1);
         System.out.println("총 남성 회원 수 : " + colCount2);
         System.out.println("총 여성 회원 수: " + colCount3);
      }
        catch (Exception e) {
         System.out.println(e.toString());
       }
   
      
    /*HttpSession session = request.getSession();
       session.setAttribute("list",colCountAll);
       RequestDispatcher dispatcher = request.getRequestDispatcher("membership.jsp");
       ServletResponse response;
    dispatcher.forward(request,response);
    */return colCountAll;
    
     }
 
 public ArrayList<msgDTO> SendMessagebox(String sID){
	    ArrayList<msgDTO> lists = new ArrayList<msgDTO>();
	     ResultSet rs = null;
	    PreparedStatement pstmt = null;
	     String sql;
	     try {
	         System.out.println("1234");

	       sql = "select recipient, sender, content from messagebox where `sender` ='"+sID+"'";
	  
	    pstmt = conn.prepareStatement(sql);
	    rs = pstmt.executeQuery(sql);
	    System.out.println("1234");
	    
	    while (rs.next()) {
	      //데이터 항목이 여러개인 경우
	      //MemberDTO 객체에 저장해서 관리
	      msgDTO dto = new msgDTO();
	      System.out.println("345");
	      dto.setReci(rs.getString(1));
	      System.out.println(dto.getReci());
	      dto.setSender(rs.getString(2));
	      System.out.println(dto.getSender());
	      dto.setContent(rs.getString(3));
	      System.out.println(dto.getContent());
	     
	      //데이터베이스에서 읽어온 데이터가 여러개인 경우
	      //컬렉션에 추가
	      lists.add(dto);
	    }
	    rs.close();
	    pstmt.close();
	   }
	      catch (Exception e) {
	       System.out.println(e.toString());
	     }
	     return lists;
	 }
public void updatelight(MemberDTO dto, String ID) {
    PreparedStatement pstmt = null;
     String sql;
     try {
       
       sql = "UPDATE member SET `light`=? where `ID`=+'"+ID+"'";
  
    pstmt = conn.prepareStatement(sql);
    

      pstmt.setInt(1, dto.getlight());
    pstmt.executeUpdate();
    pstmt.close();
    }
      catch (Exception e) {
       System.out.println(e.toString());
     }
   }
public void updatelasttime(MemberDTO dto, String ID) {
    PreparedStatement pstmt = null;
     String sql;
     try {
       
       sql = "UPDATE member SET `lasttime`=? where `ID`=+'"+ID+"'";
  
    pstmt = conn.prepareStatement(sql);
    

    pstmt.setString(1,dto.getlasttime());
    pstmt.executeUpdate();
    pstmt.close();
    }
      catch (Exception e) {
       System.out.println(e.toString());
     }
   }
public ArrayList<msgDTO> receiveMessagebox(String sID){
    ArrayList<msgDTO> lists = new ArrayList<msgDTO>();
     ResultSet rs = null;
    PreparedStatement pstmt = null;
     String sql;
     try {
         System.out.println("1234");

       sql = "select recipient, sender, content from messagebox where `recipient` ='"+sID+"'";
  
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery(sql);
    System.out.println("1234");
    
    while (rs.next()) {
      //데이터 항목이 여러개인 경우
      //MemberDTO 객체에 저장해서 관리
      msgDTO dto = new msgDTO();
      System.out.println("345");
      dto.setReci(rs.getString(1));
      System.out.println("678");
      dto.setSender(rs.getString(2));
      System.out.println("910");
      dto.setContent(rs.getString(3));
      System.out.println("1112");
     System.out.println(dto.getReci());
     System.out.println(dto.getSender());
     System.out.println(dto.getContent());
      //데이터베이스에서 읽어온 데이터가 여러개인 경우
      //컬렉션에 추가
      lists.add(dto);
    }
    System.out.println(lists.size());
    rs.close();
    pstmt.close();
   }
      catch (Exception e) {
       System.out.println(e.toString());
     }
     return lists;
}

 
}
   