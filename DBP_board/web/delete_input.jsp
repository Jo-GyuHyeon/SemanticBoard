<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.*"%>
<%@ page import="bean.*"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%--
Document : delete_input.jsp
Content : 게시물 삭제
Created on : 2016. 5. 29, 오후 5:28:07
Author : Team_dongguk(하헌우, 황호찬, 조규현)
--%>

<%
    String num = request.getParameter("num");
    String pass = request.getParameter("pass");

    ArticleDao dao = new ArticleDaoFactory().articleDao();  //ArticleDaoFactory를 이용하여 dao 객체 생성한다.
    String goodpass = dao.getPass(num).trim(); //DB로 부터게시글의 패스워드를 가져온다.

    if (pass.equals(goodpass)) {
        dao.delete(num);
        response.sendRedirect("./listboard.jsp");
    } else {
        response.sendRedirect("./delete_pass.jsp?num=" + num);
    }

%>
