<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.*"%>
<%@page import="bean.*"%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
int MAX = 1024*1024*20;
String rootPath = request.getSession().getServletContext().getRealPath("/");
String savePath = rootPath + "filesave";
MultipartRequest multipartRequest = new MultipartRequest(request, savePath, MAX, "UTF-8", new DefaultFileRenamePolicy());

Article ariticle = new Article();
ArticleDao dao = new ArticleDaoFactory().articleDao();
String filename = dao.controlFileUpload(multipartRequest);

ariticle.setNum(Integer.parseInt(multipartRequest.getParameter("num")));
ariticle.setName(multipartRequest.getParameter("name"));
ariticle.setPass(multipartRequest.getParameter("pass"));
ariticle.setEmail(multipartRequest.getParameter("email"));
ariticle.setTitle(multipartRequest.getParameter("title"));
ariticle.setContents(multipartRequest.getParameter("contents"));
ariticle.setFilename(filename);

dao.reply(ariticle);

response.sendRedirect("./listboard.jsp"); 
%>
