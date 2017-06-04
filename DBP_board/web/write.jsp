<%@page import="bean.Paging"%>
<%@ page language="java" contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
  <title> TeamName | QnA Apply </title>

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
  </style>
</head>

<body>
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
             <input type="file" id="attachmentName" name="filename" style="display: none">
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
      <input type="button" class="ui button" value="목록으로" onclick="location.href='./listboard.jsp?pageNum=<%=pageNum%>'">
    </div>
  </form>
    
  <script>
    var fileExtentionRange = '.zip .rar .tar .pdf .doc .docx .xls .xlsx .ppt .pptx .hwp .jpg .jpeg .png';
    var MAX_SIZE = 30; // MB

    $(document).on('change', '.btn-file :file', function() {
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

    $('.btn-file :file').on('fileselect', function(event, numFiles, label, size) {
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
