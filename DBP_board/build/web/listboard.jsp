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
            <!--
            a:link		{font-family:"";color:black;text-decoration:none;}
            a:visited	{font-family:"";color:black;text-decoration:none;}
            a:hover		{font-family:"";color:black;text-decoration:underline;}
            -->
        </style>

    </HEAD>
    <BODY>

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

    <center><font size='3'><b> 게시판 </b></font></TD>


    <table class="ui unstackable table">
        <thead>
            <tr>
                <th><center><b>번호</b></center></th>
        <th><center><b>글 제목</b></center></th>
        <th><center><b>작성자</b></center></th>
        <th><center><b>작성일</b></center></th>
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
                <td ><%=listnum%></td>
                <td ><a href="write_output.jsp?num=<%=listnum%>"><%=title%></a></td>
                <td ><a href="email.jsp?num=<%=listnum%>"><%=name%></a></td>
                <td ><%=writedate%></td>
                <td ><%=readcount%></td>
            </tr>
        </tbody>


        <%
            }
        %>

    </table>    
    <table class="ui celled table">  

        <tfoot>
            <tr><th colspan="3">
                    <div class="ui right floated pagination menu">
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
                        <a class="icon item" href="./listboard.jsp?pageNum=<%=paging.getStartPage()%>">[다음]</a>
                        <%
                            }
                        %>  
                    </div>
                </th>
            </tr></tfoot>
    </table>


    <TABLE border=0 width=600>
        <TR>
            <TD align='center'>	
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
            <TD align='right'>		
                <button class="ui button" onclick='boardWrite(<%=pageNum%>)'>등록</button>
            </TD>
        </TR>
    </TABLE>  
</BODY>                     
</HTML>
