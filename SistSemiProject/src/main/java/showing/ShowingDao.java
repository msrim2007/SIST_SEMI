package showing;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import mysql.db.DbConnect;

public class ShowingDao {
	DbConnect db = new DbConnect();
	
	public ArrayList<ShowingDto> getList(int startRow, int endRow) {
		String sql = "SELECT * FROM showing ORDER BY show_num LIMIT " + startRow + ", " + endRow;
		ArrayList<ShowingDto> dtos = new ArrayList<ShowingDto>();
		ShowingDto dto;
		
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				dto = new ShowingDto();
				dto.setMovie_num(rs.getString("movie_num"));
				dto.setShow_num(rs.getString("show_num"));
				dto.setShowing_date(rs.getTimestamp("showing_date"));
				dtos.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		
		return dtos;
	}
	
	public int getTotalRows() {
		int count = 0;
		
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT COUNT(show_num) FROM showing");
			int index = 0;
			if (rs.next()) {
				count = rs.getInt(++index);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		
		return count;
	}
}
