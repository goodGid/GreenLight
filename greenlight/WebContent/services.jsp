<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO" %>
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
<%int idx;
String id=" ";
String name=" ";
String studentnum=" ";
String reg=" ";
String self=" ";
String age=" ";
ArrayList<Integer> ranNumber = new ArrayList<Integer>();
String temp=" ";


if(session.getAttribute("list")!=null)
{
    List<MemberDTO> list=(List)session.getAttribute("list");
  
   for(int i=0; i <list.size();i++)
   {
      ranNumber.add(i);
   }

   Collections.shuffle(ranNumber);
   System.out.println(ranNumber);
}      
   MemberDTO dto=null;
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
                <a class="navbar-brand" href="index.jsp">오 작 교</a>
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
            <div class="col-lg-12">
                <h1 class="page-header">회원 검색
                    <small>이상형 찾기</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.jsp">Home</a>
                    </li>
                    <li class="active">회원 검색</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
        
        
        <!--회원검색-->
        
<ul class="nav nav-tabs">
  <li class="active"><a aria-expanded="true" href="#name-sex-search" data-toggle="tab">이름/성별 찾기</a></li>
  <li><a aria-expanded="false" href="#age-residence-search" data-toggle="tab">나이/거주지 찾기</a></li>
  
<!-- 
  <li class="dropdown">
    <a class="dropdown-toggle" aria-expanded="false" href="#" data-toggle="dropdown">
      Dropdown <span class="caret"></span>
    </a>
    <ul class="dropdown-menu">
      <li><a href="#dropdown1" data-toggle="tab">Action</a></li>
      <li class="divider"></li>
      <li><a href="#dropdown2" data-toggle="tab">Another action</a></li>
    </ul>
  </li>
   -->
</ul>
<div class="tab-content" id="myTabContent">

  <div class="tab-pane fade active in" id="name-sex-search">
   <!-- 이름찾기 -->
   <form class="form-horizontal" action="search" method="POST">
  <fieldset>
  <br>
    <div class="form-group">
      <label class="col-lg-1 control-label" for="inputname">이름</label>
       <div class="col-lg-2">
        <input class="form-control" id="inputname" type="text" name="name" placeholder="이름을 입력하세요.">
      </div>
    </div>

     <div class="form-group">
      <label class="col-lg-1 control-label">성별</label>
      <div class="col-lg-1">
        <div class="radio">
          <label>
            <input name="gender" id="optionsRadios1" type="radio" value="1" checked = true>
            남자
          </label>
        </div>
        <div class="radio">
          <label>
            <input name="gender" id="optionsRadios2" type="radio" value="2">
            여자
          </label>
        </div>
      </div>
    </div>
     <div class="form-group">
     <div class="col-sm-offset-1 col-sm-10">
        <button class="btn btn-primary" type="submit">검색</button>
      </div>
    </div>
  </fieldset>
</form>
  </div>
  
  <div class="tab-pane fade" id="age-residence-search">   
     <!-- 나이 찾기 -->
   <form class="form-horizontal" action="agesearch" method="POST">
  <fieldset>
  <br>
    <div class="form-group">
      <label class="col-lg-1 control-label" for="inputage">나이</label>
      <div class="col-lg-2">
        <input class="form-control" id="inputage" type="text" name="age" placeholder="ex) 24">
      </div>
    </div>
    
     <div class="form-group">
      <label class="col-lg-1 control-label" >거주지</label>
      <div class="col-lg-2">
      <select class="form-control" name="live" onchange="setValues()">
<option>시/도를입력하세요</option>
<option>강원도</option>
<option>경기도</option>
<option>경상남도</option>
<option>경상북도</option>
<option>광주광역시</option>
<option>대구광역시</option>
<option>대전광역시</option>
<option>부산광역시</option>
<option>서울특별시</option>
<option>울산광역시</option>
<option>인천광역시</option>
<option>전라남도</option>
<option>전라북도</option>
<option>제주특별자치</option>
<option>충청남도</option>
<option>충청북도</option>
<option>세종특별자치</option>
          
    </select>
     </div>
     </div>
     
     <div class="form-group">
     <div class="col-sm-offset-1 col-sm-10">
        <button class="btn btn-primary" type="submit">검색</button>
      </div>
    </div>
  </fieldset>
