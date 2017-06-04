package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;

public final class newjsp_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');
      out.write('\n');
 request.setCharacterEncoding("euc-kr"); 
      out.write("\n");
      out.write("\n");
      out.write("<HTML>\n");
      out.write("<HEAD>\n");
      out.write("<TITLE> 게시판 </TITLE>\n");
      out.write("\n");
      out.write("<SCRIPT language=\"JavaScript\">\n");
      out.write("function Check()\n");
      out.write("{\n");
      out.write("if (Form.keyword.value.length < 1) {\n");
      out.write("\talert(\"검색어를 입력하세요.\");\n");
      out.write("\tForm.keyword.focus(); \n");
      out.write("         return false;\n");
      out.write("\t}\n");
      out.write("}\n");
      out.write("</SCRIPT>\n");
      out.write("\n");
      out.write("<META http-equiv=\"Content-Type\" content=\"text/html; charset=euc-kr\">\n");
      out.write("<style type='text/css'>\n");
      out.write("<!--\n");
      out.write("\ta:link\t\t{font-family:\"\";color:black;text-decoration:none;}\n");
      out.write("\ta:visited\t{font-family:\"\";color:black;text-decoration:none;}\n");
      out.write("\ta:hover\t\t{font-family:\"\";color:black;text-decoration:underline;}\n");
      out.write("-->\n");
      out.write("</style>\n");
      out.write("\n");
      out.write("</HEAD>\n");
      out.write("<BODY>\n");
      out.write("\n");

String key = request.getParameter("key");
String keyword = request.getParameter("keyword");

String pageNum = request.getParameter("pageNum");
if(pageNum == null){
	pageNum = "1";	
}

int listSize = 5;
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage - 1) * listSize + 1;
int endRow = currentPage * listSize;
int lastRow = 0;
int i = 0;
String strSQL = "";

Class.forName("oracle.jdbc.driver.OracleDriver");

String url = "jdbc:oracle:thin:@dalma.dongguk.ac.kr:1521:stud2";
Connection conn = DriverManager.getConnection(url,"kuhyun1993","rbgus123");

Statement stmt = conn.createStatement();
ResultSet rs = null;

if (key==null || keyword==null){
	strSQL = "SELECT count(*) FROM tblboard";
}else{
	strSQL = "SELECT count(*) FROM tblboard WHERE " + key + " like '%" + keyword + "%'";
}
rs = stmt.executeQuery(strSQL);
rs.next();
lastRow = rs.getInt(1);

rs.close();

      out.write("\n");
      out.write("\n");
      out.write("<center><font size='3'><b> 게시판 </b></font></TD>\n");
      out.write("                                    \n");
      out.write("<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>\n");
      out.write("\t<TR>\n");
      out.write("\t\t<TD><hr size='1' noshade>\n");
      out.write("\t\t</TD>\n");
      out.write(" \t</TR>\n");
      out.write("</TABLE>              \n");
      out.write("                    \n");
      out.write("<TABLE border='0' cellspacing=1 cellpadding=2 width='600'>      \n");
      out.write("\n");
      out.write("\t<TR bgcolor='cccccc'>      \n");
      out.write("\t\t<TD><font size=2><center><b>번호</b></center></font></TD>      \n");
      out.write("\t\t<TD><font size=2><center><b>글 제목</b></center></font></TD>      \n");
      out.write("\t\t<TD><font size=2><center><b>작성자</b></center></font></TD>      \n");
      out.write("\t\t<TD><font size=2><center><b>작성일</b></center></font></TD>      \n");
      out.write("\t\t<TD><font size=2><center><b>조회</b></center></font></TD>      \n");
      out.write("\t</TR>   \n");
      out.write("\t\n");

