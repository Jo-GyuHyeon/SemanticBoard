<%@page import="java.io.*"%>
<%@page import="dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String num = request.getParameter("num");
    ArticleDao dao = new ArticleDaoFactory().articleDao();
    String filename = dao.getFilename(num);
    String filename2 = new String(filename.getBytes("KSC5601"), "8859_1");
    String rootPath = request.getSession().getServletContext().getRealPath("/");
    String savePath = rootPath + "filesave";
    File file = new File(savePath + "/" + filename);
    out.println(savePath + "/" + filename);
    byte b[] = new byte[(int)file.length()];
    response.setHeader("Content-Disposition", "attachment;filename=" + filename2 + ";");
    if (file.isFile())
    {
	BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
	BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
	int read = 0;
	while ((read = fin.read(b)) != -1){
		outs.write(b,0,read);
	}
	outs.close();
	fin.close();
    }
%>
