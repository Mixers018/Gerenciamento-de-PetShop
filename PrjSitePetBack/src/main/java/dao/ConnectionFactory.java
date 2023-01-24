package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	public Connection conexao() throws SQLException, ClassNotFoundException{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String url = "jdbc:sqlserver://localhost:1433;databaseName=Petback;";
		String user = "sa";
		String password = "etesp";
		Connection conn = DriverManager.getConnection(url, user,password);
		return conn;
		
	}
}
