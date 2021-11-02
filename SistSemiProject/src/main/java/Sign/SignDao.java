package Sign;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import mysql.db.DbConnect;

public class SignDao {

	DbConnect db=new DbConnect();
	
	//insert
	public void insertMember(SignDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into member(id,pass1,pass2,birth,hp,email) values(?,?,?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass1());
			pstmt.setString(3, dto.getPass2());
			pstmt.setString(4, dto.getBirth());
			pstmt.setString(5, dto.getHp());
			pstmt.setString(6, dto.getEmail());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
		
}
