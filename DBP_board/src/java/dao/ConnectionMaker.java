package dao;

import java.sql.Connection;
import java.sql.SQLException;

public interface ConnectionMaker {  //DB connection 인터페이스

	public abstract Connection makeConnection() throws ClassNotFoundException,
			SQLException;

}