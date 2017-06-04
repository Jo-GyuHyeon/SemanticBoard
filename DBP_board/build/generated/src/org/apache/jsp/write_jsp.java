package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import bean.Paging;

public final class write_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
 request.setCharacterEncoding("UTF-8"); 
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("  <title> TeamName | QnA Apply </title>\r\n");
      out.write("\r\n");
      out.write("  <meta charset=\"utf-8\">\r\n");
      out.write("  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\r\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0\">\r\n");
      out.write("  <script src=\"https://code.jquery.com/jquery-3.1.1.min.js\" integrity=\"sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("  <script src=\"semantic/semantic.js\"></script>\r\n");
      out.write("  <link rel=\"stylesheet\" type=\"text/css\" href=\"semantic/semantic.css\" />\r\n");
      out.write("\r\n");
      out.write("  <script>\r\n");
      out.write("    function Check() {\r\n");
      out.write("      if (Write.name.value.length < 1) {\r\n");
      out.write("        alert(\"작성자를 입력하세요.\");\r\n");
      out.write("        Write.name.focus();\r\n");
      out.write("        return false;\r\n");
      out.write("      }\r\n");
      out.write("\r\n");
      out.write("      if (Write.pass.value.length < 1) {\r\n");
      out.write("        alert(\"비밀번호를 입력하세요.\");\r\n");
      out.write("        Write.pass.focus();\r\n");
      out.write("        return false;\r\n");
      out.write("      }\r\n");
      out.write("\r\n");
      out.write("      if (Write.email.value.indexOf(\"@\") + \"\" == \"-1\" ||\r\n");
      out.write("        Write.email.value.indexOf(\".\") + \"\" == \"-1\" ||\r\n");
      out.write("        Write.email.value == \"\") {\r\n");
      out.write("        alert(\"E-mail을 입력하세요.\");\r\n");
      out.write("        Write.email.focus();\r\n");
      out.write("        return false;\r\n");
      out.write("      }\r\n");
      out.write("\r\n");
      out.write("      if (Write.title.value.length < 1) {\r\n");
      out.write("        alert(\"글제목을 입력하세요.\");\r\n");
      out.write("        Write.write_title.focus();\r\n");
      out.write("        return false;\r\n");
      out.write("      }\r\n");
      out.write("\r\n");
      out.write("      if (Write.contents.value.length < 1) {\r\n");
      out.write("        alert(\"글내용을 입력하세요.\");\r\n");
      out.write("        Write.content.focus();\r\n");
      out.write("        return false;\r\n");
      out.write("      }\r\n");
      out.write("    }\r\n");
      out.write("  </script>\r\n");
      out.write("  <style>\r\n");
      out.write("    div.field {\r\n");
      out.write("      padding-left: 10px;\r\n");
      out.write("      padding-right: 10px;\r\n");
      out.write("    }\r\n");
      out.write("    form {\r\n");
      out.write("      margin-top: 30px;\r\n");
      out.write("    }\r\n");
      out.write("    @media(min-width: 720px){\r\n");
      out.write("      #writer, #password, #email{\r\n");
      out.write("        width: 50%;\r\n");
      out.write("      }\r\n");
      out.write("    }\r\n");
      out.write("  </style>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\t");

	String num = request.getParameter("num");
	Paging paging = new Paging();
            String pageNum = paging.getPageNum(num);
	
      out.write("\r\n");
      out.write("  <form class=\"ui form\" name=\"Write\" action=\"write_input.jsp\" method=\"post\" enctype=\"multipart/form-data\" onsubmit=\"return Check()\">\r\n");
      out.write("    <h1 class=\"ui dividing header\"><center>Q & A    Apply</center></h1>\r\n");
      out.write("    <div class=\"field\">\r\n");
      out.write("      <label>* 작성자</label>\r\n");
      out.write("      <input id=\"writer\" type=\"text\" name=\"name\" placeholder=\"writer\" />\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"field\">\r\n");
      out.write("      <label>* 비밀번호(게시물 수정 삭제시 필요합니다.)</label>\r\n");
      out.write("      <input id=\"password\" type=\"password\" name=\"pass\" placeholder=\"password\" />\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"field\">\r\n");
      out.write("      <label>이메일</label>\r\n");
      out.write("      <input id=\"email\" type=\"email\" name=\"email\" placeholder=\"e-mail\" />\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"field\">\r\n");
      out.write("      <label>파일 첨부(사진, 문서 파일만 업로드 가능합니다.)</label>\r\n");
      out.write("      <div class=\"ui action input\">\r\n");
      out.write("        <input type=\"text\" id=\"_attachmentName\" placeholder=\"filename\" readonly>\r\n");
      out.write("        <label for=\"attachmentName\" class=\"ui icon button btn-file\">\r\n");
      out.write("             <i class=\"attach icon\"></i>\r\n");
      out.write("             <input type=\"file\" id=\"attachmentName\" name=\"filename\" style=\"display: none\">\r\n");
      out.write("        </label>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"field\">\r\n");
      out.write("      <label>글 제목</label>\r\n");
      out.write("      <input type=\"text\" name=\"title\" placeholder=\"write title\" />\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"field\">\r\n");
      out.write("      <label>글 내용</label>\r\n");
      out.write("      <textarea name=\"contents\" placeholder=\"write contents\"></textarea>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"field\">\r\n");
      out.write("      <input class=\"ui button\" type=\"reset\" value=\"다시 작성\"/>\r\n");
      out.write("      <input class=\"ui button\" type=\"submit\" value=\"등록\">\r\n");
      out.write("      <input type=\"button\" class=\"ui button\" value=\"목록으로\" onclick=\"location.href='./listboard.jsp?pageNum=");
      out.print(pageNum);
      out.write("'\">\r\n");
      out.write("    </div>\r\n");
      out.write("  </form>\r\n");
      out.write("    \r\n");
      out.write("  <script>\r\n");
      out.write("    var fileExtentionRange = '.zip .rar .tar .pdf .doc .docx .xls .xlsx .ppt .pptx .hwp .jpg .jpeg .png';\r\n");
      out.write("    var MAX_SIZE = 30; // MB\r\n");
      out.write("\r\n");
      out.write("    $(document).on('change', '.btn-file :file', function() {\r\n");
      out.write("      var input = $(this);\r\n");
      out.write("\r\n");
      out.write("      if (navigator.appVersion.indexOf(\"MSIE\") != -1) { // IE\r\n");
      out.write("        var label = input.val();\r\n");
      out.write("\r\n");
      out.write("        input.trigger('fileselect', [1, label, 0]);\r\n");
      out.write("      } else {\r\n");
      out.write("        var label = input.val().replace(/\\\\/g, '/').replace(/.*\\//, '');\r\n");
      out.write("        var numFiles = input.get(0).files ? input.get(0).files.length : 1;\r\n");
      out.write("        var size = input.get(0).files[0].size;\r\n");
      out.write("\r\n");
      out.write("        input.trigger('fileselect', [numFiles, label, size]);\r\n");
      out.write("      }\r\n");
      out.write("    });\r\n");
      out.write("\r\n");
      out.write("    $('.btn-file :file').on('fileselect', function(event, numFiles, label, size) {\r\n");
      out.write("      $('#attachmentName').attr('name', 'attachmentName'); // allow upload.\r\n");
      out.write("\r\n");
      out.write("      var postfix = label.substr(label.lastIndexOf('.'));\r\n");
      out.write("      if (fileExtentionRange.indexOf(postfix.toLowerCase()) > -1) {\r\n");
      out.write("        if (size > 1024 * 1024 * MAX_SIZE) {\r\n");
      out.write("          alert('max size：<strong>' + MAX_SIZE + '</strong> MB.');\r\n");
      out.write("\r\n");
      out.write("          $('#attachmentName').removeAttr('name'); // cancel upload file.\r\n");
      out.write("        } else {\r\n");
      out.write("          $('#_attachmentName').val(label);\r\n");
      out.write("        }\r\n");
      out.write("      } else {\r\n");
      out.write("        alert('파일 확장자는：' + fileExtentionRange + '만 입력 가능합니다.');\r\n");
      out.write("\r\n");
      out.write("        $('#attachmentName').removeAttr('name'); // cancel upload file.\r\n");
      out.write("      }\r\n");
      out.write("    });\r\n");
      out.write("  </script>\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
