<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO" %>
<%@page import="member.msgDTO" %>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

<%int idx;
String recipient=" ";
String sender=" ";
String content=" ";
System.out.println("111");
ArrayList<Integer> ranNumber = new ArrayList<Integer>();
List<msgDTO> list=(List<msgDTO>)session.getAttribute("Sendlist");
if(session.getAttribute("Sendlist")!=null)
{System.out.println("111");

   for(int i=0; i <list.size();i++)
   {
      ranNumber.add(i);
   }
   System.out.println("listSize:"+ list.size());
   System.out.println(ranNumber);
}      
   msgDTO dto=null;
%>  
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
                <a class="navbar-brand" href="index.jsp"> 오 작 교 </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="Mypage.jsp">My Page</a>
                    </li>
                    <li class="active">
                        <a href="services.jsp">회원 검색</a>
                    </li>
                    <li class="active">
                        <a href="login.html">로그아웃</a>
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
                    -->
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12"><BR>
                <h1 class="page-header">MESSAGE</h1>
                <ol class="breadcrumb">
                    <li>
                    	<a href="index.jsp">Home</a>
                    </li>
                     <li>
                    	<a href="message.jsp">받은 편지함</a>
                    </li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
        
        
        <!--회원검색-->
        

        
        
        
        
        
        
        
 <!-- Service Panels -->
        <!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
           <div class="row">
              <h2 class="page-header">OUT BOX</h2>
            </div>
              
              
               
             <div class="container">  
             
             
             
             
             
                      <!-- 슬라이드 시작 -->    
<div id="carousel-example-generic" class="carousel slide hidden-xs" data-ride="carousel">
               <ol class="carousel-indicators">
                     <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                     <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                     <li data-target="#carousel-example-generic" data-slide-to="2"></li>
               </ol>
               
<div class="carousel-inner"><!-- item close -->
          
<div class="item active">                  
<div class="videos">
 <%   if(session.getAttribute("Sendlist")!=null){
                     // List<msgDTO> list=(List)session.getAttribute("Sendlist");
                    for(idx=0;idx<list.size();idx++){    
               %>
    <%if(idx==ranNumber.indexOf(0)){ dto = list.get(idx);%>   
             <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
                <form action = deletemsg2 method= post> 
                    <div class="col-md-4">
                           <span class="fa-stack fa-5x">
                           <img src="memo.jpg" style="width:200px;height:200px">
                     </span><br><br><br><br>
                   </div>
                             <div class="panel-body">
                               <%    
                                 recipient=dto.getReci();
                                 sender = dto.getSender();
                                 content = dto.getContent();
                              %>
                             </div>   
                </div>     
                   <h4>받은 사람 : <%= dto.getReci() %></h4>
                   <input type="hidden" name="name" value=<%=recipient%>>
                   <button type="submit" class= "btn">삭제 하기</button>
                   </form> 
               <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=recipient%> data-title1=<%=sender%> data-title2=<%=content%> >메시지 보기</button><br><br>
                </div>
          </div>
          <%}%>
          <%if(idx==ranNumber.indexOf(1)){ dto = list.get(idx);%>   
           <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
                 <form action = deletemsg2 method= post> 
                    <div class="col-md-4">
                           <span class="fa-stack fa-5x">
                           <img src="memo.jpg" style="width:200px;height:200px">
                     </span><br><br><br><br>
                   </div>
                             <div class="panel-body">
                               <%    
                                 recipient=dto.getReci();
                                 sender = dto.getSender();
                                 content = dto.getContent();
                              %>
                             </div>   
                </div>     
                   <h4>받은 사람 : <%= dto.getReci() %></h4>
                   <input type="hidden" name="name" value=<%=recipient%>>
                   
                   <button type="submit" class= "btn">삭제 하기</button>
                   </form> 
               <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=recipient%> data-title1=<%=sender%> data-title2=<%=content%> >메시지 보기</button><br><br>
                </div>
          </div>
          <%}%>
           <%if(idx==ranNumber.indexOf(2)){ dto = list.get(idx);%>   
           <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
                   <form action = deletemsg2 method= post> 
                    <div class="col-md-4">
                           <span class="fa-stack fa-5x">
                           <img src="memo.jpg" style="width:200px;height:200px">
                     </span><br><br><br><br>
                   </div>
                             <div class="panel-body">
                               <%    
                                 recipient=dto.getReci();
                                 sender = dto.getSender();
                                 content = dto.getContent();
                              %>
                             </div>   
                </div>     
                   <h4>받은 사람 : <%= dto.getReci() %></h4>
                   <input type="hidden" name="name" value=<%=recipient%>>
                   <button type="submit" class= "btn">삭제 하기</button>
                   </form> 
               <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=recipient%> data-title1=<%=sender%> data-title2=<%=content%> >메시지 보기</button><br><br>
                </div>
          </div>
          <%}%>
           <%if(idx==ranNumber.indexOf(3)){ dto = list.get(idx);%>   
             <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
                   <form action = deletemsg2 method= post> 
                    <div class="col-md-4">
                           <span class="fa-stack fa-5x">
                           <img src="memo.jpg" style="width:200px;height:200px">
                     </span><br><br><br><br>
                   </div>
                             <div class="panel-body">
                               <%    
                                 recipient=dto.getReci();
                                 sender = dto.getSender();
                                 content = dto.getContent();
                              %>
                             </div>   
                </div>     
                   <h4>받은 사람 : <%= dto.getReci() %></h4>
                   <input type="hidden" name="name" value=<%=recipient%>>
                   <button type="submit" class= "btn">삭제 하기</button>
                   </form> 
               <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=recipient%> data-title1=<%=sender%> data-title2=<%=content%> >메시지 보기</button><br><br>
                </div>
          </div>
          <%}%>             
             <%}}%>
