<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "bean.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
    String num = request.getParameter("num");
    String pass = request.getParameter("pass");

    ArticleDao dao = new ArticleDaoFactory().articleDao();
    String goodpass = dao.getPass(num).trim();

    if (pass.equals(goodpass)) {
        response.sendRedirect("./modify.jsp?num=" + num);
    } else {
        response.sendRedirect("./modify_pass.jsp?num=" + num);
    }

%>