</form>
    </div>
    
    
  <!--  
  <div class="tab-pane fade" id="dropdown1">
    <p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork.</p>
  </div>
  <div class="tab-pane fade" id="dropdown2">
    <p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater.</p>
  </div>-->
</div>

        <!-- Image Header
        <div class="row">
            <div class="col-lg-12">
                <img class="img-responsive" src="http://placehold.it/1200x300" alt="">
            </div>
        </div>
         -->
        <!-- /.row -->
        
        
  
 <!-- Service Panels -->
        <!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
           <div class="row">
              <h2 class="page-header">검색 결과</h2>
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
<%if(session.getAttribute("list")!=null){
	List<MemberDTO> list=(List)session.getAttribute("list");
    for(idx=0;idx<list.size();idx++){%>
    <%if(idx==ranNumber.indexOf(0)){ dto = list.get(idx);%>   
     <div class="col-md-3 col-sm-6">
              <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
		                    <form class="form-horizontal" role="form" action="btnLight" method="post" class="registration-form">
		                    <div class="col-md-4">
		                    <span class="fa-stack fa-5x">
		                        <img src="<%= dto.getPhoto() %>" style="width:200px;height:200px">
		                    </span><br><br><br><br>
		                    </div>
                            <div class="panel-body">
                               <%    
                                 id=dto.getID();
                                 name=dto.getName();
                                 age=dto.getAge();
                                 studentnum=dto.getClassof();
                                 reg=dto.getlive();
                                 self=dto.getintroduce();
                               %>  
                            </div>   
                    </div>     
                    <h4>검색 결과</h4>
                     <a href="detail?id=<%= id %>"> <p>상 세 정 보</p> </a>   
                    <input type="hidden" name="name" value=<%=name%>>
                    <button type="submit" class="btn" > 그린라이트 </button>
                    </form>         
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=id%> data-title1=<%=name%> data-title2=<%=age%> data-title3=<%=studentnum%> data-title4=<%=reg%> data-title5=<%=self%>>프로필 보기</button><br><br>
              </div>
          </div>
          <%}%>
          <%if(idx==ranNumber.indexOf(1)){ dto = list.get(idx);%>   
             <div class="col-md-3 col-sm-6">
              <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
		                    <form class="form-horizontal" role="form" action="btnLight" method="post" class="registration-form">
		                    <div class="col-md-4">
		                    <span class="fa-stack fa-5x">
		                        <img src="<%= dto.getPhoto() %>" style="width:200px;height:200px">
		                    </span><br><br><br><br>
		                    </div>
                            <div class="panel-body">
                               <%    
                                 id=dto.getID();
                                 name=dto.getName();
                                 age=dto.getAge();
                                 studentnum=dto.getClassof();
                                 reg=dto.getlive();
                                 self=dto.getintroduce();
                               %>  
                            </div>   
                    </div>     
                    <h4>검색 결과</h4>
                     <a href="detail?id=<%= id %>"> <p>상 세 정 보</p> </a> 
                    <input type="hidden" name="name" value=<%=name%>>
                    <button type="submit" class="btn" > 그린라이트 </button>
                    </form>         
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=id%> data-title1=<%=name%> data-title2=<%=age%> data-title3=<%=studentnum%> data-title4=<%=reg%> data-title5=<%=self%>>프로필 보기</button><br><br>
              </div>
          </div>
          <%}%>
           <%if(idx==ranNumber.indexOf(2)){ dto = list.get(idx);%>   
             <div class="col-md-3 col-sm-6">
              <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
		                    <form class="form-horizontal" role="form" action="btnLight" method="post" class="registration-form">
		                    <div class="col-md-4">
		                    <span class="fa-stack fa-5x">
		                        <img src="<%= dto.getPhoto() %>" style="width:200px;height:200px">
		                    </span><br><br><br><br>
		                    </div>
                            <div class="panel-body">
                               <%    
                                 id=dto.getID();
                                 name=dto.getName();
                                 age=dto.getAge();
                                 studentnum=dto.getClassof();
                                 reg=dto.getlive();
                                 self=dto.getintroduce();
                               %>  
                            </div>   
                    </div>     
                    <h4>검색 결과</h4>
                     <a href="detail?id=<%= id %>"> <p>상 세 정 보</p> </a>   
                    <input type="hidden" name="name" value=<%=name%>>
                    <button type="submit" class="btn" > 그린라이트 </button>
                    </form>         
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=id%> data-title1=<%=name%> data-title2=<%=age%> data-title3=<%=studentnum%> data-title4=<%=reg%> data-title5=<%=self%>>프로필 보기</button><br><br>
              </div>
          </div>
          <%}%>
           <%if(idx==ranNumber.indexOf(3)){ dto = list.get(idx);%>   
              <div class="col-md-3 col-sm-6">
              <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
		                    <form class="form-horizontal" role="form" action="btnLight" method="post" class="registration-form">
		                    <div class="col-md-4">
		                    <span class="fa-stack fa-5x">
		                        <img src="<%= dto.getPhoto() %>" style="width:200px;height:200px">
		                    </span><br><br><br><br>
		                    </div>
                            <div class="panel-body">
                               <%    
                                 id=dto.getID();
                                 name=dto.getName();
                                 age=dto.getAge();
                                 studentnum=dto.getClassof();
                                 reg=dto.getlive();
                                 self=dto.getintroduce();
                               %>  
                            </div>   
                    </div>     
                    <h4>검색 결과</h4>
                     <a href="detail?id=<%= id %>"> <p>상 세 정 보</p> </a>    
                    <input type="hidden" name="name" value=<%=name%>>
                    <button type="submit" class="btn" > 그린라이트 </button>
                    </form>         
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=id%> data-title1=<%=name%> data-title2=<%=age%> data-title3=<%=studentnum%> data-title4=<%=reg%> data-title5=<%=self%>>프로필 보기</button><br><br>
              </div>
          </div>
          <%}%>             
             <%}}%>
