<%@page import="bean.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>

<head>
  <title> 게시판 삭제 </title>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
  <script src="semantic/semantic.js"></script>
  <link rel="stylesheet" type="text/css" href="semantic/semantic.css" />
  <style>
    div.field {
      padding-left: 10px;
      padding-right: 10px;
    }

    form {
      margin-top: 30px;
    }

    @media(min-width: 720px) {
      #password {
        width: 50%;
      }
    }
  </style>
</head>

<body>

    <%
        String num = request.getParameter("num");
            Paging paging = new Paging();
            String pageNum = paging.getPageNum(num);
    %>

  <form class="ui form" id="submit" action="modify_input.jsp" method="post">
    <h2 class="ui dividing header"><center>비밀번호 확인</center></h2>
    <center>
      <input type="hidden" name="num" value="<%=num%>">
      <div class="field">
        <input id="password" type="password" name="pass" placeholder="password" />
      </div>
      <div class="field">
        <input id="confirm" class="ui button" type="submit" value="확인" />
        <input class="ui button" type="button" onclick="location.href='./listboard.jsp?pageNum=<%=pageNum%>'" value="목록 보기" />
      </div>
      
    </center>
  </form>
</body>

</html>