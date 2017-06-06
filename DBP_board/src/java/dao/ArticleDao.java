package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import bean.Article;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class ArticleDao {

    private ConnectionMaker connectionMaker;
    private Connection c = null;
    private PreparedStatement ps = null;
    private PreparedStatement pstmt1 = null, pstmt2 = null;
    private ResultSet rs = null;
    private List list = null;
    private String strSQL = null;

    public ArticleDao(ConnectionMaker simpleConnectionMaker) {
        this.connectionMaker = simpleConnectionMaker;
    }

    public ArticleDao() {
    }

    public List getDBAll(int startRow, int endRow) throws ClassNotFoundException, SQLException {
        list = new ArrayList();
        c = this.connectionMaker.makeConnection();
        strSQL = "SELECT * FROM tblboard  WHERE num BETWEEN ? and ?" + "ORDER BY num DESC";
        ps = c.prepareStatement(strSQL);
        ps.setInt(1, startRow);
        ps.setInt(2, endRow);
        rs = ps.executeQuery();
        while (rs.next()) {
            Article ariticle = new Article();
            ariticle.setNum(rs.getInt("num"));
            ariticle.setName(rs.getString("name"));
            ariticle.setPass(rs.getString("pass"));
            ariticle.setEmail(rs.getString("email"));
            ariticle.setTitle(rs.getString("title"));
            ariticle.setContents(rs.getString("contents"));
            ariticle.setWritedate(rs.getString("writedate"));
            ariticle.setReadcount(rs.getInt("readcount"));
            ariticle.setFilename(rs.getString("filename"));
            list.add(ariticle);
        }
        rs.close();
        ps.close();
        c.close();
        return list;

    }

    public List getKeyDBAll(int startRow, int endRow, String key, String keyword) throws ClassNotFoundException, SQLException {
        strSQL = "select * from(select s.*,ROW_NUMBER() OVER (ORDER BY 1)as keynumber from TBLBOARD s where " + key + " like ? )where keynumber between ? and ? order by keynumber desc";
        //        strSQL = "SELECT * FROM tblboard WHERE " + key + " like ? ORDER BY num DESC";
        list = new ArrayList();
        c = this.connectionMaker.makeConnection();
        ps = c.prepareStatement(strSQL);
        ps.setString(1, "%" + keyword + "%");
        ps.setInt(2, startRow);
        ps.setInt(3, endRow);
        rs = ps.executeQuery();
        while (rs.next()) {
            Article ariticle = new Article();
            ariticle.setNum(rs.getInt("num"));
            ariticle.setName(rs.getString("name"));
            ariticle.setPass(rs.getString("pass"));
            ariticle.setEmail(rs.getString("email"));
            ariticle.setTitle(rs.getString("title"));
            ariticle.setContents(rs.getString("contents"));
            ariticle.setWritedate(rs.getString("writedate"));
            ariticle.setReadcount(rs.getInt("readcount"));
            ariticle.setFilename(rs.getString("filename"));
            list.add(ariticle);
        }
        rs.close();
        ps.close();
        c.close();
        return list;

    }

    public List getSelectDBAll(int startRow, int endRow, String key, String keyword) throws ClassNotFoundException, SQLException {
        list = new ArrayList();
        c = this.connectionMaker.makeConnection();
        if (key == null || keyword == null) {
            strSQL = "SELECT * FROM tblboard  WHERE num BETWEEN ? and ?" + "ORDER BY num DESC";
            ps = c.prepareStatement(strSQL);
            ps.setInt(1, startRow);
            ps.setInt(2, endRow);
        } else {
            strSQL = "SELECT * FROM tblboard WHERE " + key + " like ? ORDER BY num DESC";
            ps = c.prepareStatement(strSQL);
            ps.setString(1, "%" + keyword + "%");
        }
        rs = ps.executeQuery();
        while (rs.next()) {
            Article ariticle = new Article();
            ariticle.setNum(rs.getInt("num"));
            ariticle.setName(rs.getString("name"));
            ariticle.setPass(rs.getString("pass"));
            ariticle.setEmail(rs.getString("email"));
            ariticle.setTitle(rs.getString("title"));
            ariticle.setContents(rs.getString("contents"));
            ariticle.setWritedate(rs.getString("writedate"));
            ariticle.setReadcount(rs.getInt("readcount"));
            ariticle.setFilename(rs.getString("filename"));
            list.add(ariticle);
        }
        rs.close();
        ps.close();
        c.close();
        return list;

    }

    public int getLastRow() throws ClassNotFoundException, SQLException {
        int num = 0;
        strSQL = "SELECT * FROM tblboard";
        c = this.connectionMaker.makeConnection();
        ps = c.prepareStatement(strSQL);
        rs = ps.executeQuery();
        while (rs.next()) {
            num = rs.getInt("num");
        }

        rs.close();
        ps.close();
        c.close();

        return num;
    }

    public int keyLastRow(String key, String keyword) throws ClassNotFoundException, SQLException {
        int num = 0;
        strSQL = null;
        strSQL = "SELECT count(*) FROM tblboard WHERE " + key + " like ?";
        c = this.connectionMaker.makeConnection();
        ps = c.prepareStatement(strSQL);
        ps.setString(1, "%" + keyword + "%");
        rs = ps.executeQuery();
        while (rs.next()) {
            num = rs.getInt(1);
        }

        rs.close();
        ps.close();
        c.close();

        return num;
    }

    public int getSelectLastRow(String key, String keyword) throws ClassNotFoundException, SQLException {
        int num = 0;
        strSQL = null;
        c = this.connectionMaker.makeConnection();
        if (key == null || keyword == null) {
            strSQL = "SELECT count(*) FROM tblboard";
            ps = c.prepareStatement(strSQL);
        } else {
            strSQL = "SELECT count(*) FROM tblboard WHERE " + key + " like ?";
            ps = c.prepareStatement(strSQL);
            ps.setString(1, "%" + keyword + "%");
        }
        rs = ps.executeQuery();
        while (rs.next()) {
            num = rs.getInt(1);
        }

        rs.close();
        ps.close();
        c.close();

        return num;
    }

    public void write(Article ariticle) throws ClassNotFoundException, SQLException {

        Calendar dateIn = Calendar.getInstance();
        String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
        indate = indate + Integer.toString(dateIn.get(Calendar.MONTH) + 1) + "-";
        indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
        indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
        indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
        indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));

        c = this.connectionMaker.makeConnection();

        String MaxstrSQL = "SELECT Max(num) FROM tblboard";
        ps = c.prepareStatement(MaxstrSQL);
        rs = ps.executeQuery();
        int num = 1;

        if (rs.next()) {
            num = rs.getInt(1) + 1;
        }

        strSQL = "INSERT INTO tblboard(num, name, pass, email, title, contents, writedate, readcount, filename)";
        strSQL = strSQL + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        ps = c.prepareStatement(strSQL);
        ps.setInt(1, num);
        ps.setString(2, ariticle.getName());
        ps.setString(3, ariticle.getPass());
        ps.setString(4, ariticle.getEmail());
        ps.setString(5, ariticle.getTitle());
        ps.setString(6, ariticle.getContents());
        ps.setString(7, indate);
        ps.setInt(8, 0);
        ps.setString(9, ariticle.getFilename());

        ps.executeUpdate();

        ps.close();
        c.close();
    }

    public void reply(Article ariticle) throws ClassNotFoundException, SQLException {

        Calendar dateIn = Calendar.getInstance();
        String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
        indate = indate + Integer.toString(dateIn.get(Calendar.MONTH) + 1) + "-";
        indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
        indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
        indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
        indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));

        c = this.connectionMaker.makeConnection();

        strSQL = "UPDATE tblboard SET num = num + 1 WHERE num = " + ariticle.getNum() + " OR num > " + ariticle.getNum();
        System.out.print(ariticle.getNum());
        pstmt1 = c.prepareStatement(strSQL);
        pstmt1.executeUpdate();

        strSQL = "INSERT INTO tblboard(num, name, pass, email, title, contents, writedate, readcount, filename)";
        strSQL = strSQL + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        pstmt2 = c.prepareStatement(strSQL);
        pstmt2.setInt(1, ariticle.getNum());
        pstmt2.setString(2, ariticle.getName());
        pstmt2.setString(3, ariticle.getPass());
        pstmt2.setString(4, ariticle.getEmail());
        pstmt2.setString(5, ariticle.getTitle());
        pstmt2.setString(6, ariticle.getContents());
        pstmt2.setString(7, indate);
        pstmt2.setInt(8, 0);
        pstmt2.setString(9, ariticle.getFilename());
        pstmt2.executeUpdate();
        pstmt1.close();
        pstmt2.close();
        c.close();
    }

    public void update(Article ariticle) throws ClassNotFoundException, SQLException {
        strSQL = "UPDATE tblboard SET name=?, pass=?, email=?, title=?, contents=?, writedate=?, filename = ? WHERE num=?";
        Calendar dateIn = Calendar.getInstance();
        String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
        indate = indate + Integer.toString(dateIn.get(Calendar.MONTH) + 1) + "-";
        indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
        indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
        indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
        indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));

        c = this.connectionMaker.makeConnection();
        ps = c.prepareStatement(strSQL);
        ps.setString(1, ariticle.getName());
        ps.setString(2, ariticle.getPass());
        ps.setString(3, ariticle.getEmail());
        ps.setString(4, ariticle.getTitle());
        ps.setString(5, ariticle.getContents());
        ps.setString(6, indate);
        ps.setString(7, ariticle.getFilename());
        ps.setInt(8, ariticle.getNum());
        ps.executeUpdate();

        ps.close();
        c.close();
    }

    public Article getArticle(String num) throws ClassNotFoundException, SQLException {
        strSQL = "SELECT * FROM tblboard WHERE num = ?";
        c = this.connectionMaker.makeConnection();
        ps = c.prepareStatement(strSQL);
        ps.setInt(1, Integer.parseInt(num));
        rs = ps.executeQuery();
        rs.next();
        Article ariticle = new Article();
        ariticle.setNum(rs.getInt("num"));
        ariticle.setName(rs.getString("name"));
        ariticle.setPass(rs.getString("pass"));
        ariticle.setEmail(rs.getString("email"));
        ariticle.setTitle(rs.getString("title"));
        ariticle.setContents(rs.getString("contents"));
        ariticle.setWritedate(rs.getString("writedate"));
        ariticle.setReadcount(rs.getInt("readcount"));
        ariticle.setFilename(rs.getString("filename"));
        rs.close();
        ps.close();
        c.close();
        return ariticle;
    }

    public void update_readcount(String num) throws ClassNotFoundException, SQLException {
        strSQL = "UPDATE tblboard SET readcount=readcount+1 WHERE num = ?";
        c = this.connectionMaker.makeConnection();
        ps = c.prepareStatement(strSQL);
        ps.setInt(1, Integer.parseInt(num));
        ps.executeUpdate();

        rs.close();
        ps.close();
        c.close();
    }

    public String getPass(String num) throws ClassNotFoundException, SQLException {
        strSQL = "SELECT pass FROM tblboard WHERE num = ?";
        String password = null;

        c = this.connectionMaker.makeConnection();
        ps = c.prepareStatement(strSQL);
        ps.setInt(1, Integer.parseInt(num));
        rs = ps.executeQuery();
        rs.next();

        password = rs.getString("pass").trim();
        System.out.println(password);
        rs.close();
        ps.close();
        c.close();
        return password;
    }

    public void delete(String num) throws ClassNotFoundException, SQLException {
        c = this.connectionMaker.makeConnection();
        strSQL = "DELETE From tblboard WHERE num=?";
        ps = c.prepareStatement(strSQL);
        ps.setInt(1, Integer.parseInt(num));
        ps.executeUpdate();

        strSQL = "UPDATE tblboard SET num = num - 1 WHERE num > ?";
        ps = c.prepareStatement(strSQL);
        ps.setInt(1, Integer.parseInt(num));
        ps.executeUpdate();

        ps.close();
        c.close();
    }

    public String controlFileUpload(MultipartRequest multipartRequest) {

        String uploadFileName = "";
        String originFileName = "";

        try {
            uploadFileName = multipartRequest.getFilesystemName("attachmentName");
            originFileName = multipartRequest.getOriginalFileName("attachmentName");
            File file = multipartRequest.getFile("attachmentName");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return uploadFileName;
    }

    public String getFilename(String num) throws ClassNotFoundException, SQLException {
        c = this.connectionMaker.makeConnection();
        strSQL = "select filename from tblboard where num = ?";
        ps = c.prepareStatement(strSQL);
        ps.setInt(1, Integer.parseInt(num));
        rs = ps.executeQuery();
        rs.next();
        String filename = rs.getString("filename");
        return filename;
    }

    public String getMailInfo(String num) throws ClassNotFoundException, SQLException {
        c = this.connectionMaker.makeConnection();
        strSQL = "SELECT email, title, contents FROM tblboard WHERE num = ?";
        ps = c.prepareStatement(strSQL);
        ps.setInt(1, Integer.parseInt(num));
        rs = ps.executeQuery();
        rs.next();
        String mail = rs.getString("email");

        return mail;
    }

    public void sendMail(String to, String title, String contents) {
        try {
            Properties props = new Properties();
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "587");

            Authenticator auth = new GoogleMailAuthentication();
            Session session = Session.getDefaultInstance(props, auth);

            MimeMessage msg = new MimeMessage(session);

            InternetAddress[] address = {new InternetAddress(to)};

            msg.setRecipients(Message.RecipientType.TO, address);

            msg.setSubject(title);
            msg.setSentDate(new java.util.Date());
            msg.setContent(contents, "text/html;charset=UTF-8");

            Transport.send(msg);

        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