</div>
</div>    
          
<div class="item">   
<div class="videos">
    <%if(session.getAttribute("list")!=null){
      List<MemberDTO> list=(List)session.getAttribute("list");
     for(idx=0;idx<list.size();idx++){%>
    <%if(idx==ranNumber.indexOf(4)){ dto = list.get(idx);%>   
        <div class="col-md-3 col-sm-6">
              <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
		                    <form class="form-horizontal" role="form" action="btnLight" method="post" class="registration-form">
		                    <div class="col-md-4">
		                    <span class="fa-stack fa-5x">
		                        <img src="<%= dto.getPhoto() %>" style="width:200px;height:200px">
		                    </span><br><br><br><br>
		                    </div>
                            <div class="panel-body">
                               <%    
                                 id=dto.getID();
                                 name=dto.getName();
                                 age=dto.getAge();
                                 studentnum=dto.getClassof();
                                 reg=dto.getlive();
                                 self=dto.getintroduce();
                               %>  
                            </div>   
                    </div>     
                    <h4>검색 결과</h4>
                    <a href="detail?id=<%= id %>"> <p>상 세 정 보</p> </a>    
                    <input type="hidden" name="name" value=<%=name%>>
                    <button type="submit" class="btn" > 그린라이트 </button>
                    </form>         
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=id%> data-title1=<%=name%> data-title2=<%=age%> data-title3=<%=studentnum%> data-title4=<%=reg%> data-title5=<%=self%>>프로필 보기</button><br><br>
              </div>
          </div>
          <%}%>
          
          
          <%if(idx==ranNumber.indexOf(5)){ dto = list.get(idx);%>   
           <div class="col-md-3 col-sm-6">
              <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
		                    <form class="form-horizontal" role="form" action="btnLight" method="post" class="registration-form">
		                    <div class="col-md-4">
		                    <span class="fa-stack fa-5x">
		                        <img src="<%= dto.getPhoto() %>" style="width:200px;height:200px">
		                    </span><br><br><br><br>
		                    </div>
                            <div class="panel-body">
                               <%    
                                 id=dto.getID();
                                 name=dto.getName();
                                 age=dto.getAge();
                                 studentnum=dto.getClassof();
                                 reg=dto.getlive();
                                 self=dto.getintroduce();
                               %>  
                            </div>   
                    </div>     
                    <h4>검색 결과</h4>
                     <a href="detail?id=<%= id %>"> <p>상 세 정 보</p> </a> 
                    <input type="hidden" name="name" value=<%=name%>>
                    <button type="submit" class="btn" > 그린라이트 </button>
                    </form>         
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=id%> data-title1=<%=name%> data-title2=<%=age%> data-title3=<%=studentnum%> data-title4=<%=reg%> data-title5=<%=self%>>프로필 보기</button><br><br>
              </div>
          </div>
          <%}%>
           <%if(idx==ranNumber.indexOf(6)){ dto = list.get(idx);%>   
             <div class="col-md-3 col-sm-6">
              <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
		                    <form class="form-horizontal" role="form" action="btnLight" method="post" class="registration-form">
		                    <div class="col-md-4">
		                    <span class="fa-stack fa-5x">
		                        <img src="<%= dto.getPhoto() %>" style="width:200px;height:200px">
		                    </span><br><br><br><br>
		                    </div>
                            <div class="panel-body">
                               <%    
                                 id=dto.getID();
                                 name=dto.getName();
                                 age=dto.getAge();
                                 studentnum=dto.getClassof();
                                 reg=dto.getlive();
                                 self=dto.getintroduce();
                               %>  
                            </div>   
                    </div>     
                    <h4>검색 결과</h4>
                     <a href="detail?id=<%= id %>"> <p>상 세 정 보</p> </a> 
                    <input type="hidden" name="name" value=<%=name%>>
                    <button type="submit" class="btn" > 그린라이트 </button>
                    </form> 
                            
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=id%> data-title1=<%=name%> data-title2=<%=age%> data-title3=<%=studentnum%> data-title4=<%=reg%> data-title5=<%=self%>>프로필 보기</button><br><br>
              </div>
          </div>
          <%}%>
           <%if(idx==ranNumber.indexOf(7)){ dto = list.get(idx);%>   
            <div class="col-md-3 col-sm-6">
              <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
		                    <form class="form-horizontal" role="form" action="btnLight" method="post" class="registration-form">
		                    <div class="col-md-4">
		                    <span class="fa-stack fa-5x">
		                        <img src="<%= dto.getPhoto() %>" style="width:200px;height:200px">
		                    </span><br><br><br><br>
		                    </div>
                            <div class="panel-body">
                               <%    
                                 id=dto.getID();
                                 name=dto.getName();
                                 age=dto.getAge();
                                 studentnum=dto.getClassof();
                                 reg=dto.getlive();
                                 self=dto.getintroduce();
                               %>  
                            </div>   
                    </div>     
                    <h4>검색 결과</h4>
                     <a href="detail?id=<%= id %>"> <p>상 세 정 보</p> </a>  
                    <input type="hidden" name="name" value=<%=name%>>
                    <button type="submit" class="btn" > 그린라이트 </button>
                    </form>         
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=id%> data-title1=<%=name%> data-title2=<%=age%> data-title3=<%=studentnum%> data-title4=<%=reg%> data-title5=<%=self%>>프로필 보기</button><br><br>
              </div>
          </div>
          <%}%>             
             <%}}%>
