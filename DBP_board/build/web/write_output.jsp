<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.util.*" %>
<%@page import="dao.*"%>
<%@page import="bean.*"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%--
Document : write_output.jsp
Content : 게시글 확인 
Created on : 2016. 5. 29, 오후 5:28:07
Author : Team_dongguk(하헌우, 황호찬, 조규현)
--%>

<!DOCTYPE html>
<html>

    <head>
        <title> Show QnA | TeamDG </title>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
        <script src="semantic/semantic.js"></script>
        <script src="js/header.js"></script>
        <link rel="stylesheet" type="text/css" href="semantic/semantic.css" />
        <link rel="stylesheet" type="text/css" href="css/header.css" />
        <link rel="stylesheet" type="text/css" href="css/write_output.css" />
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

                ArticleDao dao = new ArticleDaoFactory().articleDao();      //ArticleDaoFactory를 이용하여 dao 객체 생성한다.
                Article model = dao.getArticle(num);        //Article이라는 bean 객체 생성하여 게시글 번호에 해당하는 게시글을 가져온다.
                String name = model.getName();
                String title = model.getTitle();
                String contents = model.getContents().trim();
                String writedate = model.getWritedate();
                int readcount = model.getReadcount();
                String filename = model.getFilename();
                  Paging paging = new Paging();
                String pageNum = paging.getPageNum(num);
            %>
            <h1 class="ui padded header"><center>Read Contents</center></h1>
            <div id="table" class="container padded">
                <center>
                    <table class="ui stackable table">
                        <thead>
                            <tr>
                                <th><text>작성자 :<a href="email.jsp?num=<%=num%>"><%=name%></a></text>
                                </th>
                                <th><text>작성일:<%=writedate%></text>
                                </th>
                            </tr>
                            <tr>
                                <th><text>조회수:<%=readcount%></text>
                                </th>
                                <th><text>파일 :<a href="file_down.jsp?num=<%=num%>"><%=filename%></a></text>
                                </th>
                            </tr>
                        </thead>
                    </table>
                </center>
            </div>
            <div id="contents" class="ui raised very padded text container segment">
                <h2 class="ui header"><%=title%></h2>
                <p>
                    <%=contents%>
                </p>
            </div>
            <div id="button" class="ui text padded raised container">
                <div id="left" class="ui buttons">
                    <button class="ui button" onclick="location.href = './modify_pass.jsp?num=<%=num%>'">수정</button>
                    <button class="ui button" onclick="location.href = './delete_pass.jsp?num=<%=num%>'">삭제</button>
                </div>

                <div id="right" class="ui buttons">
                    <button class="ui button" onclick="location.href = './reply.jsp?num=<%=num%>'">답변</button>
                    <button class="ui button" onclick="location.href = './listboard.jsp?pageNum=<%=pageNum%>'">목록보기</button>
                </div>
            </div>
            <%
                dao.update_readcount(num);      //dao 객체를 이용하여 게시글 조회수를 update 한다.
            %>
        </div>
    </body>

</html>