</div>
</div>    
          
<div class="item">   
<div class="videos">
    <%   if(session.getAttribute("Sendlist")!=null){
                      //List<msgDTO> list=(List)session.getAttribute("Sendlist");
                    for(idx=0;idx<list.size();idx++){    
               %>
    <%if(idx==ranNumber.indexOf(4)){ dto = list.get(idx);%>   
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
                     <form action = deletemsg2 method= post> 
                    <div class="col-md-4">
                           <span class="fa-stack fa-5x">
                           <img src="memo.jpg" style="width:200px;height:200px">
                     </span><br><br><br><br>
                   </div>
                             <div class="panel-body">
                               <%    
                                 recipient=dto.getReci();
                                 sender = dto.getSender();
                                 content = dto.getContent();
                              %>
                             </div>   
                </div>     
                   <h4>받은 사람 : <%= dto.getReci() %></h4>
                   <input type="hidden" name="name" value=<%=recipient%>>
                   <button type="submit" class= "btn">삭제 하기</button>
                   </form> 
               <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=recipient%> data-title1=<%=sender%> data-title2=<%=content%> >메시지 보기</button><br><br>
                </div>
          </div>
          <%}%>
          <%if(idx==ranNumber.indexOf(5)){ dto = list.get(idx);%>   
             <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
                  <form action = deletemsg2 method= post> 
                    <div class="col-md-4">
                           <span class="fa-stack fa-5x">
                           <img src="memo.jpg" style="width:200px;height:200px">
                     </span><br><br><br><br>
                   </div>
                             <div class="panel-body">
                               <%    
                                 recipient=dto.getReci();
                                 sender = dto.getSender();
                                 content = dto.getContent();
                              %>
                             </div>   
                </div>     
                   <h4>받은 사람 : <%= dto.getReci() %></h4>
                   <input type="hidden" name="name" value=<%=recipient%>>
                   <button type="submit" class= "btn">삭제 하기</button>
                   </form> 
               <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=recipient%> data-title1=<%=sender%> data-title2=<%=content%> >메시지 보기</button><br><br>
                </div>
          </div>
          <%}%>
           <%if(idx==ranNumber.indexOf(6)){ dto = list.get(idx);%>   
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
                    <form action = deletemsg2 method= post> 
                    <div class="col-md-4">
                           <span class="fa-stack fa-5x">
                           <img src="memo.jpg" style="width:200px;height:200px">
                     </span><br><br><br><br>
                   </div>
                             <div class="panel-body">
                               <%    
                                 recipient=dto.getReci();
                                 sender = dto.getSender();
                                 content = dto.getContent();
                              %>
                             </div>   
                </div>     
                   <h4>받은 사람 : <%= dto.getReci() %></h4>
                   <input type="hidden" name="name" value=<%=recipient%>>
                   <button type="submit" class= "btn">삭제 하기</button>
                   </form>  
               <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=recipient%> data-title1=<%=sender%> data-title2=<%=content%> >메시지 보기</button><br><br>
                </div>
          </div>
          <%}%>
           <%if(idx==ranNumber.indexOf(7)){ dto = list.get(idx);%>   
             <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
                      <form action = deletemsg2 method= post> 
                    <div class="col-md-4">
                           <span class="fa-stack fa-5x">
                           <img src="memo.jpg" style="width:200px;height:200px">
                     </span><br><br><br><br>
                   </div>
                             <div class="panel-body">
                               <%    
                                 recipient=dto.getReci();
                                 sender = dto.getSender();
                                 content = dto.getContent();
                              %>
                             </div>   
                </div>     
                   <h4>받은 사람 : <%= dto.getReci() %></h4>
                   <input type="hidden" name="name" value=<%=recipient%>>
                   <button type="submit" class= "btn">삭제 하기</button>
                   </form>  
               <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=recipient%> data-title1=<%=sender%> data-title2=<%=content%> >메시지 보기</button><br><br>
                </div>
          </div>
          <%}%>             
             <%}}%>
</div>
</div>   
                  
