<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO" %>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
 <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Waver - Bootstrap Coming Soon Template</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,300,100,100italic,300italic,400italic,700,700italic">
        
        <link rel="stylesheet" href="assets_count/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets_count/css/animate.css">
        <link rel="stylesheet" href="assets_count/css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

		<!-- Font Awesome -->
		<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"> 
    

   
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
    <!-- Coming Soon -->
        <div class="coming-soon">
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                        	
                            <h2 class="wow fadeInDown">오작교  회원 현황</h2>
                            <div class="timer wow fadeInUp">
                                <div class="minutes-wrapper">
                                <%  ArrayList<Integer> colCountAll = new ArrayList<Integer>();
            						colCountAll=(ArrayList)session.getAttribute("list");
            		
                                %>
                                    <span><%=colCountAll.get(0)%></span> <br>가입한 회원 수
                                </div> 
                                <div class="minutes-wrapper">
                                    <span><%=colCountAll.get(1)%></span> <br>남성회원
                                </div> 
                                <div class="minutes-wrapper">
                                    <span><%=colCountAll.get(2)%></span> <br>여성 회원
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Javascript -->
        <script src="assets_count/js/jquery-1.10.2.min.js"></script>
        <script src="assets_count/js/jquery.backstretch.min.js"></script>
        <script src="assets_count/js/jquery.countdown.min.js"></script>
        <script src="assets_count/js/wow.min.js"></script> 
        <script>
        jQuery(document).ready(function() {
        	
            /*
                Fullscreen background
            */
            $.backstretch("assets_count/img/backgrounds/1.jpg");
            
            /*
                Wow
            */
            new WOW().init();
            
            /*
        	    Countdown initializer
        	*/
        	var now = new Date();
        	var countTo = 268 * 24 * 60 * 60 * 1000 + now.valueOf();    
        	$('.timer').countdown(countTo, function(event) {
        		$(this).find('.total').text(event.offset.totalDays);
        		$(this).find('.male').text(event.offset.hours);
        		$(this).find('.Female').text(event.offset.minutes);
        		$(this).find('.greenlight').text(event.offset.seconds);
        	});
        });
        </script> 


        
        <!--[if lt IE 10]>
            <script src="assets_count/js/placeholder.js"></script>
        <![endif]-->

</body>

</html>