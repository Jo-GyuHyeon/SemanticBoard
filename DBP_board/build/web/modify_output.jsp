<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.*"%>
<%@page import="bean.*"%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%--
Document : modify_output.jsp
Content : 게시물 수정 
Created on : 2016. 5. 29, 오후 5:28:07
Author : Team_dongguk(하헌우, 황호찬, 조규현)
--%>
<%
    int MAX = 1024*1024*20; //최대 크기
    String rootPath = request.getSession().getServletContext().getRealPath("/");
    String savePath = rootPath + "filesave";        //경로 설정
    MultipartRequest multipartRequest = new MultipartRequest(request, savePath, MAX, "UTF-8", new DefaultFileRenamePolicy());
//MultipartRequest객체 생성, 생성과 동시에 파일 업로드
    Article ariticle = new Article();
    ArticleDao dao = new ArticleDaoFactory().articleDao();  
 
    //Article 객체에 저장하여 write메소드 실행
    ariticle.setName(multipartRequest.getParameter("name"));
    ariticle.setPass(multipartRequest.getParameter("pass"));
    ariticle.setEmail(multipartRequest.getParameter("email"));
    ariticle.setTitle(multipartRequest.getParameter("title"));
    ariticle.setContents(multipartRequest.getParameter("contents"));
    ariticle.setFilename(dao.controlFileUpload(multipartRequest));
    dao.update(ariticle);                                              //dao 객체를 이용하여 게시글 수정

    response.sendRedirect("./listboard.jsp");
%>
