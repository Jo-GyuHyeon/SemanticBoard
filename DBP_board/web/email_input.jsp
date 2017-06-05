<%@page import="dao.*"%>
<%@page contentType = "text/html; charset=UTF-8" %>
<%@ page import="java.util.*,java.io.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%--
Document : email_input.jsp
Content : 이메일 전송 
Created on : 2016. 5. 29, 오후 5:28:07
Author : Team_dongguk(하헌우, 황호찬, 조규현)
--%>

<%
    String to = request.getParameter("toemail");
    String title = request.getParameter("title");
    String contents = request.getParameter("contents");

    ArticleDao dao = new ArticleDaoFactory().articleDao();
    dao.sendMail(to, title, contents);

    response.sendRedirect("listboard.jsp");
%>