<%@page import="bean.Paging"%>
<%@ page language="java" contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<%--
Document : write.jsp
Content : 게시글 작성 form 
Created on : 2016. 5. 29, 오후 5:28:07
Author : Team_dongguk(하헌우, 황호찬, 조규현)
--%>
<html>
    <head>
        <title> QnA Apply | TeamDG </title>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
        <script src="semantic/semantic.js"></script>
        <script src="js/header.js"></script>
        <script src="js/write.js"></script>
        <link rel="stylesheet" type="text/css" href="semantic/semantic.css" />
        <link rel="stylesheet" type="text/css" href="css/header.css" />
        <link rel="stylesheet" type="text/css" href="css/footer.css" />
        <link rel="stylesheet" type="text/css" href="css/write.css" />
        <style>
            div.field {
                padding-left: 10px;
                padding-right: 10px;
            }
            form {
                margin-top: 30px;
            }
            @media(min-width: 1025px){
                #writer, #password, #email{
                    width: 50%;
                }
                .ui.form {
                    padding-left: 250px;
                    padding-right:250px;
                }
            }
        </style>
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
            </div>
        
        <%
            String pageNum = request.getParameter("pageNum");
        %>
        <form class="ui form" name="Write" action="write_input.jsp" method="post" enctype="multipart/form-data" onsubmit="return Check()">
            <h1 class="ui dividing header"><center>Q & A    Apply</center></h1>
            <div class="field">
                <label>* 작성자</label>
                <input id="writer" type="text" name="name" placeholder="writer" />
            </div>
            <div class="field">
                <label>* 비밀번호(게시물 수정 삭제시 필요합니다.)</label>
                <input id="password" type="password" name="pass" placeholder="password" />
            </div>
            <div class="field">
                <label>이메일</label>
                <input id="email" type="email" name="email" placeholder="e-mail" />
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
                <input type="text" name="title" placeholder="write title" />
            </div>
            <div class="field">
                <label>글 내용</label>
                <textarea name="contents" placeholder="write contents"></textarea>
            </div>
            <div class="field">
                <input class="ui button" type="reset" value="다시 작성"/>
                <input class="ui button" type="submit" value="등록">
                <input type="button" class="ui button" value="목록으로" onclick="location.href = './listboard.jsp?pageNum=<%=pageNum%>'">
            </div>
        </form>

        <script src="js/fileupload.js"></script>
    </body>

</html>
