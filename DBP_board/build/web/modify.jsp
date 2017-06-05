<%@page import="bean.Paging"%>
<%@page import="dao.ArticleDaoFactory"%>
<%@page import="bean.Article"%>
<%@page import="dao.ArticleDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<%--
Document : modify.jsp
Content : 게시물 수정 form
Created on : 2016. 5. 29, 오후 5:28:07
Author : Team_dongguk(하헌우, 황호찬, 조규현)
--%>

<html>
    <head>
        <title> Modify | TeamDG </title>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
        <script src="semantic/semantic.js"></script>
        <script src="js/header.js"></script>
        <script src="js/modify.js"></script>
        <link rel="stylesheet" type="text/css" href="semantic/semantic.css" />
        <link rel="stylesheet" type="text/css" href="css/header.css" />
        <link rel="stylesheet" type="text/css" href="css/modify.css" />
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

                ArticleDao dao = new ArticleDaoFactory().articleDao();  //ArticleDaoFactory를 이용하여 dao 객체 생성한다.
                Article model = dao.getArticle(num);

                String name = model.getName();
                String email = model.getEmail();
                String title = model.getTitle();
                String contents = model.getContents().trim();
                Paging paging = new Paging();                   //Paging 객체를 생성
                String pageNum = paging.getPageNum(num);        //Paging 객체를 생성하여 현재 페이지를 구하는데 이용한다.
            %>
            <form class="ui form" name="Write" action="modify_output.jsp" method="post" enctype="multipart/form-data" onsubmit="return Check()">
                <input type="hidden" name="num" value="<%=num%>">
                <h1 class="ui dividing header"><center>Modify Article</center></h1>
                <div class="field">
                    <label>* 작성자</label>
                    <input id="writer" type="text" name="name" placeholder="writer" value="<%=name%>"/>
                </div>
                <div class="field">
                    <label>* 비밀번호(게시물 수정 삭제시 필요합니다.)</label>
                    <input id="password" type="password" name="pass" placeholder="password" />
                </div>
                <div class="field">
                    <label>이메일</label>
                    <input id="email" type="email" name="email" placeholder="e-mail" value="<%=email%>"/>
                </div>
                <div class="field">
                    <label>파일 첨부(사진, 문서 파일만 업로드 가능합니다.)</label>
                    <div class="ui action input">
                        <input type="text" id="_attachmentName" placeholder="filename" readonly>
                        <label for="attachmentName" class="ui icon button btn-file">
                            <i class="attach icon"></i>
                            <input type="file" id="attachmentName" name="attachmentName" style="display: none">
                        </label>
                    </div>
                </div>
                <div class="field">
                    <label>글 제목</label>
                    <input type="text" name="title" placeholder="write title" value="<%=title%>"/>
                </div>
                <div class="field">
                    <label>글 내용</label>
                    <textarea name="contents" placeholder="write contents"><%=contents%></textarea>
                </div>
                <div class="field">
                    <input class="ui button" type="reset" value="다시 작성"/>
                    <input id="confirm" class="ui button" type="submit" value="수정">
                    <input type="button" class="ui button" value="목록으로" onclick="location.href = './listboard.jsp?pageNum=<%=pageNum%>'">
                </div>
            </form>
        </div>
        <script src="js/fileupload.js"></script>
    </body>

</html>
