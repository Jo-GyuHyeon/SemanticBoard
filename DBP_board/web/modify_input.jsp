<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "bean.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%--
Document : modify_input.jsp
Content : 게시물 수정 비밀번호 확인 
Created on : 2016. 5. 29, 오후 5:28:07
Author : Team_dongguk(하헌우, 황호찬, 조규현)
--%>
<%
    String num = request.getParameter("num");
    String pass = request.getParameter("pass");

    ArticleDao dao = new ArticleDaoFactory().articleDao();      //ArticleDaoFactory를 이용하여 dao 객체 생성한다.
    String goodpass = dao.getPass(num).trim();                  //dao 객체를 이용하여 게시글에 대한 password 가져온다

    if (pass.equals(goodpass)) {
        response.sendRedirect("./modify.jsp?num=" + num);
    } else {
        response.sendRedirect("./modify_pass.jsp?num=" + num);
    }

%>
