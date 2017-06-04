<%@page import="dao.ArticleDaoFactory"%>
<%@page import="dao.ArticleDao"%>
<%@page import="bean.Article"%>
<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html>
<html>

<head>
  <title> 게시판 </title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
  <script src="semantic/semantic.js"></script>
  <link rel="stylesheet" type="text/css" href="semantic/semantic.css" />
  <script>
    function Check() {
      if (email.toemail.value.indexOf("@") + "" == "-1" ||
        email.toemail.value.indexOf(".") + "" == "-1" ||
        email.toemail.value == "") {
        alert("E-mail을 입력하세요.");
        email.toemail.focus();
        return false;
      }

      if (email.title.value.length < 1) {
        alert("글제목을 입력하세요.");
        email.title.focus();
        return false;
      }

      if (email.contents.value.length < 1) {
        alert("글내용을 입력하세요.");
        email.contents.focus();
        return false;
      }

      email.submit();
    }


    function list() {
      location.href = "listboard.jsp";
    }
  </script>
  <style>
    div.field {
      padding-left: 10px;
      padding-right: 10px;
    }

    form {
      margin-top: 30px;
    }

    @media(min-width: 720px) {
      #sender,
      #receiver
      {
        width: 50%;
      }
    }
  </style>
</head>

<body>
  
  <%
  String num = request.getParameter("num"); 
  ArticleDao dao = new ArticleDaoFactory().articleDao();
  String email = dao.getMailInfo(num);
  %>
  
  <center>
    <font size="3"><b> 이메일 발송하기 </b></font>
  </center>

  <form class="ui form" name="email" action="email_input.jsp" method="post" onsubmit="return Check()">
    <input type="hidden" name="num" value="<%=num%>">
    <div id="sender" class="field">
      <label>* 보내는 이</label>
      <input type="text" name="fromemail" placeholder="sender mail" />
    </div>
    <div id="receiver" class="field">
      <label>* 받는 이</label>
      <input type="text" name="fromemail" placeholder="receiver mail" value="<%=email%>/>
    </div>
    <div class="field">
      <label>메일 제목</label>
      <input type="text" name="title" placeholder="mail title" maxlength="50" />
    </div>
    <div class="field">
      <label>메일 내용</label>
      <textarea name="contents" placeholder="mail contents"></textarea>
    </div>
    <div class="field">
      <input class="ui button" type="reset" value="다시 작성" />
      <input class="ui button" type="submit" value="전송">
      <input type="button" class="ui button" value="목록으로" name="page" onclick="location.href='./listboard.jsp'">
    </div>
  </form>
</body>

</html>