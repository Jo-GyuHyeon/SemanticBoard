/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author HHC
 */
public class HHCConnectionMaker implements ConnectionMaker{     ////황호찬의 DB Connectio 정보
    public Connection makeConnection() throws ClassNotFoundException,
			SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection c = DriverManager.getConnection(
				"jdbc:oracle:thin:@dalma.dongguk.ac.kr:1521:stud2", "kuhyun1993", "rbgus123");
		return c;
	}
}
