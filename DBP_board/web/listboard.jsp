<%@page import="com.sun.javafx.sg.prism.NGShape.Mode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "bean.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!doctype html>
<html>

    <head>
        <!-- Standard Meta -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
        <script src="semantic/semantic.js"></script>
        <link rel="stylesheet" type="text/css" href="semantic/semantic.css" />
        <TITLE> 게시판 </TITLE>
        <SCRIPT language="JavaScript">
            function Check()
            {
                if (Form.keyword.value.length < 1) {
                    alert("검색어를 입력하세요.");
                    Form.keyword.focus();
                    return false;
                }
            }
            function boardWrite(pageNum)
            {
                //  alert(pageNum);
                location.href = "./write.jsp?pageNum=" + pageNum;
            }
        </SCRIPT>

        <META http-equiv="Content-Type" content="text/html; charset=euc-kr">
        <style type='text/css'>

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

            @media only screen and (max-width: 700px) {
                .ui.fixed.menu {}
                .secondary.pointing.menu .item,
                .secondary.pointing.menu .menu {
                    display: none;
                }
                .secondary.pointing.menu .toc.item {
                    display: block;
                }
                .masthead.segment {}
                .masthead h1.ui.header {
                    font-size: 2em;
                    margin-top: 1.5em;
                }
                .masthead h2 {
                    margin-top: 0.5em;
                    font-size: 1.5em;
                }
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
    </HEAD>
    <body clas="pushable">

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
                String key = request.getParameter("key");
                String keyword = request.getParameter("keyword");

                String pageNum = request.getParameter("pageNum");
                if (pageNum == null) {
                    pageNum = "1";
                }

                int listSize = 10;
                int pageSize = 10;
                //  int currentPage = Integer.parseInt(pageNum);
                int lastRow = 0;
                List list = null;
                ArticleDao dao = new ArticleDaoFactory().articleDao();
                lastRow = dao.getSelectLastRow(key, keyword);
                int endRow = lastRow - ((Integer.parseInt(pageNum) - 1) * listSize);
                int startRow = endRow - (listSize - 1);
                Paging paging = new Paging(lastRow, Integer.parseInt(pageNum), listSize, pageSize);
            %>

            <center style ="padding-top:50px"><font size='3' style ="padding-top:100px;"><h1> Q&A Board </h1></font></TD>


                <table class="ui unstackable table">
                    <thead>
                        <tr>
                            <th><center><b>번호</b></center></th>
                            <th><center><b>글 제목</b></center></th>
                    <th><center><b>작성자</b></center></th>
                    <th ><center><b>작성일</b></center></th>
                    <th><center><b>조회</b></center></th>
                    </tr>
                    </thead>

                    <%            if (lastRow > 0) {
                            list = dao.getSelectDBAll(startRow, endRow, key, keyword);

                            Iterator it = list.iterator();
                            Article bean;
                            while (it.hasNext()) {
                                bean = (Article) it.next();
                                int listnum = bean.getNum();
                                String name = bean.getName();
                                String email = bean.getEmail();
                                String title = bean.getTitle();
                                String writedate = bean.getWritedate();
                                int readcount = bean.getReadcount();
                    %>
                    <tbody>
                        <tr>
                            <td ><center><%=listnum%></center></td>
                            <td ><center><a href="write_output.jsp?num=<%=listnum%>"><%=title%></a></center></td>
                            <td ><center><a href="email.jsp?num=<%=listnum%>"><%=name%></a></center></td>
                            <td ><center><%=writedate%></center></td>
                            <td ><center><%=readcount%></center></td>
                        </tr>
                    </tbody>


                    <%
                        }
                    %>

                </table>
                <table class="ui celled table">

                    <tfoot style ="text-align: center;">
                        <tr><th colspan="3">
                                <div class="ui pagination menu" >
                                    <%
                                        }

                                        if (paging.getStartPage() > 5) {
                                    %>
                                    <a class="icon item" href="./listboard.jsp?pageNum=<%=paging.getStartPage() - 5%>">[이전]</a>
                                    <%
                                        }
                                        while (paging.getStartPage() <= paging.getEndPage()) {
                                    %>
                                    <a class="item" href="./listboard.jsp?pageNum=<%=paging.getStartPage()%>"><%=paging.getStartPage()%></a>
                                    <%

                                            paging.setStartPage(paging.getStartPage() + 1);
                                        }
                                        if (paging.getEndPage() < paging.getTotalPages()) {
                                    %>
                                    <a class="icon item" href="./listboard.jsp?pageNum=<%=paging.getStartPage()%>"> > </a>
                                    <%
                                        }
                                    %>
                                </div>
                            </th>
                        </tr></tfoot>
                </table>


                <TABLE border=0 width=600>
                    <TR>
                        <TD align='center' style= padding-bottom:1.5em>
                            <TABLE border='0' cellpadding='0' cellspacing='0'>

                                <FORM Name='Form' Method='POST' Action='listboard.jsp' method = 'post' OnSubmit='return Check()'>

                                    <input type='hidden' name='search' value='1'>

                                    <div class="ui action input">
                                        <input type='text' placeholder="Search..." name='keyword' size='20' maxlength='30'>
                                        <select name="key" class="ui compact selection dropdown">
                                            <option value='title' selected>글제목</option>
                                            <option value='contents'>글내용</option>
                                            <option value='name'>작성자</option>
                                        </select>
                                        <button type="submit" class="ui button"/>Search</button>
                                    </div>
                                </FORM>
                            </TABLE>
                        </TD>
                        <TD align='right' style= padding-bottom:1.5em>
                            <button class="ui button" onclick='boardWrite(<%=pageNum%>)'>등록</button>
                        </TD>
                    </TR>
                </TABLE>

                <div class="ui inverted vertical footer segment">
                    <div class="ui container">
                        <div class="ui stackable inverted divided equal height stackable grid">
                            <div class="three wide column">
                                <h4 class="ui inverted header">About</h4>
                                <div class="ui inverted link list">
                                    <a href="#" class="item">Hahunnwo</a>
                                    <a href="#" class="item">Hawnghochan</a>
                                    <a href="#" class="item">Joekyuhyun</a>
                                </div>
                            </div>
                            <div class="three wide column">
                                <h4 class="ui inverted header">Projects</h4>
                                <div class="ui inverted link list">
                                    <a href="#" class="item">WhatDo</a>
                                    <a href="#" class="item">AnyToon</a>
                                    <a href="#" class="item">WhereTrip</a>
                                </div>
                            </div>
                            <div class="seven wide column">
                                <h4 class="ui inverted header">others</h4>
                                <p>
                                    All questions ask you to contact the help board.</p>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </body>
</HTML>
