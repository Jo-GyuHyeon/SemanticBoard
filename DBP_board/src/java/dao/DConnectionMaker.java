package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DConnectionMaker implements ConnectionMaker {
	public Connection makeConnection() throws ClassNotFoundException,
			SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection c = DriverManager.getConnection(
				"jdbc:oracle:thin:@dalma.dongguk.ac.kr:1521:stud2", "kuhyun1993", "rbgus123");
		return c;
	}
}
