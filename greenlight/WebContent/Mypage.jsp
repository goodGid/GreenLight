<%@page import="member.MemberDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>   
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
	<%
        MemberDTO mem = (MemberDTO) session.getAttribute("login_session");
		ArrayList<String> list = (ArrayList<String>)session.getAttribute("Glist");
    %>
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
                <a class="navbar-brand" href="index.jsp"> 오 작 교</a>
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
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">My Page
                    <small>프로필</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.jsp">Home</a>
                    </li>
                     <li>
                     <a class="launch-modal" href="#" data-modal-id="modal-register-modify">회원정보수정 </a>
                    </li>
                     <li>
                     <a class="launch-modal" href="#" data-modal-id="modal-profile-modify">프로필 사진 변경</a>
                    </li>
                     <li>
                       <a class="launch-modal" href="#" data-modal-id="modal-greenlist">그린라이트 리스트</a>
                    </li>
                 
                </ol>
            </div>
        </div>
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
               <p>이름: <%= mem.getName() %></p>
               <p>나이: <%= mem.getAge() %></p>
               <p>학번:<%= mem.getClassof() %></p>
               <p>성격:<%= mem.getCharacter() %></p>
               <p>사는 곳 :<%= mem.getlive() %></p>
               <p>취미 :<%= mem.gethobby() %></p>
               <p>종교 :<%= mem.getreli() %></p>
               <p>성별 :<%= mem.getgender() %></p>
               <p>자기소개 :<%= mem.getintroduce() %></p>
               <p>보유 전구 수:<%= mem.getlight() %></p>
            </div>
        </div>
        <!-- /.row -->

        <!-- Team Members -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Photo Gallery</h2>
            </div>
            <div class="col-md-4 text-center">
                <div class="thumbnail">
                    <div class="col-md-4">
                <img src="<%= mem.getPhoto1() %>" width=512 height=384 class="img-thumbnail"> 
          		  </div>
                    <div class="caption">
                        <h3>사진을 올려주세요<br>
                            <small>750x450</small>
                        </h3>
                        <ul class="list-inline">
                             <li>
                     <a class="launch-modal" href="#" data-modal-id="modal-profile-modify1">사진 업로드</a>
                    </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-4 text-center">
                <div class="thumbnail">
                    <div class="col-md-4">
                <img src="<%= mem.getPhoto2() %>" width=512 height=384 class="img-thumbnail">      
            		</div>
                    <div class="caption">
                        <h3>사진을 올려주세요<br>
                            <small>750x450</small>
                        </h3>
                        <ul class="list-inline">
                             <li>
                     <a class="launch-modal" href="#" data-modal-id="modal-profile-modify2">사진 업로드</a>
                             </li>
                        </ul>
                    </div>

                </div>
            </div>
            <div class="col-md-4 text-center">
                <div class="thumbnail">
                   <div class="col-md-4">
                <img src="<%= mem.getPhoto3() %>" width=512 height=384 class="img-thumbnail">      
            		</div>
                    <div class="caption">
                        <h3>사진을 올려주세요<br>
                            <small>750x450</small>
                        </h3>
                        <ul class="list-inline">
                             <li>
                     <a class="launch-modal" href="#" data-modal-id="modal-profile-modify3">사진 업로드</a>
                    </li>
                        </ul>
                    </div>
                </div>
            </div>
        <!-- /.row -->
        <!-- modal-register-modify -->
        <div class="modal fade" id="modal-register-modify" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
        	<div class="modal-dialog">
        		<div class="modal-content">
        			
        			<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal">
        					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
        				</button>
        				<h3 class="modal-title" id="modal-register-label">회원정보수정 </h3>
        				<p>아래의 양식을 작성해주세요</p>
        			</div>
        			
        			<div class="modal-body">
        				
	                    <form role="form" action="adjust" method="post" class="registration-form">

	                    	<div class="form-group">
	                    	비밀번호 
	                    		<label class="sr-only" for="form-password">비밀번호 </label>
	                        	<input type="text" name="PW" placeholder="변경할 비밀번호를 입력하세요..." class="form-password form-control" id="form-password">
	                        </div>
	                    	
	                    	<div class="form-group"">
	                    	이름 
	                    		<label class="sr-only" for="form-name">이름</label>
	                        	<input type="text" name="name" placeholder="변경할 이름을 입력하세요..." class="form-name form-control" id="formt-name">
	                        </div>
	                        
	                     	학번 
	                        <div class="form-group">
	                        	<label class="sr-only" for="form-studentID">학번</label>
	                        	<input type="text" name="classof" placeholder="변경할 학번을 입력하세요..." class="form-studentID form-control" id="form-studentID">
	                        </div>

	                    	성별 
	                    	<div class="radio">
  							<label>
    						<input type="radio" name="gender" id="form-sex" value="MALE" checked>
    								남
  							</label>
							</div>
							<div class="radio">
  							<label>
    						<input type="radio" name="gender" id="form-sex" value="FEMALE" >
    								여
  							</label>
							</div>
							    
	                       	종교
	                        <div class="form-group">
	                        	<label class="sr-only" for="form-regi">종교</label>
	                        	<input type="text" name="reli" placeholder="변경할 종교를 입력하세요..." class="form-regi form-control" id="form-regi">
	                        </div>
	                        
	                       거주지 <BR>
	                        <div class="form-group">	 	
     							 <div class="col-lg-5">
     								 <select class="form-control" name="live">
										<option>시/도를 입력하세요.</option>
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
										<option>제주특별자치...</option>
										<option>충청남도</option>
										<option>충청북도</option>
										<option>세종특별자치...</option>
											 </select>
										     </div>
 						  </div><BR>
	                        
	                        성격
	                        <div class="form-group">
	                        	<label class="sr-only" for="form-character">성격</label>
	                        	<input type="text" name="character" placeholder="변경할 성격을 입력하세요..." class="form-regi form-control" id="form-regi">
	                        </div>
	                        취미
	                        <div class="form-group">
	                        	<label class="sr-only" for="form-hobby">취미</label>
	                        	<input type="text" name="hobby" placeholder="변경할 취미를 입력하세요..." class="form-regi form-control" id="form-regi">
	                        </div>
	                        
	                        나이
	                        <div class="form-group">
	                        	<label class="sr-only" for="form-regi">나이</label>
	                        	<input type="text" name="age" placeholder="변경할 나이를 입력하세요..." class="form-regi form-control" id="form-regi">
	                        </div>
	                        
	                       자기 소개
	                        <div class="form-group">
	                        	<label class="sr-only" for="form-about-yourself">자기 소개</label>
	                        	<textarea name="introduce" placeholder="변경할 자기소개를 입력하세요..." 
	                        				class="form-about-yourself form-control" id="form-about-yourself"></textarea>
	                        </div>

	                        <button type="submit" class="btn">수정 완료</button>
	                        <button type="button" class="close" data-dismiss="취소"></button>
	                        <!--<button type="submit" class="btn">ì·¨ì</button>-->
	                    </form>
	                    
        			</div>
        			
        		</div>
        	</div>
        </div>		
        	
          <!-- modal-message- -->
        <div class="modal fade" id="modal-greenlist" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
        	<div class="modal-dialog">
        		<div class="modal-content">
        			
        			<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal">
        					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
        				</button>
        				<h3 class="modal-title" id="modal-register-label">그린라이트 리스트</h3>
        				
        			</div>
        			
        			<div class="modal-body">
        				
	                    <form role="form" action="" method="post" class="registration-form">

	                        
	                        <div class="form-group">
	                        	<label class="sr-only" for="form-about-yourself">그린라이트 리스트</label>
	                        	<% for(int i=0; i<list.size(); i++){
	                        		String name= list.get(i);%>
	                        		<li>
	                       			<%= name%>
	                       			</li>
	                        	<% }%>
	                        </div>
	                        <INPUT TYPE=BUTTON VALUE="검색하러가기" OnClick="location.href='services.jsp'">
	                        <button type="button" class="close" data-dismiss="modal">취소</button>
	                    </form>
	                    
        			</div>
        			
        		</div>
        	</div>
        </div>
        
       
          <!-- modal-profile- -->
        <div class="modal fade" id="modal-profile-modify" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
        	<div class="modal-dialog">
        		<div class="modal-content">
        			
        			<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal">
        					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
        				</button>
        				<h3 class="modal-title" id="modal-register-label">프로필 사진 수정</h3>
        				
        			</div>
        			
        			<div class="modal-body">
        				
	                    <form role="form" enctype="multipart/form-data" action="adjustPhoto" method="post" class="registration-form">
					<div class="form-group">
   				 
   					 <input type="file" id="exampleInputFile" name="filename">
   					 <p class="help-block">사진을 선택하세요.</p>
   					 <input type="submit" VALUE="수정 완료 " >
 					 </div>
	                        <button type="button" class="close" data-dismiss="modal">취소</button>
	                    </form>
	                    
        			</div>
        			
        		</div>
        	</div>
        </div>				
        
        <div class="modal fade" id="modal-profile-modify1" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
        	<div class="modal-dialog">
        		<div class="modal-content">
        			
        			<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal">
        					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
        				</button>
        				<h3 class="modal-title" id="modal-register-label">사진 업로드</h3>
        				
        			</div>
        			
        			<div class="modal-body">
        				
	                    <form role="form" enctype="multipart/form-data" action="adjustPhoto1" method="post" class="registration-form">
					<div class="form-group">
   				 
   					 <input type="file" id="exampleInputFile" name="filename">
   					 <p class="help-block">사진을 선택하세요.</p>
   					 <input type="submit" VALUE="업로드 완료 " >
 					 </div>
	                        <button type="button" class="close" data-dismiss="modal">취소</button>
	                    </form>
	                    
        			</div>
        			
        		</div>
        	</div>
        </div>
        
        <div class="modal fade" id="modal-profile-modify2" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
        	<div class="modal-dialog">
        		<div class="modal-content">
        			
        			<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal">
        					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
        				</button>
        				<h3 class="modal-title" id="modal-register-label">사진 업로드</h3>
        				
        			</div>
        			
        			<div class="modal-body">
        				
	                    <form role="form" enctype="multipart/form-data" action="adjustPhoto2" method="post" class="registration-form">
					<div class="form-group">
   				 
   					 <input type="file" id="exampleInputFile" name="filename">
   					 <p class="help-block">사진을 선택하세요.</p>
   					 <input type="submit" VALUE="업로드 완료 " >
 					 </div>
	                        <button type="button" class="close" data-dismiss="modal">취소</button>
	                    </form>
	                    
        			</div>
        			
        		</div>
        	</div>
        </div>
        
        <div class="modal fade" id="modal-profile-modify3" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
        	<div class="modal-dialog">
        		<div class="modal-content">
        			
        			<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal">
        					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
        				</button>
        				<h3 class="modal-title" id="modal-register-label">프로필 사진 수정</h3>
        				
        			</div>
        			
        			<div class="modal-body">
        				
	                    <form role="form" enctype="multipart/form-data" action="adjustPhoto3" method="post" class="registration-form">
					<div class="form-group">
   				 
   					 <input type="file" id="exampleInputFile" name="filename">
   					 <p class="help-block">프로필 사진을 선택하세요.</p>
   					 <input type="submit" VALUE="수정 완료 " >
 					 </div>
	                        <button type="button" class="close" data-dismiss="modal">취소</button>
	                    </form>
	                    
        			</div>
        			
        		</div>
        	</div>
        </div>
<!-- Our Customers -->
<!--  
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Our Customers</h2>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6">
                <img class="img-responsive customer-img" src="http://placehold.it/500x300" alt="">
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6">
                <img class="img-responsive customer-img" src="http://placehold.it/500x300" alt="">
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6">
                <img class="img-responsive customer-img" src="http://placehold.it/500x300" alt="">
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6">
                <img class="img-responsive customer-img" src="http://placehold.it/500x300" alt="">
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6">
                <img class="img-responsive customer-img" src="http://placehold.it/500x300" alt="">
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6">
                <img class="img-responsive customer-img" src="http://placehold.it/500x300" alt="">
            </div>
        </div>-->
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
