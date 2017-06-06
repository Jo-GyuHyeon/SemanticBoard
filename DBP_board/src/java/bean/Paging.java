/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import dao.*;
import java.sql.SQLException;


/**
 *
 * @author jo
 */
public class Paging {

    private int total;
    private int currentPage;
    private int totalPages;
    private int startPage;
    private int endPage;
   // private int pageSize;
    private String pageNum;
    private int listSize = 10;
    private  ArticleDao dao;
    private int lastRow;

    public Paging(int total, int currentPage, int size, int pageSize) {
        this.total = total;
        this.currentPage = currentPage;
        if (total == 0) {
            totalPages = 0;
            startPage = 0;
            endPage = 0;
        } else {
            totalPages = total / size;
            if (total % size > 0) {
                totalPages++;
            }
            int modVal = currentPage % pageSize;
            startPage = currentPage / pageSize * pageSize + 1;
            if (modVal == 0) {
                startPage -= pageSize;
            }

            endPage = startPage + (pageSize-1);
            if (endPage > totalPages) {
                endPage = totalPages;
            }
        }
    }
    public Paging(){}
    public int getTotal() {return total;}
    public boolean hasNoArticles() {return total == 0;}
    public boolean hasArticles() {return total > 0;}
    public int getCurrentPage() {return currentPage;}
    public int getTotalPages() {return totalPages;}
    public int getStartPage() {return startPage;}
    public int getEndPage() {return endPage;}
    public void setStartPage(int startPage){this.startPage = startPage;}
    public String getPageNum(String num) throws ClassNotFoundException, SQLException{
        this.dao = new ArticleDaoFactory().articleDao(); 
        lastRow= dao.getLastRow();
        pageNum = ((lastRow - Integer.parseInt(num)) / listSize) + 1 + "";
        return pageNum;
    }
}

