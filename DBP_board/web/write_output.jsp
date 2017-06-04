<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.util.*" %>
<%@page import="dao.*"%>
<%@page import="bean.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>

    <head>
        <title> 게시판 </title>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
        <script src="semantic/semantic.js"></script>
        <link rel="stylesheet" type="text/css" href="semantic/semantic.css" />
        <style>
            #contents {
                text-align: left;
            }

            #left {
                padding-left: 10px;
            }

            #right {
                padding-right: 10px;
                float: right;
            }
            table{
                max-width: 700px;
            }
            h1.header>center{
                padding-top: 20px;
            }
            #table{
                padding-left: 10px;
                padding-right: 10px;
            }
            th{
                width: 30%;
            }
            #button{
                min-width: 350px;
            }


            .hidden.menu {
                display: none;
            }

            .masthead.segment {
                padding: 1em 0em;
            }

            .masthead .logo.item img {
                margin-right: 1em;
            }

            .masthead .ui.menu .ui.button {
                margin-left: 0.5em;
            }

            .masthead h1.ui.header {
                margin-top: 3em;
                margin-bottom: 0em;
                font-size: 4em;
                font-weight: normal;
            }

            .masthead h2 {
                font-size: 1.7em;
                font-weight: normal;
            }

            .ui.vertical.stripe {
                padding: 8em 0em;
            }

            .ui.vertical.stripe h3 {
                font-size: 2em;
            }

            .ui.vertical.stripe .button+h3,
            .ui.vertical.stripe p+h3 {
                margin-top: 3em;
            }

            .ui.vertical.stripe .floated.image {
                clear: both;
            }

            .ui.vertical.stripe p {
                font-size: 1.33em;
            }

            .ui.vertical.stripe .horizontal.divider {
                margin: 3em 0em;
            }

            .quote.stripe.segment {
                padding: 0em;
            }

            .quote.stripe.segment .grid .column {
                padding-top: 5em;
                padding-bottom: 5em;
            }

            .footer.segment {
                padding: 5em 0em;
            }

            .secondary.pointing.menu .toc.item {
                display: none;
            }

        </style>
        <script>
            $(document)
                    .ready(function () {

                        // fix menu when passed
                        $('.masthead')
                                .visibility({
                                    once: false,
                                    onBottomPassed: function () {
                                        $('.fixed.menu').transition('fade in');
                                    },
                                    onBottomPassedReverse: function () {
                                        $('.fixed.menu').transition('fade out');
                                    }
                                });

                        // create sidebar and attach to menu open
                        $('.ui.sidebar')
                                .sidebar('attach events', '.toc.item');

                    });
        </script>
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
                Article model = dao.getArticle(num);
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
                dao.update_readcount(num);
            %>
        </div>
    </body>

</html>