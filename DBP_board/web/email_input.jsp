<%@page import="dao.*"%>
<%@page contentType = "text/html; charset=UTF-8" %>
<%@ page import="java.util.*,java.io.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<% 
String to   = request.getParameter("toemail"); 
String title  = request.getParameter("title");
String contents  = request.getParameter("contents");

ArticleDao dao = new ArticleDaoFactory().articleDao();
dao.sendMail(to, title, contents);

response.sendRedirect("listboard.jsp"); 
%>