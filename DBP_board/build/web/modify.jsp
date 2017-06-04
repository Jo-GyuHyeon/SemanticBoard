<%@page import="bean.Paging"%>
<%@page import="dao.ArticleDaoFactory"%>
<%@page import="bean.Article"%>
<%@page import="dao.ArticleDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <title> TeamName | Modify </title>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
        <script src="semantic/semantic.js"></script>
        <link rel="stylesheet" type="text/css" href="semantic/semantic.css" />

        <script>
            function Check() {
                if (Write.name.value.length < 1) {
                    alert("작성자를 입력하세요.");
                    Write.name.focus();
                    return false;
                }

                if (Write.pass.value.length < 1) {
                    alert("비밀번호를 입력하세요.");
                    Write.pass.focus();
                    return false;
                }

                if (Write.email.value.indexOf("@") + "" == "-1" ||
                        Write.email.value.indexOf(".") + "" == "-1" ||
                        Write.email.value == "") {
                    alert("E-mail을 입력하세요.");
                    Write.email.focus();
                    return false;
                }

                if (Write.title.value.length < 1) {
                    alert("글제목을 입력하세요.");
                    Write.write_title.focus();
                    return false;
                }

                if (Write.contents.value.length < 1) {
                alert("글내용을 입력하세요.");
                Write.content.focus();
                return false;
                }
            }
        </script>
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
        <style>
            div.field {
                padding-left: 10px;
                padding-right: 10px;
            }
            form {
                margin-top: 30px;
            }
            @media(min-width: 720px){
                #writer, #password, #email{
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
                String email = model.getEmail();
                String title = model.getTitle();
                String contents = model.getContents().trim();
                Paging paging = new Paging();
                String pageNum = paging.getPageNum(num);
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
                            <input type="file" id="attachmentName" name="filename" style="display: none">
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
            <script>
                var fileExtentionRange = '.zip .rar .tar .pdf .doc .docx .xls .xlsx .ppt .pptx .hwp .jpg .jpeg .png';
                var MAX_SIZE = 30; // MB

                $(document).on('change', '.btn-file :file', function () {
                    var input = $(this);

                    if (navigator.appVersion.indexOf("MSIE") != -1) { // IE
                        var label = input.val();

                        input.trigger('fileselect', [1, label, 0]);
                    } else {
                        var label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
                        var numFiles = input.get(0).files ? input.get(0).files.length : 1;
                        var size = input.get(0).files[0].size;

                        input.trigger('fileselect', [numFiles, label, size]);
                    }
                });

                $('.btn-file :file').on('fileselect', function (event, numFiles, label, size) {
                    $('#attachmentName').attr('name', 'attachmentName'); // allow upload.

                    var postfix = label.substr(label.lastIndexOf('.'));
                    if (fileExtentionRange.indexOf(postfix.toLowerCase()) > -1) {
                        if (size > 1024 * 1024 * MAX_SIZE) {
                            alert('max size：<strong>' + MAX_SIZE + '</strong> MB.');

                            $('#attachmentName').removeAttr('name'); // cancel upload file.
                        } else {
                            $('#_attachmentName').val(label);
                        }
                    } else {
                        alert('파일 확장자는：' + fileExtentionRange + '만 입력 가능합니다.');

                        $('#attachmentName').removeAttr('name'); // cancel upload file.
                    }
                });
            </script>
    </body>

</html>
