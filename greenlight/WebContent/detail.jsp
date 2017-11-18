<%@page import="member.MemberDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>   
<!DOCTYPE html>
   <%
        MemberDTO mem = (MemberDTO) session.getAttribute("targetsession");
        MemberDTO dto = (MemberDTO) session.getAttribute("login_session");
    %>
    
    

<html lang="en">
<head>


<script language="javascript">
function LockF5(){
   if (event.keyCode == 116) {
      event.keyCode = 0;
      return false;
   }   
}
document.onkeydown = LockF5;

</script>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Modern Business - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
   <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
   <link rel="stylesheet" href="css/form-elements.css">
   
    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
    <!-- Navigation -->
</script>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">오 작 교</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active">
                     <li>
                        <a href="Mypage.jsp">My Page</a>
                    </li>
                    <li>
                        <a href="services.jsp">회원 검색</a>
                    </li>
                    <!--
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Portfolio <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="portfolio-1-col.html">1 Column Portfolio</a>
                            </li>
                            <li>
                                <a href="portfolio-2-col.html">2 Column Portfolio</a>
                            </li>
                            <li>
                                <a href="portfolio-3-col.html">3 Column Portfolio</a>
                            </li>
                            <li>
                                <a href="portfolio-4-col.html">4 Column Portfolio</a>
                            </li>
                            <li>
                                <a href="portfolio-item.html">Single Portfolio Item</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="blog-home-1.html">Blog Home 1</a>
                            </li>
                            <li>
                                <a href="blog-home-2.html">Blog Home 2</a>
                            </li>
                            <li>
                                <a href="blog-post.html">Blog Post</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Other Pages <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="full-width.html">Full Width Page</a>
                            </li>
                            <li>
                                <a href="sidebar.html">Sidebar Page</a>
                            </li>
                            <li>
                                <a href="faq.html">FAQ</a>
                            </li>
                            <li>
                                <a href="404.html">404</a>
                            </li>
                            <li>
                                <a href="pricing.html">Pricing Table</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            -->
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <!-- /.row -->
<!-- íì´ì¤ë¶ ìë¨ë°©ì
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<div class="container">
    <div class="fb-profile">
        <img align="left" class="fb-image-lg" src="http://lorempixel.com/850/280/nightlife/5/" alt="Profile image example"/>
        <br>
        <img align="left" class="fb-image-profile thumbnail" src="http://localhost:8080/web/INDEX/img/mypage.png" alt="Profile image example"/>
        <br>
        <div class="fb-profile-text">
            <h1>ë°ê±´ì°</h1>
            <p>ìëíì¸ì.</p>
        </div>
    </div>
</div> 
-->


<!-- /container -->  
        <!-- Intro Content -->
        <div class="row">
            <div class="col-md-4">
                <img src=<%= mem.getPhoto() %> width=512 height=384 class="img-thumbnail">
                  
            </div>
            <div class="col-md-6">
            <form class="form-horizontal" role="form" action="downcnt" method="post" class="registration-form">
               <p>이름 :  <%= mem.getName() %></p>
               <p>나이 :  <%= mem.getAge() %></p>
               <p>학번 :  <%= mem.getClassof() %></p>
               <p>자기소개 :  <%= mem.getintroduce() %></p> 

            
              <!--<p id="character"></p>
               <p id="hobby"></p>
               <p id="reli"></p>
               <p id="private">비밀 정보</p>   --> 
                <input type="hidden" name="ID" value= <%=dto.getID() %>>
              
                
                    <button type="submit" class="btn" > 확인하기 </button>
                 
               </form>      
            </div>   
            <% session.setAttribute("rID", mem.getID());%>
         <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1"> 쪽지 보내기</button><br><br>   
        </div>
        <div> 	
            <h3>추가 사진</h3>
             <div class="col-md-4">
                <img src=<%= mem.getPhoto1() %> width=512 height=384 class="img-thumbnail">      
             </div>
               <div class="col-md-4">
                <img src=<%= mem.getPhoto2() %> width=512 height=384 class="img-thumbnail">      
               </div>
               <div class="col-md-4">
                <img src=<%= mem.getPhoto3() %> width=512 height=384 class="img-thumbnail">      
               </div>
       </div>
     
       <% session.setAttribute("rID", mem.getName());%>
   
       
       <!-- modal-register-modify -->
    
        <div class="modal fade" id="modal-register-modify1" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true"> 
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <form method =post action = message>
                 
                    <button type="button" class="close" data-dismiss="modal">
                       <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                    </button>
                    
                    <h3 class="modal-title" id="modal-register-label">쪽지 보내기</h3>
                    <p>쪽지 내용</p>
                    
                    <INPUT TYPE=TEXT NAME="Content">
                    <button TYPE="submit" class=btn >보내기</button>
                    </form>
                 </div>
                 
                 <div class="modal-body">               
                       
                           <button type="button" class="close" data-dismiss="modal">나가기</button>
                 
                           <!--<button type="submit" class="btn">취소</button>-->
                          
            </div>
        </div>
          
       </div>
       </div>
       
        <!-- /.row -->

        <hr>


    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <!-- íìì ë³´ ìì  -->
      <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/jquery.backstretch.min.js"></script>
        <script src="js/scripts.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>





</body>

</html>