<%@page import="dao.ArticleDaoFactory"%>
<%@page import="dao.ArticleDao"%>
<%@page import="bean.Article"%>
<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%--
Document : email.jsp
Content : 이메일 form 
Created on : 2016. 5. 29, 오후 5:28:07
Author : Team_dongguk(하헌우, 황호찬, 조규현)
--%>

<!DOCTYPE html>
<html>

    <head>
        <title> email | TeamDG </title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
        <script src="semantic/semantic.js"></script>
        <script src="js/email.js"></script>
        <link rel="stylesheet" type="text/css" href="semantic/semantic.css" />
        <link rel="stylesheet" type="text/css" href="css/header.css" />
        <link rel="stylesheet" type="text/css" href="css/email.css" />
    </head>

    <body>
    <!-- Following Menu -->
        <div class="ui large top fixed hidden menu">

            <div class="ui four item menu">
                <a href="index.html" class="item">Home</a>
                <a href="about.html" class="item">About</a>
                <a href="projects.html" class="item">Projects</a>
                <a href="listboard.jsp" class="active item">Help</a>
            </div>
        </div>
        <!-- Sidebar Menu -->
        <div class="ui vertical inverted sidebar menu left">
            <a href="index.html" class="item">Home</a>
            <a href="about.html" class="item">About</a>
            <a href="projects.html" class="item">Projects</a>
            <a href="listboard.jsp" class="active item">Help</a>
        </div>
        <div class="pusher">
            <div class="ui inverted vertical masthead center aligned segment" >

                <div class="ui container">
                    <div class="ui large secondary inverted pointing menu">
                        <a class="toc item">
                            <i class="sidebar icon"></i>
                        </a>
                        <a href="index.html" class="item">Home</a>
                        <a href="about.html" class="item">About</a>
                        <a href="projects.html" class="item">Projects</a>
                        <a href="listboard.jsp" class="active item">Help</a>
                    </div>
                </div>
            </div>
                <%
                    String num = request.getParameter("num");
                    ArticleDao dao = new ArticleDaoFactory().articleDao();
                    String email = dao.getMailInfo(num);
                %>

                <h1 class="ui dividing header"><center>Send Email</center></h1>
           

                <form class="ui form" name="email" action="email_input.jsp" method="post" onsubmit="return Check()">
                    <input type="hidden" name="num" value="<%=num%>">
                    <div id="receiver" class="field">
                        <label>* 받는 이</label>
                        <input type="text" name="toemail" placeholder="receiver mail" value="<%=email%>/>
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
                        <input type="button" class="ui button" value="목록으로" name="page" onclick="location.href = './listboard.jsp'">
                    </div>
                </form>
            </div>
    </body>

</html>