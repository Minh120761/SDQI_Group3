package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import modal.LoginBean;

public class LoginDao {

	
	public boolean validate(LoginBean loginBean) throws ClassNotFoundException {
		boolean status = false;

		Class.forName("org.postgresql.Driver");

		try 
		{
			Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/trail","postgres","root");
				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = con.prepareStatement("select * from adminn where email = ? and password = ? "); 
			preparedStatement.setString(1, loginBean.getAdminEmail());
			preparedStatement.setString(2, loginBean.getAdminPassword());

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();

		} catch (SQLException e) {
			// process sql exception
			e.printStackTrace(); 
			
		}
		return status;
	}

	
	
}
