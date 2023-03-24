import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	private String userID;
	private String userPW;
	
	private Connection con;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/test?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "test";
			String dbPwd = "test";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public int login(String userID, String UserPW) {
		try { 
			PreparedStatement pst = con.prepareStatement("SELECT userpw FROM test_db WHERE userid = ?"); 
			pst.setString(1, userID); 
			rs = pst.executeQuery();
			if (rs.next()) { 
				return rs.getString(1).equals(UserPW) ? 1 : 0; 
				} else {
					return -2; 
					} 
			} catch (Exception e) { e.printStackTrace(); return -1; }
	}
}
