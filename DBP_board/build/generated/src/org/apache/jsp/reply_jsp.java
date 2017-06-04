package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;

public final class reply_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=euc-kr");
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
 request.setCharacterEncoding("euc-kr"); 
      out.write("\r\n");
      out.write("\r\n");
      out.write("<HTML>\r\n");
      out.write("<HEAD>\r\n");
      out.write("<TITLE> 게시판 </TITLE>\r\n");
      out.write("\r\n");
      out.write("<SCRIPT language=\"JavaScript\">\r\n");
      out.write("function Check()\r\n");
      out.write("{\r\n");
      out.write("if (Modify.name.value.length < 1) {\r\n");
      out.write("\talert(\"작성자를 입력하세요.\");\r\n");
      out.write("\tModify.name.focus(); \r\n");
      out.write("        return false;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("if (Modify.pass.value.length < 1) {\r\n");
      out.write("\talert(\"비밀번호를 입력하세요.\");\r\n");
      out.write("\tModify.pass.focus(); \r\n");
      out.write("\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("if (Modify.email.value.indexOf(\"@\") + \"\" == \"-1\" ||\r\n");
      out.write("\tModify.email.value.indexOf(\".\") + \"\" == \"-1\" ||\r\n");
      out.write("\tModify.email.value == \"\" )\r\n");
      out.write("\t{ \r\n");
      out.write("\t\talert(\"E-mail을 입력하세요.\");\r\n");
      out.write("\t\tModify.email.focus();\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("if (Modify.title.value.length < 1) {\r\n");
      out.write("\talert(\"글제목을 입력하세요.\");\r\n");
      out.write("\tModify.title.focus(); \r\n");
      out.write("\treturn false;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("if (Modify.contents.value.length < 1) {\r\n");
      out.write("\talert(\"글내용을 입력하세요.\");\r\n");
      out.write("\tModify.contents.focus(); \r\n");
      out.write("\treturn false;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("Modify.submit();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function list()\r\n");
      out.write("{\r\n");
      out.write("location.href = \"listboard.asp\";\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</SCRIPT>\r\n");
      out.write("</HEAD>\r\n");
      out.write("\r\n");
      out.write("<BODY>\r\n");
      out.write("\r\n");

String num = request.getParameter("num"); 

Class.forName("oracle.jdbc.driver.OracleDriver");

String url = "jdbc:oracle:thin:@dalma.dongguk.ac.kr:1521:stud2";
Connection conn = DriverManager.getConnection(url,"kuhyun1993","rbgus123");

PreparedStatement pstmt = null;
ResultSet rs = null;

try {

String strSQL = "SELECT * FROM tblboard WHERE num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));

rs = pstmt.executeQuery();
rs.next();

String title = rs.getString("title");


      out.write("\r\n");
      out.write("                   \r\n");
      out.write("<center><font size='3'><b> 답변하기 </b></font>                  \r\n");
      out.write("\r\n");
      out.write("<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t\t<TD><hr size='1' noshade>\r\n");
      out.write("\t\t</TD>\r\n");
      out.write(" \t</TR>\r\n");
      out.write("</TABLE>\r\n");
      out.write("                 \r\n");
      out.write("<FORM Name='Modify' Action='reply_input.jsp' Method='POST' OnSubmit='return Check()'>\r\n");
      out.write("<input type='hidden' name='num' value='");
      out.print(num );
      out.write("'>\r\n");
      out.write("      \r\n");
      out.write("<TABLE border='0' width='600'>\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t\t<TD width='100' bgcolor='cccccc'>\r\n");
      out.write("\t\t\t<font size='2'><center><b>작성자</b></center></font> \r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t\t<TD>\r\n");
      out.write("\t\t\t<p><input type='text' size='12' name='name' value=\"\"> * 필수 </p>\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t\t<TD width='100' bgcolor='cccccc'>\r\n");
      out.write("\t\t\t<font size='2'><center><b>비밀번호</b></center></font>\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t\t<TD>\r\n");
      out.write("\t\t\t<p><input type='password' size='12' name='pass'> * 필수 </p>\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t\t<TD width='100' bgcolor='cccccc'>\r\n");
      out.write("\t\t\t<font size='2'><center><b>E-mail</b></center></font>\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t\t<TD>\r\n");
      out.write("\t\t\t<font size='2'><input type='text' size='40' maxlength='50' name='email' value=\"\"></font>\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("\t\r\n");
      out.write("\t<TR>\r\n");
      out.write("      \t\t<TD colspan='2'>\r\n");
      out.write("         \t\t<hr size='1' noshade>\r\n");
      out.write("      \t\t</TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t\t<TD width='100' bgcolor='cccccc'>\r\n");
      out.write("\t\t\t<font size='2'><center><b>글 제목</b></center></font>\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t\t<TD>\r\n");
      out.write("\t\t\t<font size='2'><input type='text' size='70' maxlength='50' name='title' value=\"[답변]");
      out.print(title );
      out.write("\"></font>\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t\t<TD bgcolor='cccccc'>\r\n");
      out.write("\t\t\t<font size='2'><center><b>글 내용</b></center></font>\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t\t<TD>\r\n");
      out.write("         \t\t<font size='2'>\r\n");
      out.write("         \t\t<textarea cols='70' rows='15' wrap='virtual' name='contents'></textarea>\r\n");
      out.write("         \t\t</font>\r\n");
      out.write("      \t\t</TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("\t\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t\t<TD colspan='2'><hr size='1' noshade></TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("\r\n");
      out.write("\t<TR>\r\n");
      out.write("\t\t<TD align='center' colspan='2' width='100%'>\r\n");
      out.write("\t\t<TABLE>\r\n");
      out.write("\t\t\t<TR>\r\n");
      out.write("\t\t\t\t<TD width='200' align='center'>\r\n");
      out.write("\t\t\t\t\t<input Type = 'Reset' Value = '다시 작성'>\r\n");
      out.write("\t\t\t\t</TD>\r\n");
      out.write("\t\t\t\t<TD width='200' align='center'>\r\n");
      out.write("\t\t\t\t\t<input Type = 'Submit' Value = '완료'>\r\n");
      out.write("\t\t\t\t</TD>\r\n");
      out.write("\t\t\t\t<TD width='200' align='center'>\r\n");
      out.write("\t\t\t\t\t<input Type = 'Button' Value = '목록' Name='Page' onClick='list();'>\r\n");
      out.write("\t\t\t\t</TD>\r\n");
      out.write("\t\t\t</TR>\r\n");
      out.write("\t\t</TABLE>\r\n");
      out.write("\t\t</TD>\r\n");
      out.write("\t</TR>\r\n");
      out.write("   \r\n");
      out.write("</TABLE>\r\n");
      out.write("\r\n");

}catch(SQLException e){
   	out.print("SQL에러 " + e.toString());
}catch(Exception ex){
   	out.print("JSP에러 " + ex.toString());
}finally{  
	rs.close();
	pstmt.close();
	conn.close();
}

      out.write("\r\n");
      out.write("\r\n");
      out.write("</BODY>\r\n");
      out.write("</HTML>\r\n");
      out.write("\r\n");
      out.write("\r\n");
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