if(lastRow > 0) {
	if(key==null || keyword==null){
		strSQL = "SELECT * FROM tblboard WHERE num BETWEEN " + startRow + " and " + endRow + "ORDER BY num DESC";
		rs = stmt.executeQuery(strSQL);
	} else {
		strSQL = "SELECT * FROM tblboard WHERE " + key + " like '%" + keyword + "%' ORDER BY num DESC";
		rs = stmt.executeQuery(strSQL);
	}

	for (i = 1; i < listSize; i++){			
		while(rs.next()){

		int listnum = rs.getInt("num");
		String name = rs.getString("name");
		String email = rs.getString("email");
		String title = rs.getString("title");
		String writedate = rs.getString("writedate");
		int readcount = rs.getInt("readcount");

      out.write("\n");
      out.write("\n");
      out.write("\t<TR bgcolor='ededed'>     \n");
      out.write("\t\t<TD align=center><font size=2 color='black'>");
      out.print(listnum );
      out.write("</font></TD>     \n");
      out.write("\t\t<TD align=left>\n");
      out.write("\t\t\t<a href=\"write_output.jsp?num=");
      out.print(listnum );
      out.write("\">\n");
      out.write("\t\t\t<font size=2 color=\"black\">");
      out.print(title );
      out.write("</font></a>\n");
      out.write("\t\t</TD>\n");
      out.write("\t\t<TD align=center>    \n");
      out.write("\t\t\t<a href=\"");
      out.print(email );
      out.write("\">\n");
      out.write("\t\t\t<font size=2 color=\"black\">");
      out.print(name );
      out.write("</font></a>     \n");
      out.write("\t\t</TD>     \n");
      out.write("\t\t<TD align=center><font size=2>");
      out.print(writedate );
      out.write("</font>\n");
      out.write("\t\t</TD>     \n");
      out.write("\t\t<TD align=center><font size=2>");
      out.print(readcount );
      out.write("</font>     \n");
      out.write("\t</TR>  \n");
      out.write("\t   \t\n");
 
		}    
	}	

      out.write("\n");
      out.write("\n");
      out.write("</TABLE>     \n");
      out.write("\n");
      out.write("<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>\n");
      out.write("\t<TR>\n");
      out.write("\t\t<TD><hr size='1' noshade>\n");
      out.write("\t\t</TD>\n");
      out.write(" \t</TR>\n");
      out.write("</TABLE> \n");
      out.write("                  \t                   \n");

rs.close();
stmt.close();
conn.close();
}

if(lastRow > 0) {
	int setPage = 1;
	int lastPage = 0;
	if(lastRow % listSize == 0)
		lastPage = lastRow / listSize;
	else
		lastPage = lastRow / listSize + 1;

	if(currentPage > 1) {

      out.write("\n");
      out.write("\t\t<a href=\"newjsp.jsp?pageNum=");
      out.print(currentPage-1);
      out.write("\">[이전]</a>\t\n");
	
	}
	for(i=setPage; i<=lastPage; i++) {
		if (i == Integer.parseInt(pageNum)){

      out.write("\n");
      out.write("\t\t[");
      out.print(i);
      out.write(']');
      out.write('\n');
		
		}else{

      out.write("\n");
      out.write("\t\t<a href=\"newjsp.jsp?pageNum=");
      out.print(i);
      out.write("\">[");
      out.print(i);
      out.write("]</a>\n");

		}
	}
	if(lastPage > currentPage) {

      out.write("\n");
      out.write("\t\t<a href=\"newjsp.jsp?pageNum=");
      out.print(currentPage+1);
      out.write("\">[다음]</a>\n");

	}
}

      out.write("  \n");
      out.write("\n");
      out.write("<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>\n");
      out.write("\t<TR>\n");
      out.write("\t\t<TD><hr size='1' noshade>\n");
      out.write("\t\t</TD>\n");
      out.write(" \t</TR>\n");
      out.write("</TABLE>                    \n");
      out.write("\n");
      out.write("<TABLE border=0 width=600>\n");
      out.write("\t<TR>\n");
      out.write("\t\t<TD align='center'>\t\n");
      out.write("\t\t\t<TABLE border='0' cellpadding='0' cellspacing='0'>\n");
      out.write("\t\t\t<FORM Name='Form' Method='POST' Action='newjsp.jsp' OnSubmit='return Check()'>\n");
      out.write("\t\t\t<input type='hidden' name='search' value='1'>\n");
      out.write("\t\t\t<TR>\n");
      out.write("\t\t\t\t<TD align='right'>\n");
      out.write("\t\t\t\t<select name='key' style=\"background-color:cccccc;\">\n");
      out.write("\t\t\t\t<option value='title' selected><font size='2'>\n");
      out.write("                                                        글제목</font></option>\n");
      out.write("\t\t\t\t<option value='contents'><font size='2'>\n");
      out.write("                                                        글내용</font></option>\n");
      out.write("\t\t\t\t<option value='name'><font size='2'>\n");
      out.write("                                                        작성자</font></option>\n");
      out.write("\t\t\t\t</select>\n");
      out.write("\t\t\t\t</TD>\n");
      out.write("\t\t\t\t<TD align='left'>\n");
      out.write("\t\t\t\t\t<input type='text' name='keyword' \n");
      out.write("                                                   value='' size='20' maxlength='30'>\n");
      out.write("\t\t\t\t\t<input type='submit' value='검색'>\n");
      out.write("\t\t\t\t</td>\n");
      out.write("\t\t\t  </TR>\n");
      out.write("\t\t\t  </FORM>\n");
      out.write("\t\t\t  </TABLE> \n");
      out.write("\t\t</TD>\n");
      out.write("\n");
      out.write("\t\t<TD align='right'>\t\t\n");
      out.write("\t\t<a href='write.jsp'>[등록]</a>\t\t\t\t\n");
      out.write("\t\t</TD>\n");
      out.write("\t</TR>\n");
      out.write("</TABLE>\n");
      out.write("                  \n");
      out.write("</BODY>                     \n");
      out.write("</HTML>");
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
