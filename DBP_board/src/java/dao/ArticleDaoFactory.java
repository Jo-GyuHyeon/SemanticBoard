package dao;

public class ArticleDaoFactory {
	public  ArticleDaoFactory() {
	}
	public ArticleDao articleDao() {    //articleDao 객체 리턴
		ArticleDao dao = new ArticleDao(connectionMaker());
		return dao;
	}

	public ConnectionMaker connectionMaker() {  //인터페이스 구현 객체 리턴 메소드 
		ConnectionMaker connectionMaker = new JGHConnectionMaker();
		return connectionMaker;
	}
}