</div>
</div>   
                  
<div class="item">
<div class="videos">
    <%   if(session.getAttribute("list")!=null){
                      List<MemberDTO> list=(List)session.getAttribute("list");
                    for(idx=0;idx<list.size();idx++){    
               %>
    <%if(idx==ranNumber.indexOf(8)){ dto = list.get(idx);%>   
             <div class="col-md-3 col-sm-6">
              <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
		                    <form class="form-horizontal" role="form" action="btnLight" method="post" class="registration-form">
		                    <div class="col-md-4">
		                    <span class="fa-stack fa-5x">
		                        <img src="<%= dto.getPhoto() %>" style="width:200px;height:200px">
		                    </span><br><br><br><br>
		                    </div>
                            <div class="panel-body">
                               <%    
                                 id=dto.getID();
                                 name=dto.getName();
                                 age=dto.getAge();
                                 studentnum=dto.getClassof();
                                 reg=dto.getlive();
                                 self=dto.getintroduce();
                               %>  
                            </div>   
                    </div>     
                    <h4>검색 결과</h4>
                     <a href="detail?id=<%= id %>"> <p>상 세 정 보</p> </a> 
                    <input type="hidden" name="name" value=<%=name%>>
                    <button type="submit" class="btn" > 그린라이트 </button>
                    </form>         
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=id%> data-title1=<%=name%> data-title2=<%=age%> data-title3=<%=studentnum%> data-title4=<%=reg%> data-title5=<%=self%>>프로필 보기</button><br><br>
              </div>
          </div>
          <%}%>
          <%if(idx==ranNumber.indexOf(9)){ dto = list.get(idx);%>   
              <div class="col-md-3 col-sm-6">
              <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
		                    <form class="form-horizontal" role="form" action="btnLight" method="post" class="registration-form">
		                    <div class="col-md-4">
		                    <span class="fa-stack fa-5x">
		                        <img src="<%= dto.getPhoto() %>" style="width:200px;height:200px">
		                    </span><br><br><br><br>
		                    </div>
                            <div class="panel-body">
                               <%    
                                 id=dto.getID();
                                 name=dto.getName();
                                 age=dto.getAge();
                                 studentnum=dto.getClassof();
                                 reg=dto.getlive();
                                 self=dto.getintroduce();
                               %>  
                            </div>   
                    </div>     
                    <h4>검색 결과</h4>
                     <a href="detail?id=<%= id %>"> <p>상 세 정 보</p> </a>   
                    <input type="hidden" name="name" value=<%=name%>>
                    <button type="submit" class="btn" > 그린라이트 </button>
                    </form>         
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=id%> data-title1=<%=name%> data-title2=<%=age%> data-title3=<%=studentnum%> data-title4=<%=reg%> data-title5=<%=self%>>프로필 보기</button><br><br>
              </div>
          </div>
          <%}%>
           <%if(idx==ranNumber.indexOf(10)){ dto = list.get(idx);%>   
             <div class="col-md-3 col-sm-6">
              <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
		                    <form class="form-horizontal" role="form" action="btnLight" method="post" class="registration-form">
		                    <div class="col-md-4">
		                    <span class="fa-stack fa-5x">
		                        <img src="<%= dto.getPhoto() %>" style="width:200px;height:200px">
		                    </span><br><br><br><br>
		                    </div>
                            <div class="panel-body">
                               <%    
                                 id=dto.getID();
                                 name=dto.getName();
                                 age=dto.getAge();
                                 studentnum=dto.getClassof();
                                 reg=dto.getlive();
                                 self=dto.getintroduce();
                               %>  
                            </div>   
                    </div>     
                    <h4>검색 결과</h4>
                     <a href="detail?id=<%= id %>"> <p>상 세 정 보</p> </a>  
                    <input type="hidden" name="name" value=<%=name%>>
                    <button type="submit" class="btn" > 그린라이트 </button>
                    </form>         
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=id%> data-title1=<%=name%> data-title2=<%=age%> data-title3=<%=studentnum%> data-title4=<%=reg%> data-title5=<%=self%>>프로필 보기</button><br><br>
              </div>
          </div>
          <%}%>
           <%if(idx==ranNumber.indexOf(11)){ dto = list.get(idx);%>   
             <div class="col-md-3 col-sm-6">
              <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
		                    <form class="form-horizontal" role="form" action="btnLight" method="post" class="registration-form">
		                    <div class="col-md-4">
		                    <span class="fa-stack fa-5x">
		                        <img src="<%= dto.getPhoto() %>" style="width:200px;height:200px">
		                    </span><br><br><br><br>
		                    </div>
                            <div class="panel-body">
                               <%    
                                 id=dto.getID();
                                 name=dto.getName();
                                 age=dto.getAge();
                                 studentnum=dto.getClassof();
                                 reg=dto.getlive();
                                 self=dto.getintroduce();
                               %>  
                            </div>   
                    </div>     
                    <h4>검색 결과</h4>
                   <a href="detail?id=<%= id %>"> <p>상 세 정 보</p> </a>    
                    <input type="hidden" name="name" value=<%=name%>>
                    <button type="submit" class="btn" > 그린라이트 </button>
                    </form>         
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=id%> data-title1=<%=name%> data-title2=<%=age%> data-title3=<%=studentnum%> data-title4=<%=reg%> data-title5=<%=self%>>프로필 보기</button><br><br>
              </div>
          </div>
          <%}%>             
             <%}}%>
