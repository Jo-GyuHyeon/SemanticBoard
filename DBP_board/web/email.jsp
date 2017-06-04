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
                    <input type="button" class="ui button" value="목록으로" name="page" onclick="location.href = './listboard.jsp'">
                </div>
            </form>
    </body>

</html>