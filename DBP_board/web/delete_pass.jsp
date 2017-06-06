<%@page import="bean.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>

    <head>
        <title> Delete | TeamDG </title>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
        <script src="semantic/semantic.js"></script>
        <link rel="stylesheet" type="text/css" href="semantic/semantic.css" />
        <link rel="stylesheet" type="text/css" href="css/header.css" />
        <link rel="stylesheet" type="text/css" href="css/delete_pass.css" />
        <script src="js/header.js"></script>
        
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
                Paging paging = new Paging();
                String pageNum = paging.getPageNum(num);
            %>
           

            <form class="ui form" id="submit" action="delete_input.jsp" method="post">
                <h2 class="ui dividing header"><center>비밀번호 확인</center></h2>
                <center>
                    <input type="hidden" name="num" value="<%=num%>">
                    <div class="field">
                        <input id="password" type="password" name="pass" placeholder="password" />
                    </div>
                    <div class="field">
                        <input id="confirm" class="ui button" type="button" value="확인" />
                        <input class="ui button" type="button" onclick="location.href = './listboard.jsp?pageNum=<%=pageNum%>'" value="목록 보기" />
                    </div>
                </center>

                <div class="ui basic modal">
                    <div class="ui icon header">
                        <i class="archive icon"></i>글 삭제
                    </div>
                    <div class="content">
                        <p>
                        <center>정말 삭제하시겠습니까?</center>
                        </p>
                    </div>
                    <div class="actions">
                        <center>
                            <div class="ui red basic cancel inverted button">
                                <i class="remove icon"></i> No
                            </div>
                            <div class="ui green ok approve inverted button" onclick="document.getElementById('submit').submit()">
                                <i class="checkmark icon"></i> Yes
                            </div>
                        </center>
                    </div>
                </div>

            </form>

            <script>
                $('#confirm').click(function () {
                    $('.ui.basic.modal')
                            .modal('show');
                })
            </script>
    </body>

</html>
