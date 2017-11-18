<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
                     var retVal = confirm("아직 회원님을 기다리는 인연이 있어요 ㅠㅠ 탈퇴하시겠어요 ?");
                        if( retVal == true ){         
                        alert("아쉽지만 탈퇴하기");
                        location.href ='delete'
                        }else{
                        alert("다시 인연 찾기");
                        location.href = 'index.jsp'
                            }
</script>
</body>
</html>