</div>                                 
</div>
          
<div class="item">   
<div class="videos">
    <%if(session.getAttribute("list")!=null){
      List<MemberDTO> list=(List)session.getAttribute("list");
     for(idx=0;idx<list.size();idx++){%>
    <%if(idx==ranNumber.indexOf(12)){ dto = list.get(idx);%>   
        <div class="col-md-3 col-sm-6">
              <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
		                    <form class="form-horizontal" role="form" action="btnLight" method="post" class="registration-form">
		                    <div class="col-md-4">
		                    <span class="fa-stack fa-5x">
		                        <img src="<%= dto.getPhoto() %>" style="width:200px;height:200px">
		                    </span><br><br><br><br>
		                    </div>
                            <div class="panel-body">
                               <%    
                                 id=dto.getID();
                                 name=dto.getName();
                                 age=dto.getAge();
                                 studentnum=dto.getClassof();
                                 reg=dto.getlive();
                                 self=dto.getintroduce();
                               %>  
                            </div>   
                    </div>     
                    <h4>검색 결과</h4>
                    <a href="detail?id=<%= id %>"> <p>상 세 정 보</p> </a>    
                    <input type="hidden" name="name" value=<%=name%>>
                    <button type="submit" class="btn" > 그린라이트 </button>
                    </form>         
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=id%> data-title1=<%=name%> data-title2=<%=age%> data-title3=<%=studentnum%> data-title4=<%=reg%> data-title5=<%=self%>>프로필 보기</button><br><br>
              </div>
          </div>
          <%}%>
          
          
          <%if(idx==ranNumber.indexOf(13)){ dto = list.get(idx);%>   
           <div class="col-md-3 col-sm-6">
              <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
		                    <form class="form-horizontal" role="form" action="btnLight" method="post" class="registration-form">
		                    <div class="col-md-4">
		                    <span class="fa-stack fa-5x">
		                        <img src="<%= dto.getPhoto() %>" style="width:200px;height:200px">
		                    </span><br><br><br><br>
		                    </div>
                            <div class="panel-body">
                               <%    
                                 id=dto.getID();
                                 name=dto.getName();
                                 age=dto.getAge();
                                 studentnum=dto.getClassof();
                                 reg=dto.getlive();
                                 self=dto.getintroduce();
                               %>  
                            </div>   
                    </div>     
                    <h4>검색 결과</h4>
                     <a href="detail?id=<%= id %>"> <p>상 세 정 보</p> </a> 
                    <input type="hidden" name="name" value=<%=name%>>
                    <button type="submit" class="btn" > 그린라이트 </button>
                    </form>         
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=id%> data-title1=<%=name%> data-title2=<%=age%> data-title3=<%=studentnum%> data-title4=<%=reg%> data-title5=<%=self%>>프로필 보기</button><br><br>
              </div>
          </div>
          <%}%>
           <%if(idx==ranNumber.indexOf(14)){ dto = list.get(idx);%>   
             <div class="col-md-3 col-sm-6">
              <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
		                    <form class="form-horizontal" role="form" action="btnLight" method="post" class="registration-form">
		                    <div class="col-md-4">
		                    <span class="fa-stack fa-5x">
		                        <img src="<%= dto.getPhoto() %>" style="width:200px;height:200px">
		                    </span><br><br><br><br>
		                    </div>
                            <div class="panel-body">
                               <%    
                                 id=dto.getID();
                                 name=dto.getName();
                                 age=dto.getAge();
                                 studentnum=dto.getClassof();
                                 reg=dto.getlive();
                                 self=dto.getintroduce();
                               %>  
                            </div>   
                    </div>     
                    <h4>검색 결과</h4>
                     <a href="detail?id=<%= id %>"> <p>상 세 정 보</p> </a> 
                    <input type="hidden" name="name" value=<%=name%>>
                    <button type="submit" class="btn" > 그린라이트 </button>
                    </form> 
                            
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=id%> data-title1=<%=name%> data-title2=<%=age%> data-title3=<%=studentnum%> data-title4=<%=reg%> data-title5=<%=self%>>프로필 보기</button><br><br>
              </div>
          </div>
          <%}%>
           <%if(idx==ranNumber.indexOf(15)){ dto = list.get(idx);%>   
            <div class="col-md-3 col-sm-6">
              <div class="panel panel-default text-center">
                    <div class="panel-heading"> 
		                    <form class="form-horizontal" role="form" action="btnLight" method="post" class="registration-form">
		                    <div class="col-md-4">
		                    <span class="fa-stack fa-5x">
		                        <img src="<%= dto.getPhoto() %>" style="width:200px;height:200px">
		                    </span><br><br><br><br>
		                    </div>
                            <div class="panel-body">
                               <%    
                                 id=dto.getID();
                                 name=dto.getName();
                                 age=dto.getAge();
                                 studentnum=dto.getClassof();
                                 reg=dto.getlive();
                                 self=dto.getintroduce();
                               %>  
                            </div>   
                    </div>     
                    <h4>검색 결과</h4>
                     <a href="detail?id=<%= id %>"> <p>상 세 정 보</p> </a>  
                    <input type="hidden" name="name" value=<%=name%>>
                    <button type="submit" class="btn" > 그린라이트 </button>
                    </form>         
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-register-modify1" data-title=<%=id%> data-title1=<%=name%> data-title2=<%=age%> data-title3=<%=studentnum%> data-title4=<%=reg%> data-title5=<%=self%>>프로필 보기</button><br><br>
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
                    <p>검색한 대상의 프로필</p>
                 </div>
                 
                 <div class="modal-body">
                    
                       <form class="form-horizontal" role="form" class="registration-form">

                           <div class="form-group">
    
       <div class="col-lg-4">
                      
                           <h4 class="modal-ID" id="myModalLabel">a</h4>
                           <h4 class="modal-NAME" id="myModalLabel">b</h4>
                           <h4 class="modal-AGE" id="myModalLabel">c</h4>
                           <h4 class="modal-STUDENTNUM" id="myModalLabel">d</h4>
                           <h4 class="modal-REG" id="myModalLabel">e</h4>
                           <h4 class="modal-SELF" id="myModalLabel">f</h4>
						
      </div>
    </div>
				  
                           <button type="button" class="close" data-dismiss="modal">나가기</button>
                 
                           <!--<button type="submit" class="btn">취소</button>-->
                          
                       </form>
                       
                 </div>
                 
              </div>
           </div>
        </div>
        <hr>
  
        <hr>

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
  var a = button.data('title') 
  var b = button.data('title1')
  var c = button.data('title2') 
  var d = button.data('title3')
  var e = button.data('title4') 
  var f = button.data('title5')

  var modal = $(this)
  modal.find('.modal-ID').text('아이디 : ' + a)
  modal.find('.modal-NAME').text('이름 : ' + b)
  modal.find('.modal-AGE').text('나이 : ' + c)
  modal.find('.modal-STUDENTNUM').text('학번 : ' + d)
  modal.find('.modal-REG').text('주거지 : ' + e)
  modal.find('.modal-SELF').text('자기소개: ' + f)

 })
</script>
<script>
    $('.carousel').carousel({
        interval: 0 //changes the speed
    })
</script>
<%session.removeAttribute("list"); %>
</body>

</html>