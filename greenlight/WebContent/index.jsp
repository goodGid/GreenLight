<%@page import="member.MemberDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
   <title> 오 작 교 넷</title>
   
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

  <% MemberDTO mem = (MemberDTO) session.getAttribute("login_session");%>
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header" style="position:relative; height:100px">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp"><h2> 오 작 교 </h2></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" text="white">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="greenlist"><h2>My Page</h2></a>
                    </li>
                    <li>
                        <a href="services.jsp"><h2>회원 검색</h2></a>
                    </li>
                     
                     <li class = "dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"> Message <b class="caret"></b></a>                        
                        <ul class="dropdown-menu">
                        <li>
                           <a href="receiveMessagebox"><h4>받은 편지함</h4></a>
                        </li>
                        <li>
                            <a href="sendMessagebox"><h4>보낸 편지함</h4></a>
                        </li>
                        </ul>
                    </li>             
                    
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">부가 기능 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href ="del.jsp"> 회원 탈퇴</a>
                                
                            </li>             
                             <li>
                                <a href ="totalcnt"> 회원 현황</a>  
                            </li>                    
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">로그인 정보 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                   <h4>&nbsp;&nbsp;아이디 : <%=mem.getID()%><br>       
                              <h4>&nbsp;&nbsp;이&nbsp;&nbsp;&nbsp;&nbsp;름 : <%=mem.getName()%>&nbsp;님<br> 
                              <h4>&nbsp;&nbsp;환영합니다.
                            </li>                         
                        </ul>
                    </li>
                    <li class="dropdown">
                       <a VALUE="logout" onclick="logout();">로그아웃 </a>  
                    </li>                 
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Header Carousel -->
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="fill" style="background-image:url('img/2.jpg');"></div>
                <div class="carousel-caption">
                    <h2></h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('img/3.jpg');"></div>
                <div class="carousel-caption">
                    <h2></h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('img/8.jpg');"></div>
                <div class="carousel-caption">
                    <h2></h2>
                </div>ㄴ
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </header>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>
 <script>
 function logout(){
	    var con = confirm("접속을 종료하시겠습니까?");
	    if(con==true)
	       location.href="addcnt";
	    else{}
	    
	 }
</script>

</body>

</html>