<div class="item">
<div class="videos">
    <%   if(session.getAttribute("Sendlist")!=null){
                      //List<msgDTO> list=(List)session.getAttribute("Sendlist");
                    for(idx=0;idx<list.size();idx++){    
               %>
    <%if(idx==ranNumber.indexOf(8)){ dto = list.get(idx);%>   
             <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
                      <form action = deletemsg2 method= post> 
                    <div class="col-md-4">
                           <span class="fa-stack fa-5x">
                           <img src="memo.jpg" style="width:200px;height:200px">
                     </span><br><br><br><br>
                   </div>
                             <div class="panel-body">
                               <%    
                                 recipient=dto.getReci();
                                 sender = dto.getSender();
                                 content = dto.getContent();
                              %>
                             </div>   
                </div>     
                   <h4>받은 사람 : <%= dto.getReci() %></h4>
                   <input type="hidden" name="name" value=<%=recipient%>>
                   <button type="submit" class= "btn">삭제 하기</button>
                   </form>  
               <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=recipient%> data-title1=<%=sender%> data-title2=<%=content%> >메시지 보기</button><br><br>
                </div>
          </div>
          <%}%>
          <%if(idx==ranNumber.indexOf(9)){ dto = list.get(idx);%>   
             <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
                      <form action = deletemsg2 method= post> 
                    <div class="col-md-4">
                           <span class="fa-stack fa-5x">
                           <img src="memo.jpg" style="width:200px;height:200px">
                     </span><br><br><br><br>
                   </div>
                             <div class="panel-body">
                               <%    
                                 recipient=dto.getReci();
                                 sender = dto.getSender();
                                 content = dto.getContent();
                              %>
                             </div>   
                </div>     
                   <h4>받은 사람 : <%= dto.getReci() %></h4>
                   <input type="hidden" name="name" value=<%=recipient%>>
                   <button type="submit" class= "btn">삭제 하기</button>
                   </form>  
               <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=recipient%> data-title1=<%=sender%> data-title2=<%=content%> >메시지 보기</button><br><br>
                </div>
          </div>
          <%}%>
           <%if(idx==ranNumber.indexOf(10)){ dto = list.get(idx);%>   
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
                      <form action = deletemsg2 method= post> 
                    <div class="col-md-4">
                           <span class="fa-stack fa-5x">
                           <img src="memo.jpg" style="width:200px;height:200px">
                     </span><br><br><br><br>
                   </div>
                             <div class="panel-body">
                               <%    
                                 recipient=dto.getReci();
                                 sender = dto.getSender();
                                 content = dto.getContent();
                              %>
                             </div>   
                </div>     
                   <h4>받은 사람 : <%= dto.getReci() %></h4>
                   <input type="hidden" name="name" value=<%=recipient%>>
                   <button type="submit" class= "btn">삭제 하기</button>
                   </form>   
               <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=recipient%> data-title1=<%=sender%> data-title2=<%=content%> >메시지 보기</button><br><br>
                </div>
          </div>
          <%}%>
           <%if(idx==ranNumber.indexOf(11)){ dto = list.get(idx);%>   
             <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                    <form action = deletemsg2 method= post> 
                    <div class="col-md-4">
                           <span class="fa-stack fa-5x">
                           <img src="memo.jpg" style="width:200px;height:200px">
                     </span><br><br><br><br>
                   </div>
                             <div class="panel-body">
                               <%    
                                 recipient=dto.getReci();
                                 sender = dto.getSender();
                                 content = dto.getContent();
                              %>
                             </div>   
                </div>     
                   <h4>받은 사람 : <%= dto.getReci() %></h4>
                   <input type="hidden" name="name" value=<%=recipient%>>
                   <button type="submit" class= "btn">삭제 하기</button>
                   </form>  
               <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=recipient%> data-title1=<%=sender%> data-title2=<%=content%> >메시지 보기</button><br><br>
                </div>
          </div>
          <%}%>             
             <%}}%>
</div>                                 
</div>
   
</div><!-- item close -->                           
 <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span></a><a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right">
      </span>
      </a>
        </div><!-- carousel-inner close -->
 
</div>

<!-- 슬라이드 마침 -->
        
            
          



 <!-- modal-register-modify -->
        <div class="modal fade" id="modal-register-modify1" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                       <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                    </button>
                    
                    <h3 class="modal-title" id="modal-register-label">프로필</h3>
                  
                 </div>
                 
                 <div class="modal-body">
                    
                           <h4 class="modal-con" id="myModalLabel">c</h4>
             				
                       
                 </div>
                 
              </div>
           </div>
        </div>
        <hr>
  
        <hr>
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->
 <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <!-- 회원정보 수정 -->
      <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/jquery.backstretch.min.js"></script>
        <script src="js/scripts.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
<script>
$('#modal-register-modify1').on('show.bs.modal', function (event) { // myModal 윈도우가 오픈할때 아래의 옵션을 적용
  var button = $(event.relatedTarget) // 모달 윈도우를 오픈하는 버튼
  var c = button.data('title2') 
  
 
  var modal = $(this)
  modal.find('.modal-con').text('내용 : ' + c)

 
})
</script>
<script>
    $('.carousel').carousel({
        interval: 0 //changes the speed
    })
</script>

</body>

</html>